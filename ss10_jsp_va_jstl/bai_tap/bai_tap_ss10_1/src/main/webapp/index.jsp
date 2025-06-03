<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="servlet.Customer" %>
<!DOCTYPE html>
<html>
<head>
  <title>Danh sách khách hàng</title>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table border="1" cellpadding="10">
  <tr>
    <th>STT</th>
    <th>Tên</th>
    <th>Ngày Sinh</th>
    <th>Địa Chỉ</th>
    <th>Ảnh</th>
  </tr>
  <%
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
    if (customers != null) {
      for (int i = 0; i < customers.size(); i++) {
        Customer item = customers.get(i);
  %>
  <tr>
    <td><%= i + 1 %></td>
    <td><%= item.getName() %></td>
    <td><%= item.getDayOfBirth() %></td>
    <td><%= item.getAddress() %></td>
    <td><img src="<%= item.getImg() %>" width="100"></td>
  </tr>
  <%
      }
    }
  %>
</table>
</body>
</html>
