<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/4/2025
  Time: 10:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Cập nhật sản phẩm</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h2>Cập nhật sản phẩm</h2>
  <form method="post" action="/products?action=update">
    <input type="hidden" name="id" value="${product.id}">
    <div class="mb-3">
      <label>Tên sản phẩm</label>
      <input type="text" class="form-control" name="name" value="${product.name}">
    </div>
    <div class="mb-3">
      <label>Giá</label>
      <input type="text" class="form-control" name="price" value="${product.price}">
    </div>
    <div class="mb-3">
      <label>Mô tả</label>
      <textarea class="form-control" name="describe">${product.describe}</textarea>
    </div>
    <div class="mb-3">
      <label>Nhà sản xuất</label>
      <input type="text" class="form-control" name="manufacturer" value="${product.manufacturer}">
    </div>
    <button class="btn btn-primary">Cập nhật</button>
    <a href="/products" class="btn btn-secondary">Huỷ</a>
  </form>
</div>
</body>
</html>

