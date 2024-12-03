defmodule Supermarket.Checkout do
  @moduledoc """
  This module is responsible for managing the checkout process.
  """

  alias Supermarket.PricingRules

  defstruct products: [], rules: []

  @doc """
  Create a new checkout instance

  ## Example
    iex> checkout = Checkout.new()
    %Supermarket.Checkout{products: [], rules: []}
  """
  @spec new() :: %__MODULE__{}
  def new() do
    rules = PricingRules.rules()
    %__MODULE__{rules: rules}
  end

  @doc """
  Scan a product in the checkout

  ## Parameters
    * `checkout` - The checkout instance
    * `product_code` - The product code to scan

  ## Example
    iex> checkout = Checkout.new()
    %Supermarket.Checkout{products: [], rules: []}
    iex> Checkout.scan(checkout, "VOUCHER")
    %Supermarket.Checkout{products: ["VOUCHER"], rules: []}
  """
  @spec scan(%__MODULE__{}, String.t()) :: %__MODULE__{}
  def scan(checkout, product_code) do
    %{checkout | products: checkout.products ++ [product_code]}
  end

  @doc """
  Calculate the total of the products in the checkout

  ## Parameters
    * `checkout` - The checkout instance

  ## Example
    iex> checkout = Checkout.new()
    %Supermarket.Checkout{products: [], rules: []}
    iex> checkout = Checkout.scan(checkout, "VOUCHER")
    %Supermarket.Checkout{products: ["VOUCHER"], rules: []}
    iex> Checkout.total(checkout)
    5.0
  """
  @spec total(%__MODULE__{}) :: number
  def total(%__MODULE__{products: products, rules: rules}) do
    products
    |> Enum.group_by(& &1)
    |> Enum.reduce(0, fn {product_code, items}, acc ->
      rule = Enum.find(rules, fn %{product_code: pc} -> pc == product_code end)
      acc + apply_rule(rule, length(items))
    end)
  end

  ## Private functions
  ## ---------------------------------------------------------------------------
  ## Apply the pricing rule to the product
  ## ---------------------------------------------------------------------------
  defp apply_rule(%{price: price, discount: discount_fn}, quantity) do
    discount_fn.(price, quantity)
  end

  ## ---------------------------------------------------------------------------
  ## Apply the pricing rule to the product
  ## ---------------------------------------------------------------------------
  defp apply_rule(%{price: price}, quantity), do: price * quantity
end
