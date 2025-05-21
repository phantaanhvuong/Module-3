create database quan_ly_ban_hang_ss3;
use quan_ly_ban_hang_ss3;
create table custumer(
	custumer_id int primary key auto_increment,
    custumer_name varchar(25),
    age tinyint
); 
create table `order`(
	order_id int primary key auto_increment,
    custumer_id int,
	order_date datetime,
    total_price int,
    foreign key(custumer_id) references custumer(custumer_id)
);
create table product (
	product_id int primary key auto_increment,
    product_name varchar(25),
    price int
);
create table order_detail(
	order_id int,
    product_id int,
    quantity int,
    foreign key (order_id) references `order`(order_id),
    foreign key (product_id) references product(product_id)
);
insert into custumer(custumer_name,age)
values('minh quan', 10),
		('ngoc anh', 20),
		('hong ha', 50);
insert into `order`(custumer_id,order_date)values
(1,'2006-03-21'),
(2,'2006-03-23'),
(1,'2006-03-16');
insert into product(product_name,price)values
('may giat', 3),
('tu lanh', 5),
('dieu hoa', 7),
('quat', 1),
('bep dien', 2);
insert into order_detail(order_id,product_id,quantity)values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select * from `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.*, p.* from custumer c
join `order` o on c.custumer_id = o.custumer_id
join order_detail od on o.order_id = od.order_id
join product p on od.product_id = p.product_id
group by c.custumer_id,p.product_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.* from custumer c
left join `order`o on c.custumer_id = o.custumer_id
where o.order_id is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.order_id,o.order_date,sum(od.quantity * p.price)  as 'totalPrice' from `order` o
join order_detail od on o.order_id = od.order_id
join product p on od.product_id = p.product_id
group by o.order_id,o.order_date;