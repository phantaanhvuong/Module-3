<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/4/2025
  Time: 10:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Chỉnh sửa sản phẩm</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<h1>Chỉnh sửa sản phẩm</h1>
<form method="post" action="/products?action=update">
  <input type="hidden" name="id" value="${product.id}">

  <div class="mb-3">
    <label class="form-label">Tên sản phẩm</label>
    <input class="form-control" type="text" name="name" value="${product.name}" required>
  </div>

  <div class="mb-3">
    <label class="form-label">Giá</label>
    <input class="form-control" type="number" name="price" value="${product.price}" required>
  </div>

  <div class="mb-3">
    <label class="form-label">Mô tả</label>
    <input class="form-control" type="text" name="describe" value="${product.describe}">
  </div>

  <div class="mb-3">
    <label class="form-label">Nhà sản xuất</label>
    <input class="form-control" type="text" name="manufacturer" value="${product.manufacturer}">
  </div>

  <div class="mb-3">
    <label class="form-label">Danh mục</label>
    <select class="form-control" name="id_category">
      <c:forEach items="${categoryList}" var="cat">
        <option value="${cat.id_category}" <c:if test="${cat.id_category == productD.id_category}">selected</c:if>>
            ${cat.name_category}
        </option>
      </c:forEach>
    </select>
  </div>

  <button class="btn btn-primary" type="submit">Cập nhật</button>
  <a href="/products" class="btn btn-secondary">Quay lại</a>
</form>
</body>
</html>


