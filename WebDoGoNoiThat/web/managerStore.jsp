<%-- 
    Document   : managerStore
    Created on : Mar 11, 2022, 11:50:28 PM
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
        <link rel="stylesheet" href="css/managerStore.css">
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
                            <li class="header__navbar-item"><a href="Home.html" class="header__navbar-item-link">Trang
                                    chủ</a></li>

                            <li class="header__navbar-item">Xin chào: </li>
                            <li class="header__navbar-item"><a class="header__navbar-item-link" href="Seller.html">Đăng kí
                                    bán hàng</a></li>
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
                                                    <span class="header__notify-description">description</span>
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

                                    <h4 class="header__cart-heading">Sản phẩm</h4>
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
                                    <a href="#" class="btn-order">Xem giỏ hàng</a>
                                </div>
                                <!--  cart : header cart list no cart  -->
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-2">
                        <div class="product__list-item nav-item">
                            <div class="dropdown product__list-item">
                                <a href="#" data-bs-toggle="dropdown"
                                   class="dropdown-toggle nav-link product__list-item--link">Tháng</a>
                                <ul class="dropdown-menu product__list-child">
                                    <li class="dropdown-item product__list-item--child "><a href="#"
                                                                                            class="product__list-item-link--child nav-link">Tháng 1</a>
                                    </li>
                                    <li class="dropdown-item product__list-item--child "><a href="#"
                                                                                            class="product__list-item-link--child nav-link">Tháng 2</a>
                                    </li>
                                    <li class="dropdown-item product__list-item--child "><a href="#"
                                                                                            class="product__list-item-link--child nav-link">Tháng 3</a>
                                    </li>
                                    <li class="dropdown-item product__list-item--child "><a href="#"
                                                                                            class="product__list-item-link--child nav-link">Tháng 4</a>
                                    </li>
                                    <li class="dropdown-item product__list-item--child "><a href="#"
                                                                                            class="product__list-item-link--child nav-link">Tháng 5</a>
                                    </li>
                                    <li class="dropdown-item product__list-item--child "><a href="#"
                                                                                            class="product__list-item-link--child nav-link">Tháng 6</a>
                                    </li>
                                    <li class="dropdown-item product__list-item--child "><a href="#"
                                                                                            class="product__list-item-link--child nav-link">Tháng 7</a>
                                    </li>
                                    <li class="dropdown-item product__list-item--child "><a href="#"
                                                                                            class="product__list-item-link--child nav-link">Tháng 8</a>
                                    </li>
                                    <li class="dropdown-item product__list-item--child "><a href="#"
                                                                                            class="product__list-item-link--child nav-link">Tháng 9</a>
                                    </li>
                                    <li class="dropdown-item product__list-item--child "><a href="#"
                                                                                            class="product__list-item-link--child nav-link">Tháng 10</a>
                                    </li>
                                    <li class="dropdown-item product__list-item--child "><a href="#"
                                                                                            class="product__list-item-link--child nav-link">Tháng 11</a>
                                    </li>
                                    <li class="dropdown-item product__list-item--child "><a href="#"
                                                                                            class="product__list-item-link--child nav-link">Tháng 12</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-10">
                        <div class="store-infor">
                            <h1>Thông tin cửa hàng</h1>
                        </div>

                        <table>
                            <tr>
                                <td>ID</td>
                                <td>Tên của hàng</td>
                                <td>Tên tài khoản</td>
                                <td>Số lượng sản phẩm</td>
                                <td>Doanh thu của cửa hàng</td>
                                <td>Lợi nhuận của cửa hàng</td>
                                <td>Lợi nhuận từ cửa hàng</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>ID</td>
                                <td><a href="" class="nav-link store-manager">aaaa</a></td>
                                <td>Tên tài khoản</td>
                                <td>Số lượng sản phẩm</td>
                                <td>Doanh thu của cửa hàng</td>
                                <td>Lợi nhuận của cửa hàng</td>
                                <td>Lợi nhuận từ cửa hàng</td>
                                <td><a href="#" class="nav-link">Xóa cửa hàng</a></td>
                            </tr>

                        </table>
                        <div class="add__store">
                            <a href="#" class="nav-link add__store-link">Thêm cửa hàng</a>
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

        </div>

    </body>

</html>
