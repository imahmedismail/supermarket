defmodule Supermarket.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :product_code, :string, null: false
      add :name, :string, null: false
      add :price, :decimal, null: false, scale: 2, precision: 10

      timestamps(type: :utc_datetime)
    end

    create unique_index(:products, [:product_code])
  end
end
