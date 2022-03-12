create database DoGoNoiThat
go
use DoGoNoiThat 
go
create table [user](
userId int identity(1,1) primary key,
username nvarchar(25),
[password] nvarchar(25),
[role] nvarchar(25)
)

insert into [user] values ('admin','admin','admin')
insert into [user] values ('seller1','seller1','seller')
insert into [user] values ('seller2','seller2','seller')
insert into [user] values ('customer','customer','customer')
insert into [user] values ('customer','customer','customer')

create table customer(
customerId int foreign key references [user](userId),
customerName nvarchar(50),
customerAddress nvarchar(255),
customerEmail nvarchar(255),
customerPhone nvarchar(15),
primary key (customerId)
)

insert into customer values(3,'anna','hanoi','anna@gmail.com','1234567890')

create table seller(
sellerId int foreign key references [user](userId),
sellerName nvarchar(50),
sellerAddress nvarchar(255),
sellerEmail nvarchar(255),
sellerPhone nvarchar(15),
primary key (sellerId)
)

insert into seller values (2,'mari','hanoi','mari@gmail.com','123456789')
insert into seller values (4,'tori','hanoi','tori@gmail.com','0123456781')

create table shop (
shopId int foreign key references seller(sellerId) ,
shopName nvarchar(255),
shopAddress nvarchar(255),
shopProductQuantity int,
shopProductSold int,
shopPhone nvarchar(15),
shopDate date,
primary key(shopId)
)

alter table shop 
add shopDate date

insert into shop values (2,'marishop','ha noi',100,80,'123456789')
update shop set shopDate ='3/12/2022' where shopId =2

insert into shop values (4,'tori','ha noi',100,80,'123456789','3/12/2022')

create table category(
categoryId int primary key,
categoryName nvarchar(255)
)
delete category
insert into category values (1,N'Nội thất phòng ngủ')
insert into category values (2,N'Nội thất phòng học')
insert into category values (3,N'Nội thất phòng khách')
insert into category values (4,N'Nội thất phòng bếp')
insert into category values (5,N'Nội thất phòng làm việc')

create table product(
productId int identity(1,1) primary key,
productName nvarchar(255),
productDescript nvarchar(255),
productImg nvarchar(255),
shopId int foreign key references shop(shopId),
productQuantity int,
productOldPrice int,
productNewPrice int,
productBrand nvarchar(25),
productOrigin nvarchar(25),
productType int foreign key references category(categoryId),	
)

drop table category

select * from [user]
select * from customer
select * from seller
select * from shop
select * from Product
select * from category
select * from product where shopId=2
insert into shop values()

insert into product values (N'BÀN ĂN ĐÁ CẨM THẠCH TRẮNG CHÂN KIM LOẠI VÀNG ĐỒNG CHỮ V',
N'Bàn ăn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ban-an-da-cam-thach-trang-chan-kim-loai-vang-dong-chu-v-(1)_400x400.jpg',
2,12,100000,99000,'Whoo',N'Hàn Quốc',4)

insert into Product values (N'GIƯỜNG NGỦ 4 CHÂN PHONG CÁCH BẮC ÂU',
N'Giường đẹp chất lượng cao giá cả hợp lý\n thoái mái êm',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/giuong-ngu-4-chan-phong-cach-bac-au--(1)_400x400.jpg',
2,12,100000,99000,'Whoo',N'Hàn Quốc',1)

insert into Product values (N'GHẾ GIÁM ĐỐC ĐƠN GIẢN HIỆN ĐẠI BJ-715',
N'Ghế đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ghe-giam-doc-don-gian-hien-dai-bj-715-(1)_400x400.jpg',
2,12,100000,99000,'Whoo',N'Hàn Quốc',5)

insert into Product values (N'GHẾ LƯỚI XOAY VP LƯNG THẤP MÀU TRẮNG XANH',
N'Ghê đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ghe-luoi-xoay-vp-lung-thap-mau-trang-xanh-(1)_400x400.jpg',
2,12,1000000,990000,'Whoo',N'Hàn Quốc',5)

insert into Product values ('TÁP ĐẦU GIƯỜNG KÈM GIÁ SÁCH TIỆN ÍCH',
N'Đẹp chất lượng cao giá cả hợp lý, phù hợp với mọi nhà',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/tap-dau-giuong-kem-gia-sach-tien-ich-(1)_400x400.jpg',
2,12,1200000,999000,'Whoo',N'Hàn Quốc',1)

insert into Product values (N'BÀN PHẤN BẮC ÂU PHỐI HIỆN ĐẠI 100CM KÈM GƯƠNG LED KHÔNG GHẾ',
N'Bàn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ban-phan-bac-au-phoi-hien-dai-100-cm-kem-guong-led-khong-ghe-(1)_400x400.jpg',
2,12,2200000,1900000,'Whoo',N'Hàn Quốc',1)

insert into Product values (N'GIƯỜNG SOFA LƯỜI 180X90CM',
N'Giường đẹp chất lượng cao giá cả hợp lý, lý tưởng cho người lười',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/giuong-sofa-luoi-180x90cm-(1)_400x400.jpg',
2,12,200000,200000,'Whoo',N'Hàn Quốc',1)

insert into Product values (N'BÀN PHẤN TÂN CỔ ÁNH VÀNG KÈM GHẾ 3 NGĂN KÉO',
N'Bàn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ban-phan-tan-co-anh-vang-kem-ghe-3-ngan-keo-(1)_400x400.jpg',
2,12,1000000,999000,'Whoo',N'Hàn Quốc',1)

insert into Product values (N'BÀN PHẤN TÂN CỔ 2 NGĂN KÉO KÈM GHẾ',
N'Bàn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ban-phan-tan-co-2-ngan-keo-kem-ghe-(1)_400x400.jpg',
2,12,100000,99000,'Whoo',N'Hàn Quốc',1)

insert into Product values (N'COMBO KỆ TV BÀN TRÀ HIỆN ĐẠI VÂN ÓC CHÓ + XÁM ĐEN',
N'Combo đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/combo-ke-tv-ban-tra-hien-dai-van-oc-cho-+-xam-den-(1)_400x400.jpg',
2,12,100000,100000,'Whoo',N'Hàn Quốc',3)

insert into Product values (N'GHẾ VP VI TÍNH LƯỚI XÁM XOAY LƯNG CHÂN THÉP',
N'Ghê ăn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ghe-vp-vi-tinh-luoi-den-xoay-lung-chan-thep--(1)_400x400.jpg',
2,12,110000,98000,'Whoo',N'Hàn Quốc',5)

insert into Product values (N'BÀN GIÁM ĐỐC ĐƠN GIẢN',
N'Bàn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ban-giam-doc-don-gian--(1)_400x400.jpg',
2,12,100000,100000,'Whoo',N'Hàn Quốc',5)


select * from Product
select * from account
alter table Product 
add productPrice int


alter table account
add email nvarchar(30)


select * from account where username = 'admin' and password= 'admin'