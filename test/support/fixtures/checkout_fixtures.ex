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
end
