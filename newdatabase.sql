create database DoGoNoiThat

create table [user](
userId int identity(1,1) primary key,
username nvarchar(25),
[password] nvarchar(25),
isAdmin bit,
isCustomer bit,
isSeller bit,
userImg nvarchar(255),
userBalance int,
)
delete [user]  where userId = 2
insert into [User] values('admin','admin',1,1,1,'aaaa',100000)
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

create table [order](
orderId int identity(1,1) primary key,
customerId int foreign key references [user](userId),
billId int foreign key references bill(billId),
productId int , 
productPrice int,
productQuantity int,
productTotal int,
sold bit
)
create table bill(
billId int identity(1,1) primary key,
customerId int foreign key references [user](userId),
billPay int ,
billTotal int,
billDateOrder date,
billDateShip date
)

create table payment(
payId int identity(1,1) primary key,
payType int, 
)

insert into product values (N'BÀN ĂN ĐÁ CẨM THẠCH TRẮNG CHÂN KIM LOẠI VÀNG ĐỒNG CHỮ V',
N'Bàn ăn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ban-an-da-cam-thach-trang-chan-kim-loai-vang-dong-chu-v-(1)_400x400.jpg',
3,12,4500000,4150000,'Whoo',N'Hàn Quốc',4)

insert into Product values (N'GIƯỜNG NGỦ 4 CHÂN PHONG CÁCH BẮC ÂU',
N'Giường đẹp chất lượng cao giá cả hợp lý\n thoái mái êm',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/giuong-ngu-4-chan-phong-cach-bac-au--(1)_400x400.jpg',
2,12,3500000,3150000,'Whoo',N'Hàn Quốc',1)

insert into Product values (N'GHẾ GIÁM ĐỐC ĐƠN GIẢN HIỆN ĐẠI BJ-715',
N'Ghế đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ghe-giam-doc-don-gian-hien-dai-bj-715-(1)_400x400.jpg',
3,12,2700000,2500000,'Whoo',N'Hàn Quốc',5)

insert into Product values (N'GHẾ LƯỚI XOAY VP LƯNG THẤP MÀU TRẮNG XANH',
N'Ghê đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ghe-luoi-xoay-vp-lung-thap-mau-trang-xanh-(1)_400x400.jpg',
2,12,1900000,17500000,'Whoo',N'Hàn Quốc',5)

insert into Product values ('TÁP ĐẦU GIƯỜNG KÈM GIÁ SÁCH TIỆN ÍCH',
N'Đẹp chất lượng cao giá cả hợp lý, phù hợp với mọi nhà',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/tap-dau-giuong-kem-gia-sach-tien-ich-(1)_400x400.jpg',
2,12,1500000,1250000,'Whoo',N'Hàn Quốc',1)

insert into Product values (N'BÀN PHẤN BẮC ÂU PHỐI HIỆN ĐẠI 100CM KÈM GƯƠNG LED KHÔNG GHẾ',
N'Bàn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ban-phan-bac-au-phoi-hien-dai-100-cm-kem-guong-led-khong-ghe-(1)_400x400.jpg',
3,12,3250000,3000000,'Whoo',N'Hàn Quốc',1)

insert into Product values (N'GIƯỜNG SOFA LƯỜI 180X90CM',
N'Giường đẹp chất lượng cao giá cả hợp lý, lý tưởng cho người lười',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/giuong-sofa-luoi-180x90cm-(1)_400x400.jpg',
2,12,1250000,1000000,'Whoo',N'Hàn Quốc',1)

insert into Product values (N'BÀN PHẤN TÂN CỔ ÁNH VÀNG KÈM GHẾ 3 NGĂN KÉO',
N'Bàn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ban-phan-tan-co-anh-vang-kem-ghe-3-ngan-keo-(1)_400x400.jpg',
2,12,2500000,2250000,'Whoo',N'Hàn Quốc',1)

insert into Product values (N'BÀN PHẤN TÂN CỔ 2 NGĂN KÉO KÈM GHẾ',
N'Bàn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ban-phan-tan-co-2-ngan-keo-kem-ghe-(1)_400x400.jpg',
3,12,2500000,2250000,'Whoo',N'Hàn Quốc',1)

insert into Product values (N'COMBO KỆ TV BÀN TRÀ HIỆN ĐẠI VÂN ÓC CHÓ + XÁM ĐEN',
N'Combo đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/combo-ke-tv-ban-tra-hien-dai-van-oc-cho-+-xam-den-(1)_400x400.jpg',
2,12,10000000,8500000,'Whoo',N'Hàn Quốc',3)

insert into Product values (N'GHẾ VP VI TÍNH LƯỚI XÁM XOAY LƯNG CHÂN THÉP',
N'Ghê ăn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ghe-vp-vi-tinh-luoi-den-xoay-lung-chan-thep--(1)_400x400.jpg',
3,12,2200000,2000000,'Whoo',N'Hàn Quốc',5)

insert into Product values (N'BÀN GIÁM ĐỐC ĐƠN GIẢN',
N'Bàn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ban-giam-doc-don-gian--(1)_400x400.jpg',
2,12,5150000,4650000,'Whoo',N'Hàn Quốc',5)

