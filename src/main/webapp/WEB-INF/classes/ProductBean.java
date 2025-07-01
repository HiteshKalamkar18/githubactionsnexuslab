package beans;

import java.sql.*;

/**
 * ProductBean is responsible for database interaction to retrieve product details.
 */
public class ProductBean {

    private String userName = "";
    private String password = "";
    private String connectionUrl = "";

    // Getters and setters with proper naming conventions
    public String getConnectionUrl() {
        return connectionUrl;
    }

    public void setConnectionUrl(String connectionUrl) {
        this.connectionUrl = connectionUrl;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Fetches product details from the database for a given product ID.
     *
     * @param productId the product ID to search for
     * @return Product object if found; null otherwise
     */
    public Product getProductDetails(int productId) {
        Product product = null;
        String sql = "SELECT Pcode, Pname, Description, Price FROM Products WHERE Pcode = ?";

        try (
            Connection connection = DriverManager.getConnection(connectionUrl, userName, password);
            PreparedStatement preparedStatement = connection.prepareStatement(sql)
        ) {
            preparedStatement.setInt(1, productId);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    product = new Product();
                    product.code = rs.getInt("Pcode");
                    product.name = rs.getString("Pname");
                    product.description = rs.getString("Description");
                    product.price = rs.getDouble("Price");
                }
            }
        } catch (SQLException e) {
            // Log error - in real apps use logging frameworks like SLF4J or Log4J
            e.printStackTrace();
        }
        return product;
    }
}
