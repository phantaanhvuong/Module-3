create database demo_ss5;
use demo_ss5;
create table products(
	id int primary key auto_increment,
    productCode varchar(50),
    productName varchar(50),
    productPrice float,
    productAmount int,
    productDescription varchar(50),
    productStatus varchar(50)
);
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES 
('P001', 'Điện thoại iPhone 14', 21990000, 10, 'Điện thoại Apple iPhone 14 128GB', 'Còn hàng'),
('P002', 'Laptop Dell XPS 13', 29990000, 5, 'Laptop cao cấp, màn hình 13 inch, SSD 512GB', 'Còn hàng'),
('P003', 'Máy lọc không khí Xiaomi', 3490000, 20, 'Lọc bụi mịn PM2.5, phù hợp phòng 30m²', 'Còn hàng'),
('P004', 'Chuột Logitech M350', 450000, 0, 'Chuột không dây Bluetooth nhỏ gọn', 'Hết hàng'),
('P005', 'Tai nghe Sony WH-1000XM5', 8490000, 8, 'Tai nghe chống ồn cao cấp của Sony', 'Còn hàng');

create index i_unique on products(productCode);
create index i_composite on products(productPrice);
explain select * from Products where productPrice > 10000000;
select count(*) from Products where ProductPrice > 10000000;
select * from Products where ProductPrice > 10000000;
drop index i_composite on Products;

create view view_product as
select 
    productCode,
    productName,
    productPrice,
    productStatus
from Products;

create or replace view view_product as
select
	productCode,
    productName,
    productPrice,
    productStatus
from Products
where productStatus = 'Còn hàng';

drop view if exists view_product;


DROP PROCEDURE IF EXISTS get_all_products;


delimiter //
create procedure get_all_products()
begin
select * from products;
end //
delimiter ;

delimiter //
create procedure addProduct(
	in p_productCode varchar(50),
    in p_productName varchar(50),
    in p_productPrice float,
    in p_productAmount int,
    in p_productDescription varchar(50),
    in p_productStatus varchar(50)
)
begin
insert into Products(
productCode,
 productName,
 productPrice,
 productAmount,
 productDescription,
 productStatus
)
values(
	 p_productCode,
     p_productName,
     p_productPrice,
     p_productAmount,
     p_productDescription,
     p_productStatus
);
end //
delimiter ;


call addProduct(
    'P006',
    'Máy giặt LG Inverter',
    7590000,
    12,
    'tiết kiệm điện năng, công nghệ Inverter',
    'Còn hàng'
);
delimiter //

create procedure sp_update_product_by_id (
    in p_id int,
    in p_productCode varchar(50),
    in p_productName varchar(50),
    in p_productPrice float,
    in p_productAmount int,
    in p_productDescription varchar(50),
    in p_productStatus varchar(50)
)
begin
    update products
    set
        productCode = p_productCode,
        productName = p_productName,
        productPrice = p_productPrice,
        productAmount = p_productAmount,
        productDescription = p_productDescription,
        productStatus = p_productStatus
    where id = p_id;
end //

delimiter ;

call sp_update_product_by_id(
    3,
    'P003-UPD',
    'Máy lọc không khí Xiaomi Gen 2',
    3990000,
    18,
    'Phiên bản mới, lọc hiệu quả hơn',
    'Còn hàng'
);

create procedure sp_delete_product_by_id (
    in p_id int
)
begin
    delete from products
    where id = p_id
end //

delimiter ;
call sp_delete_product_by_id(4);
