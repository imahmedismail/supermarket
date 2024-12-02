defmodule Supermarket.PricingRules do
  def rules do
    [
      %{
        product_code: "GR1",
        price: 3.11,
        discount: fn price, quantity ->
          div(quantity, 2) * price + rem(quantity, 2) * price
        end
      },
      %{
        product_code: "SR1",
        price: 5.00,
        discount: fn price, quantity ->
          if quantity >= 3 do
            quantity * 4.50
          else
            quantity * price
          end
        end
      },
      %{
        product_code: "CF1",
        price: 11.23,
        discount: fn price, quantity ->
          if quantity >= 3 do
            quantity * (price * 2 / 3)
          else
            quantity * price
          end
        end
      }
    ]
  end
end
