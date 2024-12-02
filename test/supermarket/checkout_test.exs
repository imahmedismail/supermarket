defmodule SupermarketCheckoutTest do
  use ExUnit.Case
  alias Supermarket.Checkout

  test "calculate total for various baskets" do
    checkout = Checkout.new()

    # Test Scenario 1
    checkout =
      checkout
      |> Checkout.scan("GR1")
      |> Checkout.scan("SR1")
      |> Checkout.scan("GR1")
      |> Checkout.scan("GR1")
      |> Checkout.scan("CF1")

    assert Checkout.total(checkout) == 22.45

    # Test Scenario 2
    checkout = Checkout.new()
    checkout =
      checkout
      |> Checkout.scan("GR1")
      |> Checkout.scan("GR1")

    assert Checkout.total(checkout) == 3.11

    # Test Scenario 3
    checkout = Checkout.new()
    checkout =
      checkout
      |> Checkout.scan("SR1")
      |> Checkout.scan("SR1")
      |> Checkout.scan("GR1")
      |> Checkout.scan("SR1")

    assert Checkout.total(checkout) == 16.61

    # Test Scenario 4
    checkout = Checkout.new()
    checkout =
      checkout
      |> Checkout.scan("GR1")
      |> Checkout.scan("CF1")
      |> Checkout.scan("SR1")
      |> Checkout.scan("CF1")
      |> Checkout.scan("CF1")

    assert Checkout.total(checkout) == 30.57
  end
end
