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