create database DoGoNoiThat
drop database DoGoNoiThat
create table [user](
userId int identity(1,1) primary key,
username nvarchar(25),
[password] nvarchar(25),
isAdmin bit,
isCustomer bit,
isSeller bit,
userImg nvarchar(255),
userBalance int,
isActive bit
)

update [user] set isActive = 0 where userId = 2 

insert into [User] values('admin','admin',1,1,1,null,0)

create table request(
requestId int foreign key references [user](userId),
request nvarchar(255),
response nvarchar(255),
shopId int foreign key references shop(shopId),
isRequestSell bit,
isRequestBuy bit,
isRequestNew bit,
requestState bit, 
)

create table customer(
customerId int foreign key references [user](userId),
customerName nvarchar(50),
customerAddress nvarchar(255),
customerAddressShip nvarchar(255),
customerEmail nvarchar(255),
customerPhone nvarchar(15),
customerDate nvarchar(255),
customerGender bit,
customerDOB nvarchar(255),
primary key (customerId)
)

alter table seller 
add isActice bit

create table seller(
sellerId int foreign key references [user](userId),
sellerName nvarchar(50),
sellerAddress nvarchar(255),
sellerEmail nvarchar(255),
sellerPhone nvarchar(15),
sellerDate nvarchar(255),
sellerGender bit,
sellerDOB nvarchar(255), 
primary key (sellerId)
)

insert into seller values (1,N'vương quốc tuấn',N'Hà nội','tuan@gmail.com','0000000000','03/16/2022',1,'27/09/2001')
insert into customer values(1,N'vương quốc tuấn',N'Hà nội',null,'tuan@gmail.com','0000000000','03/16/2022',1,'27/09/2001')
insert into shop  values(1,'AdminShop',null,0,0,null,null,null,0,0,1)


create table shop (
shopId int foreign key references seller(sellerId) ,
shopName nvarchar(255),
shopAddress nvarchar(255),
shopProductQuantity int,
shopProductSold int,
shopPhone nvarchar(15),
shopEmail nvarchar(255),
shopDate nvarchar(25),
shopRevenue int,
shopProfit int,
shopActive bit,
primary key(shopId)
)



create table category(
categoryId int primary key,
categoryName nvarchar(255)
)

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
productQuantitySold int,
productOldPrice int,
productNewPrice int,
productBrand nvarchar(25),
productOrigin nvarchar(25),
productType int foreign key references category(categoryId),	
productEntryPrice int
)

alter table product
add productEntryPrice int

create table [order](
orderId int identity(1,1) primary key,
customerId int foreign key references [user](userId),
billId int foreign key references bill(billId),
productId int , 
productPrice int,
productQuantity int,
productTotal int,
sold bit,
shopId int
)


create table bill(
billId int identity(1,1) primary key,
customerId int foreign key references [user](userId),
billPay int foreign key references payment(payId) ,
billTotal int,
billDateOrder date,
billDateShip date
)

create table payment(
payId int identity(1,1) primary key,
payType nvarchar(255), 
)

insert into payment values(N'Thanh toán bằng ví điện tử')
insert into payment values(N'Thanh toán khi nhận hàng')

select * from category
select * from [user]
select * from customer 
select * from seller
select * from shop
select * from product

update [user] set isCustomer =1
insert into [user] values('abc','123',0,1,0,null,0,1)
select * from bill
select * from [order]
select * from payment
select * from request

 update [user] set isSeller = 1
select * from [order] as a where a.customerId =1 and a.billId = 1

delete product where productId = 22
update [user] set isSeller = 1 where userId = 7

delete seller where sellerId = 7
delete shop where shopId = 7
delete request where requestId = 7


delete [user] where userId = 7
delete [order] where customerId = 7
delete bill where customerId = 7









update bill set billDateOrder = '2022-04-20' where billId = 1
select SUM(a.billTotal) from bill as a , [order] as b ,
 product as c  
 where a.billId = b.billId and c.productId = b.productId and c.shopId = 1 and a.billDateOrder between '2022-03-19' and '2022-03-21'

insert into product values (N'TỦ GIÀY GỖ TỰ NHIÊN 1M2 SM03',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatnhadep.pro/images/PROHOME_LUXURY/TUR080/T%E1%BB%A7_gi%C3%A0y_g%E1%BB%97_t%E1%BB%B1_nhi%C3%AAn_1m2_SM03_1.jpg',
1,10,0,7300000,6800000,'wood',N'Châu âu', 3 ,70000000)

insert into product values (N'Tủ sách hiện đại đa năng',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/artboard-119403653_400x400.png',
1,10,0,2777000,1980000,'wood',N'Châu á',1 ,20000000 )

insert into product values (N'Tủ rượu trang trí kiêm vách ngăn',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/tu-ruou-trang-tri-kiem-vach-ngan-go-cong-nghiep-(3)_400x400.jpg',
1,10,0,4890000,4290000,'wood',N'Châu âu',3 ,40000000 )

insert into product values (N'Táp đầu giường kèm giá sách',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/tap-dau-giuong-kem-gia-sach-tien-ich-(1)_400x400.jpg',
1,10,0,1525000,1250000,'wood',N'Châu âu',1,10000000)

insert into product values (N'Táp đầu giường tân cổ điển',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/tap-dau-giuong-tan-co-dien-(1)_400x400.jpg',
1,10,0,3090000,2690000,'wood',N'Châu á',1,30000000)

insert into product values (N'Tủ bếp gỗ công nghiệp màu trắng',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/tu-bep-go-cong-nghiep-mau-trang-(1)_400x400.jpg',
1,10,0,6500000,5990000,'wood',N'Châu âu châu á',4,60000000)

