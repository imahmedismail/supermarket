defmodule Supermarket.Checkout do
  @moduledoc """
  The Checkout context.
  """

  import Ecto.Query, warn: false
  alias Supermarket.Repo

  alias Supermarket.Checkout.Product
  alias Supermarket.Checkout.PricingRule

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{data: %Product{}}

  """
  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end

  @doc """
  Returns the list of pricing_rules.

  ## Examples

      iex> list_pricing_rules()
      [%PricingRule{}, ...]

  """
  def list_pricing_rules do
    Repo.all(PricingRule)
  end

  @doc """
  Gets a single pricing_rule.

  Raises `Ecto.NoResultsError` if the Pricing rule does not exist.

  ## Examples

      iex> get_pricing_rule!(123)
      %PricingRule{}

      iex> get_pricing_rule!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pricing_rule!(id), do: Repo.get!(PricingRule, id)

  @doc """
  Creates a pricing_rule.

  ## Examples

      iex> create_pricing_rule(%{field: value})
      {:ok, %PricingRule{}}

      iex> create_pricing_rule(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pricing_rule(attrs \\ %{}) do
    %PricingRule{}
    |> PricingRule.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pricing_rule.

  ## Examples

      iex> update_pricing_rule(pricing_rule, %{field: new_value})
      {:ok, %PricingRule{}}

      iex> update_pricing_rule(pricing_rule, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pricing_rule(%PricingRule{} = pricing_rule, attrs) do
    pricing_rule
    |> PricingRule.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pricing_rule.

  ## Examples

      iex> delete_pricing_rule(pricing_rule)
      {:ok, %PricingRule{}}

      iex> delete_pricing_rule(pricing_rule)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pricing_rule(%PricingRule{} = pricing_rule) do
    Repo.delete(pricing_rule)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pricing_rule changes.

  ## Examples

      iex> change_pricing_rule(pricing_rule)
      %Ecto.Changeset{data: %PricingRule{}}

  """
  def change_pricing_rule(%PricingRule{} = pricing_rule, attrs \\ %{}) do
    PricingRule.changeset(pricing_rule, attrs)
  end
end
