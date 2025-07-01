<%@ page session="true" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
  <title>E-Commerce Site</title>
  <style>
    body {
      background-color: #FFFFFF;
      color: #000000;
      font-family: Arial, sans-serif;
    }
    table {
      border-collapse: collapse;
      width: 750px;
    }
    td, th {
      padding: 8px;
      border: 1px solid #ddd;
    }
    th {
      background-color: #f2f2f2;
      font-weight: bold;
    }
  </style>
</head>

<body>
  <table>
    <tr>
      <td colspan="2">
        <jsp:include page="header.jsp" flush="true" />
      </td>
    </tr>
    <tr>
      <td valign="top">
        <jsp:include page="menu.jsp" flush="true" />
      </td>
      <td valign="top">
        <table>
          <tr>
            <th>Code</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Details</th>
          </tr>

<%
  String categoryId = request.getParameter("category");
  String sql;
  boolean hasCategory = (categoryId != null && !categoryId.trim().isEmpty());

  if (hasCategory) {
    sql = "SELECT Pcode, Pname, Description, Price FROM Products WHERE CategoryID = ?";
  } else {
    sql = "SELECT Pcode, Pname, Description, Price FROM Products";
  }

  try {
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); // For legacy systems only
  } catch (ClassNotFoundException e) {
    out.println("<p style='color:red;'>JDBC Driver not found: " + e.getMessage() + "</p>");
  }

  try (
    Connection con = DriverManager.getConnection("jdbc:odbc:ecommweb");
    PreparedStatement ps = con.prepareStatement(sql)
  ) {
    if (hasCategory) {
      ps.setString(1, categoryId);
    }

    try (ResultSet rs = ps.executeQuery()) {
      while (rs.next()) {
        String code = rs.getString("Pcode");
        String name = rs.getString("Pname");
        String desc = rs.getString("Description");
        String price = rs.getString("Price");
%>
          <tr>
            <td><%= code %></td>
            <td><%= name %></td>
            <td><%= desc %></td>
            <td><%= price %></td>
            <td><a href="ProductDetails.jsp?productid=<%= code %>">Details</a></td>
          </tr>
<%
      }
    }
  } catch (SQLException e) {
    out.println("<p style='color:red;'>Database error: " + e.getMessage() + "</p>");
  }
%>

        </table>
      </td>
    </tr>
  </table>
</body>
</html>
