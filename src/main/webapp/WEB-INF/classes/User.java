package beans;

import java.sql.*;

public class User {

    private String userName = "";
    private String password = "";
    private String connectionUrl = "";

    // Getters and setters with proper camelCase
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
     * Inserts a user record into the database.
     *
     * @return true if insertion was successful, false otherwise.
     */
    public boolean insertRec(String firstName, String lastName,
                             String emailAddress, String companyName,
                             String address1, String address2, String city,
                             String state, String pin, String country) {
        boolean returnValue = false;
        String sql = "INSERT INTO User " +
                "(FirstName, LastName, EmailAddress, CompanyName, Address1, Address2, City, State, Pin, Country) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        // Use try-with-resources to manage Connection and PreparedStatement automatically
        try (Connection connection = DriverManager.getConnection(connectionUrl, userName, password);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Set auto-commit false to enable transaction management if needed
            connection.setAutoCommit(false);

            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, emailAddress);
            preparedStatement.setString(4, companyName);
            preparedStatement.setString(5, address1);
            preparedStatement.setString(6, address2);
            preparedStatement.setString(7, city);
            preparedStatement.setString(8, state);
            preparedStatement.setString(9, pin);
            preparedStatement.setString(10, country);

            int rowsInserted = preparedStatement.executeUpdate();

            connection.commit();

            returnValue = (rowsInserted > 0);

        } catch (SQLException e) {
            // Log error, rollback handled by try-with-resources auto close or can be handled explicitly if you keep connection outside try
            e.printStackTrace();
        }

        return returnValue;
    }
}
