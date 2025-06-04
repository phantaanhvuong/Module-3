<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/4/2025
  Time: 3:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

</head>
<body>
<h1>Quản lý sản phẩm</h1>
<form method="get" action="/products" class="mb-3">
    <input type="hidden" name="action" value="search">
    <div class="input-group">
        <input type="text" class="form-control" name="searchName" placeholder="Nhập tên sản phẩm cần tìm">
        <button class="btn btn-primary" type="submit">Tìm kiếm</button>
    </div>
</form>

<p style="color: red">${param.mess}</p>
<a href="/products?action=add">Create product</a>
<table class="table table-striped table-dark">

    <tr >
        <th>STT</th>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Describe</th>
        <th>Manufacturer</th>
        <th>Delete</th>
        <th>Edit</th>

    </tr>

    <c:forEach items="${productList}" var="product" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.id}</td>
            <td>
                <a href="/products?action=detail&id=${product.id}" class="text-decoration-none text-info">
                        ${product.name}
                </a>
            </td>

            <td>${product.price}</td>
            <td>${product.describe}</td>
            <td>${product.manufacturer}</td>
            <td>
                <button onclick="deleteInfo('${product.id}','${product.name}')" type="button"
                        class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
            <td>
                <a href="/products?action=edit&id=${product.id}" class="btn btn-warning btn-sm">Edit</a>
            </td>

        </tr>

    </c:forEach>


</table>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form method="post" action="/products?action=delete">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden="hidden" id="deleteId" name="deleteId">
                    <span>Bạn có muốn xoá sản phẩm </span><span id="deleteName"></span> không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ</button>
                    <button  class="btn btn-primary">Xoá</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function deleteInfo(id, name) {
        document.getElementById("deleteId").value= id;
        document.getElementById("deleteName").innerText= name;
    }
</script>

</body>
</html>
