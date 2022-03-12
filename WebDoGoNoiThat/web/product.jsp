<%-- 
    Document   : product
    Created on : Mar 11, 2022, 11:46:40 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <link rel="stylesheet" href="css/cartproduct.css">
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
                                <a href="" class="header__navbar-item-link"><i
                                        class="fa-solid fa-bell bell-icon"></i>Notification</a>
                                <!-- Notification -->
                                <div class="header__notify">
                                    <header class="header__notify-header">
                                        <h3>New notification</h3>
                                    </header>
                                    <ul class="header__notify-list">
                                        <li class="header__notify-item header__notify-item--viewed">
                                            <a href="#" class="header__notify-link">
                                                <img src="image/login-img.jpg" alt="" class="header__notify-img">
                                                <div class="header__notify-infor">
                                                    <span class="header__notify-name">information</span>
                                                    <span class="header__notify-description">description</span>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    <footer class="header__notify-footer">
                                        <a href="" class="header__notify-footer-btn">Watch all</a>
                                    </footer>
                                </div>
                            </li>
                            <li class="header__navbar-item header__navbar-item--strong">
                                <a href="/WebDoGoNoiThat/Login.jsp" class="header__navbar-item-link">Login</a>
                            </li>
                            <li class="header__navbar-item header__navbar-item--strong">
                                <a href="/WebDoGoNoiThat/SignUp.jsp" class="header__navbar-item-link">Sign Up</a>
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
                                    <p class="header__cart-list--no-cart-message">No product</p>

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
                                                    <span class="header__cart-item-description">phân loại</span>
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
                                    <a href="#" class="nav-link btn-order">Watch order</a>
                                </div>
                                <!--  cart : header cart list no cart  -->
                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <div class="body">
                <div class="row product__buy">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10 product__cart">
                        <div class="row">
                            <div class="col-sm-5 product__cart-image">
                                <img class="product__cart-img" src="${product.getProductImg()}" alt="">
                            </div>
                            <c:set var="product" value="${requestScope.product}" />
                            <c:set var="percent" value="${100-(product.getProductNewPrice()/product.getProductOldPrice())*100}" />
                            <fmt:parseNumber var="j" integerOnly="true" pattern="." type="number" value="${percent}"/> 
                            <div class="col-sm-6 product__cart-infor">
                                <div class="product__cart-header">
                                    <h4 class="product__cart-name">${product.getProductName()}</h4>
                                    <span class="product__cart-header--star">
                                        <i class="product__cart-header--star-golden fa-solid fa-star"></i>
                                        <i class="product__cart-header--star-golden fa-solid fa-star"></i>
                                        <i class="product__cart-header--star-golden fa-solid fa-star"></i>
                                        <i class="product__cart-header--star-golden fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </span>
                                    <span class="product__cart-header--rate">3K Đánh giá</span>
                                    <span class="product__cart-header--sold">8,4k Đã bán</span>
                                </div>
                                <div class="product__cart-price">
                                    <span class="product__cart-price--old">${product.getProductOldPrice()}</span>
                                    <span class="product__cart-price--new">${product.getProductNewPrice()}</span>
                                    <span class="product__cart-price--percent">
                                        ${j}% Giảm</span>
                                </div>
                                <div class="product__cart-address">
                                    <span class="product__cart-address--name">Địa chỉ</span>
                                    <input type="text" class="product__cart-address--place">
                                </div>
                                <div class="product__cart-quatity">
                                    <span>Số lượng</span>

                                </div>

                                <div class="product__cart-buy">
                                    <a href="" class="product__cart-add-to-cart"><i class="fa-solid fa-cart-plus"></i>Add to
                                        cart</a>
                                    <a href="" class="product__cart-buy-product">Buy now</a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-1"></div>
                </div>

                <div class="shop row">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10 shop-bg">
                        <div class="row">
                            <div class="col-sm-5 shop__infor">
                                <img src="./image/login-img.jpg" class="shop-img" alt="">
                                <div class="shop-infor">
                                    <h4 class="shop-name">${requestScope.shop.getShopName()}</h4>
                                    <a href="ShopServletController?shopId=${requestScope.shop.getShopId()}" class="shop-watch">Watch Shop</a>
                                </div>


                            </div>
                            <div class="col-sm-6 shop-description">
                                <span>Product quantity: ${requestScope.shop.getShopProductQuantity()} </span>
                                <span>Product sold: ${requestScope.shop.getShopProductSold()}</span>
                                <span>Ngày tham gia: ${requestScope.shop.getShopDate()} </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-1"></div>

                </div>

                <div class="product__discription row">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10 product-discription">
                        <p>${product.getProductDescript()}</p>
                    </div>
                    <div class="col-sm-1"></div>

                </div>


            </div>

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
                                <a href="#" class="footer__list-item--link nav-link">Địa chỉ:Số XX, đường Nguyễn A, Hà nội</a>
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
                                <a href="#" class="footer__list-item--link nav-link"><i class="footer__list-item--icon fa-brands fa-facebook"></i>Facebook</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link"><i class="footer__list-item--icon fa-brands fa-instagram-square"></i>Instagram</a>
                            </li>

                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link"><i class="footer__list-item--icon fa-brands fa-linkedin"></i>Linkedin</a>
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
