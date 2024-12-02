defmodule Supermarket.Checkout do
  @moduledoc """
  The Checkout context.
  """

  alias Supermarket.PricingRules

  defstruct products: [], rules: []

  def new() do
    rules = PricingRules.rules()
    %__MODULE__{rules: rules}
  end

  def scan(checkout, product_code) do
    %{checkout | products: checkout.products ++ [product_code]}
  end

  def total(%__MODULE__{products: products, rules: rules}) do
    products
    |> Enum.group_by(& &1)
    |> Enum.reduce(0, fn {product_code, items}, acc ->
      rule = Enum.find(rules, fn %{product_code: pc} -> pc == product_code end)
      acc + apply_rule(rule, length(items))
    end)
  end

  defp apply_rule(%{price: price, discount: discount_fn}, quantity) do
    discount_fn.(price, quantity)
  end

  defp apply_rule(%{price: price}, quantity), do: price * quantity
end
