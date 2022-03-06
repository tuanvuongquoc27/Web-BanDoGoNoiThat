create database DoGoNoiThat
go
use DoGoNoiThat 
go
create table Product(
productId int primary key,
productName nvarchar(255),
productImg varchar(255),
productPrice int,
productType int,
)

drop table Product

insert into Product values (1,N'BÀN ĂN ĐÁ CẨM THẠCH TRẮNG CHÂN KIM LOẠI VÀNG ĐỒNG CHỮ V','https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ban-an-da-cam-thach-trang-chan-kim-loai-vang-dong-chu-v-(1)_400x400.jpg',999000,1)
insert into Product values (2,N'GIƯỜNG NGỦ 4 CHÂN PHONG CÁCH BẮC ÂU
','https://noithatnhadep.pro/images/stories/virtuemart/product/resized/giuong-ngu-4-chan-phong-cach-bac-au--(1)_400x400.jpg',123000,1)
insert into Product values (3,N'GHẾ GIÁM ĐỐC ĐƠN GIẢN HIỆN ĐẠI BJ-715
','https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ghe-giam-doc-don-gian-hien-dai-bj-715-(1)_400x400.jpg',456000,1)
insert into Product values (4,N'GHẾ LƯỚI XOAY VP LƯNG THẤP MÀU TRẮNG XANH','https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ghe-luoi-xoay-vp-lung-thap-mau-trang-xanh-(1)_400x400.jpg',789000,1)
insert into Product values (5,'TÁP ĐẦU GIƯỜNG KÈM GIÁ SÁCH TIỆN ÍCH
','https://noithatnhadep.pro/images/stories/virtuemart/product/resized/tap-dau-giuong-kem-gia-sach-tien-ich-(1)_400x400.jpg',100000,1)
insert into Product values (6,N'BÀN PHẤN BẮC ÂU PHỐI HIỆN ĐẠI 100CM KÈM GƯƠNG LED KHÔNG GHẾ
','https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ban-phan-bac-au-phoi-hien-dai-100-cm-kem-guong-led-khong-ghe-(1)_400x400.jpg',112333,1)
insert into Product values (7,N'GIƯỜNG SOFA LƯỜI 180X90CM
','https://noithatnhadep.pro/images/stories/virtuemart/product/resized/giuong-sofa-luoi-180x90cm-(1)_400x400.jpg',123123,1)
insert into Product values (8,N'BÀN PHẤN TÂN CỔ ÁNH VÀNG KÈM GHẾ 3 NGĂN KÉO
','https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ban-phan-tan-co-anh-vang-kem-ghe-3-ngan-keo-(1)_400x400.jpg',123123,1)
insert into Product values (9,N'BÀN PHẤN TÂN CỔ 2 NGĂN KÉO KÈM GHẾ','https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ban-phan-tan-co-2-ngan-keo-kem-ghe-(1)_400x400.jpg',145678,1)
insert into Product values (10,N'COMBO KỆ TV BÀN TRÀ HIỆN ĐẠI VÂN ÓC CHÓ + XÁM ĐEN
','https://noithatnhadep.pro/images/stories/virtuemart/product/resized/combo-ke-tv-ban-tra-hien-dai-van-oc-cho-+-xam-den-(1)_400x400.jpg',165456,1)
insert into Product values (11,N'GHẾ VP VI TÍNH LƯỚI XÁM XOAY LƯNG CHÂN THÉP
','https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ghe-vp-vi-tinh-luoi-den-xoay-lung-chan-thep--(1)_400x400.jpg',176890,1)
insert into Product values (12,N'BÀN GIÁM ĐỐC ĐƠN GIẢN
','https://noithatnhadep.pro/images/stories/virtuemart/product/resized/ban-giam-doc-don-gian--(1)_400x400.jpg',112354,1)



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