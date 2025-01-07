package ku.shop;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import static org.junit.jupiter.api.Assertions.*;

public class BuyStepdefs {

    private ProductCatalog catalog;
    private Order order;

    @Given("the store is ready to service customers")
    public void the_store_is_ready_to_service_customers() {
        catalog = new ProductCatalog();
        order = new Order();
    }

    @Given("a product {string} with price {float} and stock of {int} exists")
    public void a_product_exists(String name, double price, int stock) {
        catalog.addProduct(name, price, stock);
    }

    @When("I buy {string} with quantity {int}")
    public void i_buy_with_quantity(String name, int quantity) throws NotEnoughStockException {
        Product prod = catalog.getProduct(name);
        order.addItem(prod, quantity);
    }

    @When("I over-ordered {string} with quantity {int}")
    public void i_over_ordered_quantity(String name, int quantity) throws NotEnoughStockException {
        Product prod = catalog.getProduct(name);
        assertThrows(NotEnoughStockException.class, () -> order.addItem(prod, quantity));
    }

    @Then("total should be {float}")
    public void total_should_be(double total) {
        assertEquals(total, order.getTotal());
    }

    @Then("stock of {string} should be {int}")
    public void stock_of_stock_should_be(String name, int quantity) {
        Product prod = catalog.getProduct(name);
        assertEquals(quantity, prod.getStock());
    }
}