insert into product values (N'GHẾ ĂN HIỆN ĐẠI',
N'Bàn ăn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ghe-an-hien-dai--(1)_400x400.jpg',
2,12,2000000,1800000,'Whoo',N'Hàn Quốc',4)

insert into Product values (N'KỆ TIVI HIỆN ĐẠI PHONG CÁCH Ý SANG TRỌNG',
N'Giường đẹp chất lượng cao giá cả hợp lý\n thoái mái êm',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ke-tivi-hien-dai-phong-cach-y-sang-trong-(1)_400x400.jpg',
3,12,7000000,6500000,'Whoo',N'Hàn Quốc',3)

insert into Product values (N'GHẾ SOFA ĐƠN BẮC ÂU CÔNG NGHỆ VẢI KHÔNG THẤM NƯỚC',
N'Ghế đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ghe-sofa-don-bac-au-cong-nghe-vai-khong-tham-nuoc-(1)_400x400.jpg',
2,12,4450000,4450000,'Whoo',N'Hàn Quốc',3)

insert into Product values (N'BÀN PHẤN TÂN CỔ 2 NGĂN KÉO KÈM GHẾ',
N'Ghê đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ban-phan-tan-co-2-ngan-keo-kem-ghe-(1)_400x400.jpg',
2,12,3000000,2450000,'Whoo',N'Hàn Quốc',1)

insert into Product values ('GHẾ PHONG CÁCH Ý',
N'Đẹp chất lượng cao giá cả hợp lý, phù hợp với mọi nhà',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ghe-phong-cach-y-(1)_400x400.jpg',
2,12,1200000,999000,'Whoo',N'Hàn Quốc',3)

insert into Product values (N'TÁP GỖ ÓC CHÓ HIỆN ĐẠI HÌNH HỘP 2 NGĂN KÉO',
N'Bàn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/tap-go-oc-cho-hien-dai-hinh-hop-2-ngan-keo-(1)_400x400.jpg',
3,12,3250000,3000000,'Whoo',N'Hàn Quốc',1)

insert into Product values (N'ĐÔN BĂNG CUỐI GIƯỜNG THAY GIÀY BỌC NỈ NHUNG',
N'Giường đẹp chất lượng cao giá cả hợp lý, lý tưởng cho người lười',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/don-bang-cuoi-giuong-thay-giay-boc-ni-nhung--(1)_400x400.jpg',
2,12,3850000,3350000,'Whoo',N'Hàn Quốc',1)

insert into Product values (N'GIƯỜNG HIỆN ĐẠI PHONG CÁCH BẮC MỸ, KHÔNG HỘP, KHÔNG NGĂN',
N'Bàn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/2_400x400.jpg',
3,12,3850000,3350000,'Whoo',N'Hàn Quốc',1)

insert into Product values (N'GIƯỜNG BẮC ÂU HIỆN ĐẠI BỌC DA 1M8',
N'Bàn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/giuong-bac-au-hien-dai-boc-da-1m8-(1)_400x400.jpg',
3,12,12500000,11800000,'Whoo',N'Hàn Quốc',1)

insert into Product values (N'GHẾ THƯ GIÃN FULL BỘ KÈM ĐÔN ĐỂ CHÂN',
N'Combo đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ghe-thu-gian-full-bo-kem-don-de-chan-(1)_400x400.jpg',
2,12,9300000,8800000,'Whoo',N'Hàn Quốc',2)

insert into Product values (N'COMBO KỆ TV BÀN TRÀ HIỆN ĐẠI VÂN SỒI XÁM + ĐEN',
N'Ghê ăn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/combo-ke-tv-ban-tra-hien-dai-van-xoi-xam-+-den-(1)_400x400.jpg',
3,12,19500000,18900000,'Whoo',N'Hàn Quốc',3)

insert into Product values (N'GHẾ ĂN CHÂU ÂU SANG TRỌNG LƯNG CAO',
N'Bàn đẹp chất lượng cao giá cả hợp lý',
'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ghe-an-chau-au-sang-trong-lung-cao--(1)_400x400.jpg',
6,12,3000000,2850000,'Whoo',N'Hàn Quốc',5)

insert into product values(N'COMBO KỆ TV BÀN TRÀ HIỆN ĐẠI VÂN SỒI XÁM + ĐEN',N'Ghê ăn đẹp chất lượng cao giá cả hợp lý',
 'https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ghe-an-chau-au-sang-trong-lung-cao--(1)_400x400.jpg',
 5, 300000 , 300000 ,N'wood',N'châu âu',3)
 select * from [user]
select * from customer 
select * from seller
select * from shop
select * from product
select * from bill
select * from [order]
select * from request
update [user] set userImg = null where userId = 1
drop table category
select * from customer

insert into shop values(2,N'a',N'a',0,0,'a','a','a',0,0,0)



insert into seller values (1,N'vương quốc tuấn',N'Hà nội','tuan@gmail.com','0000000000','03/16/2022',1,'27/09/2001')
insert into customer values(1,N'vương quốc tuấn',N'Hà nội',null,'tuan@gmail.com','0000000000','03/16/2022',1,'27/09/2001')
insert into [user] values('a','a',0,1,0,null,0)