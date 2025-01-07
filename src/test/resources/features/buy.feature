Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Pasta" with price 100.00 and stock of 15 exists

Scenario: Buy one product
    When I buy "Bread" with quantity 2
    Then total should be 41.00

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    Then total should be 121.00

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    And I buy "Pasta" with quantity 1
    Then total should be 221.00

Scenario: Ordering more than available stock
    When I over-ordered "Bread" with quantity 6
    Then stock of "Bread" should be 5

Scenario: Ordering more than available stock
    When I over-ordered "Bread" with quantity 6
    Then total should be 0

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    And I over-ordered "Pasta" with quantity 20
    Then total should be 121.00

Scenario Outline: Buy one product
   When I buy <product> with quantity <quantity>
   Then total should be <total>
   Examples:
       | product  | quantity |  total  |
       | "Bread"  |     1    |   20.50 |
       | "Jam"    |     2    |  160.00 |
       | "Pasta"  |     1    |  100.00 |