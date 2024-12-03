# Supermarket Checkout System

A flexible and extensible **checkout system** implemented in **Elixir**, designed to handle dynamic pricing rules while maintaining simplicity and reliability. This project was developed using **Test-Driven Development (TDD)** methodology.

---

## Objectives
- **Evaluate Programming Style**: Demonstrate clean, maintainable, and idiomatic Elixir code.
- **Showcase Elixir Expertise**: Build a robust and flexible solution.
- **Test-Driven Development**: Ensure code reliability with comprehensive unit tests.

---

## Features
1. **Add Items to Cart**:
   - Dynamically add products to a shopping cart.
2. **Calculate Total**:
   - Display the total price based on the items in the cart.
3. **Customizable Pricing Rules**:
   - Flexible rules to meet stakeholder requirements:
     - **Buy-One-Get-One-Free**: Applies to "Green Tea (GR1)".
     - **Bulk Discount**: For "Strawberries (SR1)", price drops to £4.50 each if buying 3 or more.
     - **Coffee Discount**: For "Coffee (CF1)", price drops to two-thirds the original price if buying 3 or more.

---

## Test Data
### Input and Expected Results:
| Basket                     | Expected Total Price |
|----------------------------|----------------------|
| `GR1, SR1, GR1, GR1, CF1` | £22.45              |
| `GR1, GR1`                 | £3.11               |
| `SR1, SR1, GR1, SR1`       | £16.61              |
| `GR1, CF1, SR1, CF1, CF1`  | £30.57              |

---

## Development Guidelines
- **Language**: Elixir
- **Testing Framework**: ExUnit
- **Database**: Not required (in-memory state for simplicity)

---

## Usage

### Clone Repository
```bash
git clone https://github.com/imahmedismail/supermarket.git
cd supermarket
```

### Run Tests
```bash
mix test
```

### Example Usage

1. Start an Elixir interactive session:
```bash
iex -S mix
```

2. Use the Checkout module to scan items and calculate totals:
```elixir
alias Supermarket.Checkout

checkout = Checkout.new()
checkout = Checkout.scan(checkout, "GR1")
checkout = Checkout.scan(checkout, "SR1")
checkout = Checkout.scan(checkout, "GR1")
checkout = Checkout.scan(checkout, "GR1")
checkout = Checkout.scan(checkout, "CF1")
IO.puts("Total: £#{Checkout.total(checkout)}")
```

## Postman Collection

A Postman collection is included to test the checkout system's functionality with the following scenarios:

1. **Basket:** GR1, SR1, GR1, GR1, CF1

   **Expected Total Price:** £22.45
2. **Basket:** GR1, GR1

   **Expected Total Price:** £3.11
3. **Basket:** SR1, SR1, GR1, SR1

   **Expected Total Price:** £16.61
4. **Basket:** GR1, CF1, SR1, CF1, CF1

   **Expected Total Price:** £30.57

To import and use the collection:

- Just import this file supermarket_checkout.postman_collection.json from project-directory to Postman
- Test the endpoints with the predefined requests.

## Contributions

Contributions are welcome! Feel free to submit issues or create pull requests to improve this project.