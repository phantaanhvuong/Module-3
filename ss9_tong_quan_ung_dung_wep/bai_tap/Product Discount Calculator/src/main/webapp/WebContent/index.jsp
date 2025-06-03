<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/3/2025
  Time: 11:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h2>product Discount Calculator</h2>
<form action="/display-discount" method="post">
    <label>Product Decription:</label><br>
    <input type="text" name="description" required><br><br>

    <label>List Price:</label><br>
    <input type="number" step="0.01" name="price" required><br><br>

    <label>Discount Percent:</label><br>
    <input type="number" step="0.01" name="percent" required><br><br>

    <input type="submit" value="Calculate Discount">

</form>
</body>
</html>
