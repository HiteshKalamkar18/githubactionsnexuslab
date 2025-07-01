<%@ page language="java" %>
<jsp:useBean id="prodbean" scope="session" class="beans.ProductBean"/>
<jsp:setProperty name="prodbean" property="connectionUrl" value="jdbc:odbc:ecommweb"/>
<!DOCTYPE html>
<html>
<head>
  <title>Product Details</title>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<table cellpadding="6" border="0" width="750">
<tr>
  <td colspan="2"><jsp:include page="header.jsp" flush="true"/></td>
</tr>
<tr>
  <td><jsp:include page="menu.jsp" flush="true"/></td>
  <td valign="TOP">
<%
  try {
    int productId = Integer.parseInt(request.getParameter("productid"));
    Product prod = prodbean.getProductDetails(productId);
    if (prod != null) {
%>
<table>
<tr>
  <td valign="top" align="left">
    <img border="0" width="170" height="170" src="images/<%=prod.code%>.jpg" alt="<%=prod.name%>">
  </td>
  <td valign="top">
    <b><%=prod.name%></b><br>
    <%=prod.description%><br>
    Price : <%=prod.price%>
  </td>
  <td>
    <a href="ShoppingCart.jsp?pcode=<%=prod.code%>&action=addItem">
      <img border="0" width="70" height="70" src="images/addcart.jpg" alt="Add to cart">
    </a><br><br>
    <a href="showcart.jsp">
      <img border="0" width="70" height="70" src="images/showcart.jpg" alt="View cart">
    </a>
  </td>
</tr>
<%
    }
  } catch (Exception e) {
    out.println("Error: Invalid Product Code");
  }
%>
  </td>
</tr>
</table>
</body>
</html>
