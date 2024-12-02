defmodule Supermarket.CheckoutTest do
  use Supermarket.DataCase

  alias Supermarket.Checkout

  describe "products" do
    alias Supermarket.Checkout.Product

    import Supermarket.CheckoutFixtures

    @invalid_attrs %{name: nil, product_code: nil, price: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Checkout.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Checkout.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{name: "some name", product_code: "some product_code", price: "120.5"}

      assert {:ok, %Product{} = product} = Checkout.create_product(valid_attrs)
      assert product.name == "some name"
      assert product.product_code == "some product_code"
      assert product.price == Decimal.new("120.5")
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Checkout.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{name: "some updated name", product_code: "some updated product_code", price: "456.7"}

      assert {:ok, %Product{} = product} = Checkout.update_product(product, update_attrs)
      assert product.name == "some updated name"
      assert product.product_code == "some updated product_code"
      assert product.price == Decimal.new("456.7")
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Checkout.update_product(product, @invalid_attrs)
      assert product == Checkout.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Checkout.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Checkout.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Checkout.change_product(product)
    end
  end
end
