defmodule Supermarket.Checkout.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :product_code, :string
    field :price, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:product_code, :name, :price])
    |> validate_required([:product_code, :name, :price])
    |> unique_constraint(:product_code)
  end
end
