defmodule Supermarket.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :product_code, :string
      add :name, :string
      add :price, :decimal

      timestamps(type: :utc_datetime)
    end

    create unique_index(:products, [:product_code])
  end
end
