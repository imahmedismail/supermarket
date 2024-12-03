defmodule Supermarket.PricingRules do
  @moduledoc """
  This module is responsible for managing the pricing rules.
  """

  @doc """
  Get the pricing rules

  ## Example
    iex> PricingRules.rules()
    [
      %{
        product_code: "GR1",
        price: 3.11,
        discount: #Function<6.99386804/2 in Supermarket.PricingRules.rules/0>
      },
      %{
        product_code: "SR1",
        price: 5.0,
        discount: #Function<6.99386804/2 in Supermarket.PricingRules.rules/0>
      },
      %{
        product_code: "CF1",
        price: 11.23,
        discount: #Function<6.99386804/2 in Supermarket.PricingRules.rules/0>
      }
    ]
  """
  @spec rules() :: [map]
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
