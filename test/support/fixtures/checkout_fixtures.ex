defmodule Supermarket.CheckoutFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Supermarket.Checkout` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        name: "some name",
        price: "120.5",
        product_code: "some product_code"
      })
      |> Supermarket.Checkout.create_product()

    product
  end

  @doc """
  Generate a pricing_rule.
  """
  def pricing_rule_fixture(attrs \\ %{}) do
    {:ok, pricing_rule} =
      attrs
      |> Enum.into(%{
        discount_function: %{},
        product_code: "some product_code",
        rule_type: "some rule_type"
      })
      |> Supermarket.Checkout.create_pricing_rule()

    pricing_rule
  end
end
