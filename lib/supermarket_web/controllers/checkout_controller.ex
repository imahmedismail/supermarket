defmodule SupermarketWeb.CheckoutController do
  use SupermarketWeb, :controller
  alias Supermarket.Checkout

  def calculate(conn, %{"products" => products}) do
    checkout = Enum.reduce(products, Checkout.new(), fn product, acc ->
      Checkout.scan(acc, product)
    end)

    total = Checkout.total(checkout)
    json(conn, %{total: total})
  end
end
