<!DOCTYPE html>
<html>
<head>
  <title>E-Commerce Site</title>
  <style>
    .header-cell {
      font-family: Arial, sans-serif;
      font-size: 16px;
      font-weight: bold;
    }
    .item-cell {
      font-family: Arial, sans-serif;
      font-size: 14px;
    }
  </style>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<table cellpadding="6" border="0" width="750">
  <tr>
    <td colspan="2"><jsp:include page="header.jsp" flush="true"/></td>
  </tr>
  <tr>
    <td><jsp:include page="menu.jsp" flush="true"/></td>
    <td valign="TOP">
      <table>
        <tr>
          <td class="header-cell"><strong>Name</strong></td>
          <td class="header-cell"><strong>Description</strong></td>
          <td class="header-cell"><strong>Price</strong></td>
          <td class="header-cell"><strong>Quantity</strong></td>
          <td class="header-cell"><strong>Subtotal</strong></td>
          <td class="header-cell"><strong>Update</strong></td>
          <td class="header-cell"><strong>Delete</strong></td>
        </tr>
<%
Enumeration enum = shoppingCart.elements();
while (enum.hasMoreElements()) {
  ShoppingItem item = (ShoppingItem) enum.nextElement();
%>
        <tr>
          <td class="item-cell"><%=item.name%></td>
          <td class="item-cell"><%=item.description%></td>
          <td class="item-cell"><%=item.price%></td>
          <form>
            <input type="hidden" name="action" value="updateItem">
            <input type="hidden" name="pcode" value="<%=item.productcode%>">
            <td><input type="text" size="3" name="quantity" value="<%=item.quantity%>"></td>
            <td class="item-cell"><%=item.quantity * item.price%></td>
            <td><input type="submit" value="Update"></td>
          </form>
          <form>
            <input type="hidden" name="action" value="deleteItem">
            <input type="hidden" name="pcode" value="<%=item.productcode%>">
            <td><input type="submit" value="Delete"></td>
          </form>
        </tr>
<%
}
%>
      </table>
    </td>
  </tr>
  <tr>
    <td>
      <form action="<%=response.encodeURL("itemslist.jsp")%>" method="post">
        <input type="submit" value="Continue Shopping">
      </form>
    </td>
    <td>
      <form action="<%=response.encodeURL("checkout.jsp")%>" method="post">
        <input type="submit" value="Place Order">
      </form>
    </td>
  </tr>
</table>
</body>
</html>
