<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/4/2025
  Time: 10:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Chi tiết sản phẩm</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h2>Chi tiết sản phẩm</h2>
  <table class="table table-bordered">
    <tr><th>ID</th><td>${product.id}</td></tr>
    <tr><th>Tên</th><td>${product.name}</td></tr>
    <tr><th>Giá</th><td>${product.price}</td></tr>
    <tr><th>Mô tả</th><td>${product.describe}</td></tr>
    <tr><th>Nhà sản xuất</th><td>${product.manufacturer}</td></tr>
  </table>
  <a href="/products" class="btn btn-primary">Quay lại</a>
</div>
</body>
</html>

