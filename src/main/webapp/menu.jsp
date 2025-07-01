<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Menu | E-Commerce Site</title>
  <style>
    body {
      background-color: #FFFFFF;
      color: #000000;
      font-family: Arial, sans-serif;
    }
    table {
      width: 180px;
      background-color: #AABBCC;
    }
    td {
      padding: 10px;
    }
    a {
      text-decoration: none;
      display: block;
      margin-bottom: 15px;
    }
    img {
      vertical-align: middle;
      margin-right: 8px;
    }
  </style>
</head>
<body>
  <table cellpadding="5" border="0">
    <tr>
      <td valign="top">
        <br><br>
        <a href="index.jsp">Home</a>
        <a href="itemslist.jsp?category=1">
          <img src="images/camera.jpg" alt="Camera" width="30" height="30"> Varieties of cameras
        </a>
        <a href="itemslist.jsp?category=2">
          <img src="images/mobile.jpg" alt="Mobile" width="30" height="30"> Latest mobiles
        </a>
        <a href="itemslist.jsp?category=3">
          <img src="images/book.jpg" alt="Book" width="30" height="30"> Books for success
        </a>
        <a href="user.jsp">
          <img src="images/signin.jpg" alt="Sign In" width="30" height="30"> Sign In
        </a>
        <a href="contactus.jsp">Contact Us</a>
        <br><br><br>
      </td>
    </tr>
  </table>
</body>
</html>