insert into product values (N'Kệ Để Tivi Gỗ Sồi Nga',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatdogoviet.com/upload/sanpham/thumbs/ke-de-tivi-go-soi-nga-tu-nhien-hien-dai-dep-ben-gia-re.jpg',
1,10,0,3900000,3560000,'wood',N'Châu á',3 ,30000000)

insert into product values (N'Kệ Tivi Hiện Đại Kiểu Hàn Quốc ',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatdogoviet.com/upload/sanpham/thumbs/ke-tivi-hien-dai-kieu-han-quoc-go-soi-nga-dep-gia-re.jpg',
1,10,0,5200000,4750000,'wood',N'Châu á',3,50000000)

insert into product values (N'TKệ Tivi Giá Rẻ Gỗ MDF Màu Vàng Vân Xoan Đào',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatdogoviet.com/upload/sanpham/thumbs/ke-tivi-gia-re-go-mdf-mau-vang-van-xoan-dao.jpg',
1,10,0,3000000,2450000,'wood',N'Châu á',3,30000000)

insert into product values (N'Cốp Tivi Màu Xám Tro Phối Trắng Hiện Đại Đẹp Giá Rẻ',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatdogoviet.com/upload/sanpham/thumbs/cop-tivi-mau-xam-tro-phoi-trang-hien-dai-dep-gia-re.jpg',
1,10,0,6000000,5725000,'wood',N'Châu âu',3,60000000)

insert into product values (N'Tủ Quần Áo Cánh Lùa Màu Trắng ',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatdogoviet.com/upload/sanpham/thumbs/tu-quan-ao-canh-lua-mau-trang-dep-ben-gia-re.jpg',
1,10,0,7000000,6430000,'wood',N'Châu âu',1 ,70000000)

insert into product values (N'Tủ Để Đồ Phòng Ngủ MDF Cửa Trượt ',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatdogoviet.com/upload/sanpham/thumbs/tu-de-do-phong-ngu-mdf-cua-truot-hien-dai-cho-gia-dinh-tre.jpg',
1,10,0,4750000,3990000,'wood',N'Châu âu',1,40000000 )

insert into product values (N'Tủ Quần Áo MDF Khung Vàng Sồi 3 Cánh Lùa Trắng Áp Trần',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatdogoviet.com/upload/sanpham/thumbs/tu-quan-ao-mdf-khung-vang-soi-3-canh-lua-trang-ap-tran-hien-dai.jpg',
1,10,0,9500000,8750000,'wood',N'Châu âu',1,90000000)

insert into product values (N'Tủ Quần Áo Gỗ Hương Xám',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatdogoviet.com/upload/sanpham/thumbs/tu-quan-ao-go-huong-xam-cao-cap-3-canh-dep-gia-tot.jpg',
1,10,0,7200000,6500000,'wood',N'Châu á',1 ,70000000)

insert into product values (N'Bàn Trang Điểm Hiện Đại Màu Vàng Sồi',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatdogoviet.com/upload/sanpham/thumbs/ban-trang-diem-mfc-mau-nau-canh-gian-hien-dai-sang-trong.jpg',
1,10,0,3550000,3000000,'wood',N'Châu âu',1 ,30000000)


insert into product values (N'Bàn Trang Điểm Màu Trắng',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatdogoviet.com/upload/sanpham/thumbs/ban-trang-diem-mau-trang-hien-dai-dep-gia-re.jpg',
1,10,0,3400000,3200000,'wood',N'Châu âu',1,30000000)

insert into product values (N'Tủ Giày Dép Vàng Vân Xoan',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatdogoviet.com/upload/sanpham/thumbs/tu-giay-thong-minh-go-cong-nghiep-mau-kem-3-tang-dep-gia-re.jpg',
1,10,0,3650000,2990000,'wood',N'Châu á',3,30000000)

insert into product values (N'Tủ Đựng Giày Dép Gỗ Sồi Nga',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatdogoviet.com/upload/sanpham/thumbs/tu-dung-giay-dep-go-soi-nga-4-canh-hien-dai-dep-gia-tot.jpg',
1,10,0,2300000,1900000,'wood',N'Châu á',3 ,20000000)

insert into product values (N'Mẫu Tủ Bếp Gỗ Đẹp Thiết Kế Theo Phong Cách Tối Giản',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatdogoviet.com/upload/sanpham/thumbs/mau-tu-bep-go-dep-thiet-ke-tinh-gian.jpg',
1,10,0,9800000,9250000,'wood',N'Châu âu',4,90000000)

insert into product values (N'Mẫu Tủ Bếp Gỗ Sồi Tự Nhiên',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatdogoviet.com/upload/sanpham/thumbs/mau-tu-bep-go-soi-tu-nhien-gia-re.jpg',
1,10,0,7890000,7500000,'wood',N'Châu á',4 ,70000000)

insert into product values (N'Mẫu Tủ Bếp Hiện Đại',
N'Chất liệu: gỗ tự nhiên cao cấp sơn phủ bóng chống xước, chống mọt, chống thấm ẩm tốt.',
'https://noithatdogoviet.com/upload/sanpham/thumbs/mau-tu-bep-hien-dai-chat-lieu-go-tu-nhien.jpg',
1,10,0,9820000,8990000,'wood',N'Châu âu',4,90000000 )

WITH CTEResults AS  (SELECT * , ROW_NUMBER() OVER (ORDER BY productid) AS RowNum FROM product ) 
                    SELECT *  FROM CTEResults WHERE (RowNum  BETWEEN 1 AND 5 ) and productType = 2