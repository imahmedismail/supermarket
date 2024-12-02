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

  describe "pricing_rules" do
    alias Supermarket.Checkout.PricingRule

    import Supermarket.CheckoutFixtures

    @invalid_attrs %{product_code: nil, rule_type: nil, discount_function: nil}

    test "list_pricing_rules/0 returns all pricing_rules" do
      pricing_rule = pricing_rule_fixture()
      assert Checkout.list_pricing_rules() == [pricing_rule]
    end

    test "get_pricing_rule!/1 returns the pricing_rule with given id" do
      pricing_rule = pricing_rule_fixture()
      assert Checkout.get_pricing_rule!(pricing_rule.id) == pricing_rule
    end

    test "create_pricing_rule/1 with valid data creates a pricing_rule" do
      valid_attrs = %{product_code: "some product_code", rule_type: "some rule_type", discount_function: %{}}

      assert {:ok, %PricingRule{} = pricing_rule} = Checkout.create_pricing_rule(valid_attrs)
      assert pricing_rule.product_code == "some product_code"
      assert pricing_rule.rule_type == "some rule_type"
      assert pricing_rule.discount_function == %{}
    end

    test "create_pricing_rule/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Checkout.create_pricing_rule(@invalid_attrs)
    end

    test "update_pricing_rule/2 with valid data updates the pricing_rule" do
      pricing_rule = pricing_rule_fixture()
      update_attrs = %{product_code: "some updated product_code", rule_type: "some updated rule_type", discount_function: %{}}

      assert {:ok, %PricingRule{} = pricing_rule} = Checkout.update_pricing_rule(pricing_rule, update_attrs)
      assert pricing_rule.product_code == "some updated product_code"
      assert pricing_rule.rule_type == "some updated rule_type"
      assert pricing_rule.discount_function == %{}
    end

    test "update_pricing_rule/2 with invalid data returns error changeset" do
      pricing_rule = pricing_rule_fixture()
      assert {:error, %Ecto.Changeset{}} = Checkout.update_pricing_rule(pricing_rule, @invalid_attrs)
      assert pricing_rule == Checkout.get_pricing_rule!(pricing_rule.id)
    end

    test "delete_pricing_rule/1 deletes the pricing_rule" do
      pricing_rule = pricing_rule_fixture()
      assert {:ok, %PricingRule{}} = Checkout.delete_pricing_rule(pricing_rule)
      assert_raise Ecto.NoResultsError, fn -> Checkout.get_pricing_rule!(pricing_rule.id) end
    end

    test "change_pricing_rule/1 returns a pricing_rule changeset" do
      pricing_rule = pricing_rule_fixture()
      assert %Ecto.Changeset{} = Checkout.change_pricing_rule(pricing_rule)
    end
  end
end
