<%@ page import="beans.Product" %>
<%@ page import="beans.ShoppingItem" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="prodbean" scope="session" class="beans.ProductBean"/>

<%
  Hashtable<String, ShoppingItem> shoppingCart = (Hashtable<String, ShoppingItem>) session.getAttribute("shoppingCart");
  if (shoppingCart == null) {
      shoppingCart = new Hashtable<>(10);
      session.setAttribute("shoppingCart", shoppingCart);
  }

  String action = request.getParameter("action");
  if ("updateItem".equals(action)) {
      try {
          int productId = Integer.parseInt(request.getParameter("pcode"));
          int quantity = Integer.parseInt(request.getParameter("quantity"));
          ShoppingItem item = shoppingCart.get(Integer.toString(productId));
          if (item != null) {
              item.quantity = quantity;
          }
      } catch (Exception e) {
          out.println("<p style='color:red;'>Error updating shopping cart.</p>");
      }
  } else if ("deleteItem".equals(action)) {
      try {
          int productId = Integer.parseInt(request.getParameter("pcode"));
          shoppingCart.remove(Integer.toString(productId));
      } catch (Exception e) {
          out.println("<p style='color:red;'>Error deleting item from shopping cart.</p>");
      }
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>E-Commerce Site - Shopping Cart</title>
  <style>
    table { width: 750px; border-collapse: collapse; }
    th, td { padding: 8px; border-bottom: 1px solid #ccc; }
    th { text-align: left; background-color: #f4f4f4; }
    form { margin: 0; }
    input[type="text"] { width: 40px; }
  </style>
</head>
<body bgcolor="#FFFFFF" text="#000000">
  <table cellpadding="6" border="0" width="750">
    <tr>
      <td colspan="2"><jsp:include page="header.jsp" flush="true"/></td>
    </tr>
    <tr>
      <td><jsp:include page="menu.jsp" flush="true"/></td>
      <td valign="top">

<%
  Enumeration<ShoppingItem> items = shoppingCart.elements();
  if (items.hasMoreElements()) {
%>
        <table>
          <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Subtotal</th>
            <th>Update</th>
            <th>Delete</th>
          </tr>

<%
    while (items.hasMoreElements()) {
        ShoppingItem item = items.nextElement();
%>
          <tr>
            <td><%= item.name %></td>
            <td><%= item.description %></td>
            <td><%= item.price %></td>

            <td>
              <form method="post">
                <input type="hidden" name="action" value="updateItem">
                <input type="hidden" name="pcode" value="<%= item.productcode %>">
                <input type="text" name="quantity" value="<%= item.quantity %>">
            </td>
            <td><%= item.quantity * item.price %></td>
            <td><input type="submit" value="Update"></form></td>

            <td>
              <form method="post">
                <input type="hidden" name="action" value="deleteItem">
                <input type="hidden" name="pcode" value="<%= item.productcode %>">
                <input type="submit" value="Delete">
              </form>
            </td>
          </tr>
<%
    }
%>
          <tr>
            <td colspan="3">
              <form action="<%= response.encodeURL("itemslist.jsp") %>" method="post">
                <input type="submit" value="Continue Shopping">
              </form>
            </td>
            <td colspan="4" align="right">
              <form action="<%= response.encodeURL("checkout.jsp") %>" method="post">
                <input type="submit" value="Place Order">
              </form>
            </td>
          </tr>
        </table>
<%
  } else {
%>
        <p>Your cart is empty.</p>
        <form action="<%= response.encodeURL("itemslist.jsp") %>" method="post">
          <input type="submit" value="Continue Shopping">
        </form>
<%
  }
%>

      </td>
    </tr>
  </table>
</body>
</html>
