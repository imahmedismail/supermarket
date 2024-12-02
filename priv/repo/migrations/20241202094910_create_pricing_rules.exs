defmodule Supermarket.Repo.Migrations.CreatePricingRules do
  use Ecto.Migration

  def change do
    create table(:pricing_rules) do
      add :rule_type, :string, null: false
      add :discount_function, :map, null: false

      add :product_id, references(:products, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end
  end
end
