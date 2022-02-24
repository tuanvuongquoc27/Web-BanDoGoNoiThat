create database DoGoNoiThat
go
use DoGoNoiThat 
go
create table Product(
productId int primary key,
productName nvarchar(50),
productImg varchar(100),
productDescription nvarchar(100),
productQuantity int,
productType int
)

create table account(
username nvarchar(30),
[password] nvarchar(30),
[role] nvarchar(20)
)

insert into account values('admin','admin','admin')
insert into account values('','admin','admin')

select * from Product
select * from account
alter table Product 
add productPrice int


alter table account
add email nvarchar(30)


select * from account where username = 'admin' and password= 'admin'