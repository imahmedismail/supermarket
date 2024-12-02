defmodule Supermarket.Checkout.PricingRule do
  use Ecto.Schema
  import Ecto.Changeset

  alias Supermarket.Checkout.Product

  schema "pricing_rules" do
    field :rule_type, :string
    field :discount_function, :map

    belongs_to :product, Product

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(pricing_rule, attrs) do
    pricing_rule
    |> cast(attrs, [:rule_type, :discount_function, :product_id])
    |> validate_required([:rule_type, :product_id])
  end
end
