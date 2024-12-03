defmodule SupermarketWeb.CheckoutController do
  use SupermarketWeb, :controller
  alias Supermarket.Checkout

  @doc """
  Calculate the total of the products in the checkout

  ## Parameters
    * `products` - A list of products to calculate the total

  ## Example
    POST /checkout
    {
      "products": ["VOUCHER", "TSHIRT", "MUG"]
    }

  ## Response
    {
      "status": "ok",
      "total": 32.5,
      "message": "Total calculated successfully"
    }
  """
  @spec calculate(conn :: Plug.Conn.t(), map) :: Plug.Conn.t()
  def calculate(conn, %{"products" => products}) do
    checkout = Enum.reduce(products, Checkout.new(), fn product, acc ->
      Checkout.scan(acc, product)
    end)

    total = Checkout.total(checkout)
    json(conn, %{status: :ok, total: total, message: "Total calculated successfully"})
  end
end
