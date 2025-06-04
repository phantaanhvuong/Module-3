<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/4/2025
  Time: 4:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Thêm mới</h1>
<form action="/products?action=add" method="post">
  <input placeholder="id" name="id"><br>
  <input placeholder="name" name="name"><br>
  <input placeholder="price" name="price"><br>
  <input placeholder="describe" name="describe"><br>
  <input placeholder="manufacturer" name="manufacturer"><br>
  <button>Lưu</button>
  </form>
</body>
</html>
