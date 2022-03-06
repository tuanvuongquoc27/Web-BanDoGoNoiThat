<%-- 
    Document   : HomePage
    Created on : Mar 6, 2022, 1:05:15 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>

<head>
    <title>TODO supply a title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/base.css">
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
                                <a href="#" class="btn-order">Watch order</a>
                            </div>
                            <!--  cart : header cart list no cart  -->
                        </div>
                    </div>
                </div>
            </div>


        </div>

        <!-- nav bar -->
        <div class="nav-bar">
            <!-- category  -->
            <div class="category">
                <div class="d-flex justify-content-between category__list">
                    <div class="dropdown category__list-item ">
                        <a href="#" data-bs-toggle="dropdown"
                            class="dropdown-toggle nav-link category__list-item--link"><i
                                class="fa-solid fa-list-ul"></i></a>
                        <ul class="dropdown-menu category__list-child">
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Quản lí tài khoản</a>
                            </li>
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Quản lý cửa hàng</a>
                            </li>
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Thêm sản phẩm</a></li>
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Sửa sản phẩm</a>
                            </li>
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Xóa sản phẩm</a>
                            </li>
                        </ul>
                    </div>
                    <div class="category__list-item--header">
                        <a href="#" class="nav-link">Trang chủ</a>
                    </div>
                    <div class="dropdown category__list-item ">
                        <a href="#" data-bs-toggle="dropdown"
                            class="dropdown-toggle nav-link category__list-item--link">Nội thất phòng ngủ</a>
                        <ul class="dropdown-menu category__list-child">
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Giường</a>
                            </li>
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Bàn trang
                                    điểm</a></li>
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Tủ</a>
                            </li>
                        </ul>
                    </div>
                    <div class="dropdown category__list-item">
                        <a href="#" data-bs-toggle="dropdown"
                            class="dropdown-toggle nav-link category__list-item--link">Nội thất phònghọc</a>
                        <ul class="dropdown-menu category__list-child">
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Bàn học</a></li>
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Giá sách</a></li>
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Bàn máy tính</a></li>
                        </ul>
                    </div>
                    <div class="dropdown category__list-item">
                        <a href="#" data-bs-toggle="dropdown"
                            class="dropdown-toggle nav-link category__list-item--link">Nội thất phòng khách</a>
                        <ul class="dropdown-menu category__list-child">
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Bàn</a> </li>
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Ghế</a> </li>
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Kệ tivi</a></li>
                        </ul>
                    </div>
                    <div class="dropdown category__list-item">
                        <a href="#" data-bs-toggle="dropdown"
                            class=" dropdown-toggle nav-link category__list-item--link">Nội thất phòng bếp</a>
                        <ul class="dropdown-menu category__list-child">
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Tủ bếp</a></li>
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Bàn ăn</a></li>
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Ghế ăn</a></li>
                        </ul>
                    </div>
                    <div class="dropdown category__list-item">
                        <a href="#" data-bs-toggle="dropdown"
                            class="dropdown-toggle nav-link category__list-item--link">Nội thất phòng làm việc</a>
                        <ul class="dropdown-menu category__list-child">
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Bàn làm việc</a></li>
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Tủ đựng đồ</a></li>
                            <li class="dropdown-item category__list-item--child "><a href="#"
                                    class="category__list-item-link--child nav-link">Ghế </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- container -->
        <div class="container">
            <!-- Product top -->
            <div class="row">
                <div class="col-sm-2">
                    <div class="product">
                        <h4 class="product__header"><i class="product__header-icon fa-solid fa-list"></i>Sản Phẩm
                        </h4>
                        <ul class="product__list nav flex-column">
                            <li class="product__list-item nav-item">
                                <a class="product__list-item--link nav-link" href="#">Sản phẩm mua nhiều nhất</a>
                            </li>
                            <li class="product__list-item nav-item">
                                <a class="product__list-item--link nav-link" href="#">Sản phẩm giảm giá</a>
                            </li>
                            <li class="product__list-item nav-item">
                                <div class="dropdown product__list-item">
                                    <a href="#" data-bs-toggle="dropdown"
                                        class="dropdown-toggle nav-link product__list-item--link">Giá</a>
                                    <ul class="dropdown-menu product__list-child">
                                        <li class="dropdown-item product__list-item--child "><a href="#"
                                                class="product__list-item-link--child nav-link">200.000đ-300.00đ</a>
                                        </li>
                                        <li class="dropdown-item product__list-item--child "><a href="#"
                                                class="product__list-item-link--child nav-link">300.000đ-400.00đ</a>
                                        </li>
                                        <li class="dropdown-item product__list-item--child "><a href="#"
                                                class="product__list-item-link--child nav-link">400.000đ-500.00đ</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>

                    </div>
                </div>
                <!-- product -->
                <div class="col-sm-10">
                    <div class="home-product">
                        <div class="row">
                            <c:forEach items="${requestScope.productlist}" varStatus="loop" var = "s">
                            <div class="col-sm-3">
                                <a href="#" class="home-product-item">
                                    <div class="home-product-item__img" style="background-image: url('<c:out value="${s.getImg()}"/>');"></div>
                                    <h5 class="home-product-item__name"><c:out value="${s.getName()}"/></h5>
                                    <div class="home-product-item__price">
                                        <span class="home-product-item__price-old">1.200.000đ</span>
                                        <span class="home-product-item__price-current"><c:out value="${s.getPrice()}"/></span>
                                    </div>
                                    <div class="home-product-item__action">
                                        <!-- home-product-item__like--liked -->
                                        <span class="home-product-item__like ">
                                            <i class="home-product-item__like-icon-empty fa-regular fa-heart"></i>
                                            <i class="home-product-item__like-icon-fill fa-solid fa-heart"></i>
                                        </span>
                                        <div class="home-product-item__rating">
                                            <i class="home-product-item__star-gold fa-solid fa-star"></i>
                                            <i class="home-product-item__star-gold fa-solid fa-star"></i>
                                            <i class="home-product-item__star-gold fa-solid fa-star"></i>
                                            <i class="home-product-item__star-gold fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="home-product-item__origin">
                                        <span class="home-product-item__brand">Whoo</span>
                                        <span class="home-product-item__origin-name">Han Quoc </span>
                                    </div>
                                    <div class="home-product-item__favorite">
                                        <i class="fa-solid fa-check"></i>
                                        Yêu thích 
                                    </div>
                                    <div class="home-product-item__sell-off">
                                        <span class="home-product-item__sell-off--percent">10%</span>
                                        <span class="home-product-item__sell-off--label">Sale</span>
                                    </div>
                                </a>
                            </div>
                                </c:forEach>
                            
                            
                        </div>
                    </div>
                    <ul class="pagination">
                        <li class="pagination-item">
                            <a href="" class="pagination-item__link">
                                <i class="pagination-item__icon fa-solid fa-angle-left"></i>
                            </a>
                        </li>
                        <li class="pagination-item pagination-item--active">
                            <a href="" class="pagination-item__link">1</a>
                        </li>
                        <li class="pagination-item">
                            <a href="" class="pagination-item__link">2</a>
                        </li>
                        <li class="pagination-item">
                            <a href="" class="pagination-item__link">3</a>
                        </li>
                        <li class="pagination-item">
                            <a href="" class="pagination-item__link">4</a>
                        </li>
                        <li class="pagination-item">
                            <a href="" class="pagination-item__link">5</a>
                        </li>
                        <li class="pagination-item">
                            <a href="" class="pagination-item__link">...</a>
                        </li>
                        <li class="pagination-item">
                            <a href="" class="pagination-item__link">14</a>
                        </li>
                        <li class="pagination-item">
                            <a href="" class="pagination-item__link">
                                <i class="pagination-item__icon fa-solid fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                </div>

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