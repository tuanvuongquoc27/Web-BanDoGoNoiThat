<%-- 
    Document   : myShop
    Created on : Mar 11, 2022, 11:46:14 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="./css/shop.css">
        <link rel="stylesheet" href="css/myshop.css">
        <link rel="stylesheet" href="fonts/fontawesome-free-6.0.0-web/css/all.css">
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        <div class="main">
            <!-- header -->
            <div class="header">
                <div class="grid">
                    <!-- header navbar -->
                    <nav class="header__navbar">
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item"><a href="Home.html" class="header__navbar-item-link">Trang chủ</a></li>
                            <li class="header__navbar-item">Xin chào......</li>
                        </ul>
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item-has-notify ">
                                <a href="" class="header__navbar-item-link"><i class="fa-solid fa-bell bell-icon"></i>Thông
                                    báo</a>
                                <!-- Notification -->
                                <div class="header__notify">
                                    <header class="header__notify-header">
                                        <h3>Thông báo mới</h3>
                                    </header>
                                    <ul class="header__notify-list">
                                        <li class="header__notify-item header__notify-item--viewed">
                                            <a href="#" class="header__notify-link">
                                                <img src="image/login-img.jpg" alt="" class="header__notify-img">
                                                <div class="header__notify-infor">
                                                    <span class="header__notify-name">Thông tin</span>
                                                    <span class="header__notify-description">Mô tả</span>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    <footer class="header__notify-footer">
                                        <a href="" class="header__notify-footer-btn">Xem tất cả</a>
                                    </footer>
                                </div>
                            </li>
                            <li class="header__navbar-item header__navbar-item--strong">
                                <a href="/WebDoGoNoiThat/Login.jsp" class="header__navbar-item-link">Đăng nhập</a>
                            </li>
                            <li class="header__navbar-item header__navbar-item--strong">
                                <a href="/WebDoGoNoiThat/SignUp.jsp" class="header__navbar-item-link">Đăng kí</a>
                            </li>
                        </ul>
                    </nav>
                    <!-- header with search -->
                    <div class="header-with-search">
                        <div class="header__search">
                            <input type="text" class="header__search-input" placeholder="Enter to search"></input>
                            <button type="submit" formaction="LoginServlet.java" class="header__search-btn">
                                <i class="header__search-btn-icon fa-solid fa-magnifying-glass"></i>
                            </button>

                        </div>
                        <!-- header cart  -->
                        <div class="header__cart">
                            <div class="header__cart-wrap">
                                <i class="header__cart-icon  fa-solid fa-cart-shopping"></i>
                                <span class="header__cart-number">3</span>
                                <!-- no cart : header__cart-list--no-cart  -->
                                <div class="header__cart-list header__cart-list--no-cart">
                                    <img src="image/cart-empty.png" alt="" class="header__cart-list--no-cart-img" />
                                    <p class="header__cart-list--no-cart-message">Không có sản phẩm</p>

                                    <h4 class="header__cart-heading">Product</h4>
                                    <ul class="header__cart-list-item">
                                        <!-- cart item -->
                                        <li class="header__cart-item">
                                            <img src="image/login-img.jpg" alt="" class="header__cart-img">
                                            <div class="header__cart-item-infor">
                                                <div class="header__cart-item-head">
                                                    <h5 class="header__cart-item-name">Bộ kem đặc trị vùng mắt</h5>
                                                    <div class="header__cart-item-pricewrap">
                                                        <span class="header__cart-item-price">2.000.000đ</span>
                                                        <span class="header__cart-item-ope">x</span>
                                                        <span class="header__cart-item-quantity">1</span>
                                                    </div>

                                                </div>
                                                <div class="header__cart-item-body">
                                                    <span class="header__cart-item-description">Phân loại</span>
                                                    <span class="header__cart-item-delete">Xóa</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="header__cart-item">
                                            <img src="image/login-img.jpg" alt="" class="header__cart-img">
                                            <div class="header__cart-item-infor">
                                                <div class="header__cart-item-head">
                                                    <h5 class="header__cart-item-name">Bộ kem đặc trị vùng mắt</h5>
                                                    <div class="header__cart-item-pricewrap">
                                                        <span class="header__cart-item-price">2.000.000đ</span>
                                                        <span class="header__cart-item-ope">x</span>
                                                        <span class="header__cart-item-quantity">1</span>
                                                    </div>

                                                </div>
                                                <div class="header__cart-item-body">
                                                    <span class="header__cart-item-description">Phân loại</span>
                                                    <span class="header__cart-item-delete">Xóa</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="header__cart-item">
                                            <img src="image/login-img.jpg" alt="" class="header__cart-img">
                                            <div class="header__cart-item-infor">
                                                <div class="header__cart-item-head">
                                                    <h5 class="header__cart-item-name">Bộ kem đặc trị vùng mắt</h5>
                                                    <div class="header__cart-item-pricewrap">
                                                        <span class="header__cart-item-price">2.000.000đ</span>
                                                        <span class="header__cart-item-ope">x</span>
                                                        <span class="header__cart-item-quantity">1</span>
                                                    </div>

                                                </div>
                                                <div class="header__cart-item-body">
                                                    <span class="header__cart-item-description">phân loại</span>
                                                    <span class="header__cart-item-delete">Xóa</span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <a href="#" class="btn-order">Xem giỏ hàng</a>
                                </div>
                                <!--  cart : header cart list no cart  -->
                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <!-- body -->
            <div class="body">
                <div class="row shop__information">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10 shop__infor">
                        <div class="shop__infor-name">
                            <img class="shop-img" src="./image/login-img.jpg" alt="">
                            <h3 class="shop-name">Cửa hàng của tôi</h3>

                        </div>
                        <div class="shop__infor2">
                            <ul>
                                <li class="quantity"><i class="quantity-icon fa-solid fa-store"></i>Số lượng: </li>
                                <li class="sold"><i class="sold-icon fa-brands fa-sellcast"></i>Đã bán: </li>
                                <li class="join"><i class="join-icon fa-solid fa-user-check"></i>Ngày tham gia: </li>
                            </ul>
                            <ul>
                                <li class="phone-number">Số điện thoại: 098xxxxxxx</li>
                                <li class="address">Địa chỉ: Phố X Hẻm Y Thành phố Z</li>
                                <li class="rate">Đánh giá: </li>
                            </ul>
                        </div>


                    </div>
                    <div class="col-sm-1"></div>
                </div>


                <!-- Product top -->

                <div class="row product__shop-sell">
                    <div class="col-sm-3">
                        <div class="product">
                            <h4 class="product__header"><i class="product__header-icon fa-solid fa-list"></i>Shop của tôi
                            </h4>
                            <ul class="product__list nav flex-column">
                                <li class="product__list-item nav-item ">
                                    <a href="" class="nav-link product__list-item--link">Tất cả sản phẩm</a> 
                                </li>
                                <li class="product__list-item nav-item ">
                                    <a href="" class="nav-link product__list-item--link">Thêm sản phẩm</a> 
                                </li>
                                <li class="product__list-item nav-item ">
                                    <a href="" class="nav-link product__list-item--link">Doanh thu</a> 
                                </li>
                                <li class="product__list-item nav-item ">
                                    <a href="" class="nav-link product__list-item--link">Thay đổi thông tin</a> 
                                </li>

                            </ul>

                        </div>
                    </div>
                    <!-- product -->

                    <div class="col-sm-9">
                        <div class="product__information">
                            <div class="row product__thead">
                                <div class="col-sm-4"><h2>Tên sản phẩm </h2></div>
                                <div class="col-sm-2"><h2>Phân loại</h2></div>
                                <div class="col-sm-2"><h2>Giá</h2></div>
                                <div class="col-sm-1"><h2>Kho</h2></div>
                                <div class="col-sm-1"><h2>Đã bán</h2></div>
                                <div class="col-sm-2"><h2></h2></div>
                            </div>
                            <div class="row product__row">
                                <div class="col-sm-4 product__cart">
                                    <img src="./image/login-img.jpg" alt="" class="header__cart-img img-fluid">
                                    <h5 class="home-product-item__name">Set dung trang Whoo dodng y Set dung trang Whoo dodng y Set dung trang Whoo dodng y </h5>
                                </div>
                                <div class="col-sm-2 product__style">Ghế</div>
                                <div class="col-sm-2 product__price">2.000đ</div>
                                <div class="col-sm-1 product__quantity">12</div>
                                <div class="col-sm-1 product__total">24.000đ</div>
                                <div class="col-sm-2 product__delete"> <span><a href="#" class="nav-link">Xóa</a></span><span><a href="#" class="nav-link">Sửa</a></span></div>
                            </div>
                            <div class="row product__row">
                                <div class="col-sm-4 product__cart">
                                    <img src="./image/login-img.jpg" alt="" class="header__cart-img img-fluid">
                                    <h5 class="home-product-item__name">Set dung trang Whoo dodng y Set dung trang Whoo dodng y Set dung trang Whoo dodng y </h5>
                                </div>
                                <div class="col-sm-2 product__style">Ghế</div>
                                <div class="col-sm-2 product__price">2.000đ</div>
                                <div class="col-sm-1 product__quantity">12</div>
                                <div class="col-sm-1 product__total">24.000đ</div>
                                <div class="col-sm-2 product__delete"> <span><a href="#" class="nav-link">Xóa</a></span><span><a href="#" class="nav-link">Sửa</a></span></div>
                            </div>
                            <div class="row product__row">
                                <div class="col-sm-4 product__cart">
                                    <img src="./image/login-img.jpg" alt="" class="header__cart-img img-fluid">
                                    <h5 class="home-product-item__name">Set dung trang Whoo dodng y Set dung trang Whoo dodng y Set dung trang Whoo dodng y </h5>
                                </div>
                                <div class="col-sm-2 product__style">Ghế</div>
                                <div class="col-sm-2 product__price">2.000đ</div>
                                <div class="col-sm-1 product__quantity">12</div>
                                <div class="col-sm-1 product__total">24.000đ</div>
                                <div class="col-sm-2 product__delete"> <span><a href="#" class="nav-link">Xóa</a></span><span><a href="#" class="nav-link">Sửa</a></span></div>
                            </div>
                            <div class="row product__row">
                                <div class="col-sm-4 product__cart">
                                    <img src="./image/login-img.jpg" alt="" class="header__cart-img img-fluid">
                                    <h5 class="home-product-item__name">Set dung trang Whoo dodng y Set dung trang Whoo dodng y Set dung trang Whoo dodng y </h5>
                                </div>
                                <div class="col-sm-2 product__style">Ghế</div>
                                <div class="col-sm-2 product__price">2.000đ</div>
                                <div class="col-sm-1 product__quantity">12</div>
                                <div class="col-sm-1 product__total">24.000đ</div>
                                <div class="col-sm-2 product__delete"> <span><a href="#" class="nav-link">Xóa</a></span><span><a href="#" class="nav-link">Sửa</a></span></div>
                            </div>
                            <div class="row product__row">
                                <div class="col-sm-4 product__cart">
                                    <img src="./image/login-img.jpg" alt="" class="header__cart-img img-fluid">
                                    <h5 class="home-product-item__name">Set dung trang Whoo dodng y Set dung trang Whoo dodng y Set dung trang Whoo dodng y </h5>
                                </div>
                                <div class="col-sm-2 product__style">Ghế</div>
                                <div class="col-sm-2 product__price">2.000đ</div>
                                <div class="col-sm-1 product__quantity">12</div>
                                <div class="col-sm-1 product__total">24.000đ</div>
                                <div class="col-sm-2 product__delete"> <span><a href="#" class="nav-link">Xóa</a></span><span><a href="#" class="nav-link">Sửa</a></span></div>
                            </div>
                            <div class="row product__row">
                                <div class="col-sm-4 product__cart">
                                    <img src="./image/login-img.jpg" alt="" class="header__cart-img img-fluid">
                                    <h5 class="home-product-item__name">Set dung trang Whoo dodng y Set dung trang Whoo dodng y Set dung trang Whoo dodng y </h5>
                                </div>
                                <div class="col-sm-2 product__style">Ghế</div>
                                <div class="col-sm-2 product__price">2.000đ</div>
                                <div class="col-sm-1 product__quantity">12</div>
                                <div class="col-sm-1 product__total">24.000đ</div>
                                <div class="col-sm-2 product__delete"> <span><a href="#" class="nav-link">Xóa</a></span><span><a href="#" class="nav-link">Sửa</a></span></div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>

            <!-- footer -->
            <div class="footer">

                <div class=" footer__header">
                    <div class="message message-section row">
                        <div class="message__icon col-sm-2">
                            <img src="/web/image/footer3.png" alt="">
                        </div>
                        <div class="message__infor col-sm-10">
                            <h3 class="message__header">Giao hàng tận nơi</h3>
                            <p class="message__description">Giao hàng nhanh chóng, đảm bảo chất lượng trên toàn quốc</p>
                        </div>
                    </div>
                    <div class="message-section row">
                        <div class="message__icon col-sm-2">
                            <img class="message__icon-img" src="/web/image/footter1.png" alt="">
                        </div>
                        <div class="message__infor col-sm-10">
                            <h3 class="message__header">Thanh toán khi nhận hàng </h3>
                            <p class="message__description">Thanh toán khi nhận được hàng đảm bảo chất lượng.</p>
                        </div>
                    </div>
                    <div class="message-section row">
                        <div class="message__icon col-sm-2">
                            <img class="message__icon-img" src="/web/image/footer2.png" alt="">
                        </div>
                        <div class="message__infor col-sm-10">
                            <h3 class="message__header">Cam kết chất lượng</h3>
                            <p class="message__description">Chúng tôi cam kết chất lượng các mặt hàng bán ra</p>
                        </div>
                    </div>
                </div>
                <div class="row footer-main">
                    <div class="col-sm-3 first-footer footer-section">
                        <h3 class="footer__heading">Chăm sóc khách hàng</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Trung tâm trợ giúp</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Mall</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Hướng dẫn mua hàng</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-2 footer-section">
                        <h3 class="footer__heading">Giới Thiệu</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Giới thiệu</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Tuyển dụng</a>
                            </li>

                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Điều khoản</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-2 footer-section">
                        <h3 class="footer__heading">Liên hệ</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Địa chỉ:Số XX, đường Nguyễn A, Hà
                                    nội</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Liên hệ : 098XXXXXXX</a>
                            </li>

                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Điều khoản</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-2 footer-section">
                        <h3 class="footer__heading">Theo dõi</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link"><i
                                        class="footer__list-item--icon fa-brands fa-facebook"></i>Facebook</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link"><i
                                        class="footer__list-item--icon fa-brands fa-instagram-square"></i>Instagram</a>
                            </li>

                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link"><i
                                        class="footer__list-item--icon fa-brands fa-linkedin"></i>Linkedin</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-3 last-footer footer-section">
                        <h3 class="footer__heading">Chăm sóc khách hàng</h3>

                    </div>
                </div>

            </div>
        </div>



    </body>

</html>