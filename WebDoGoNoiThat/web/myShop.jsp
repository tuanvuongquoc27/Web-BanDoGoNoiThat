<%-- 
    Document   : myShop
    Created on : Mar 11, 2022, 11:46:14 PM
    Author     : Admin
--%>

<%@page import="model.Product"%>
<%@page import="model.Order"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="./image/shop.png" type="image/x-icon">
        <title>My Shop</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/shop.css">
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
                            <c:if test="${sessionScope.user!=null}">
                                <li class="header__navbar-item"><a href="HomeServletController?userId=${sessionScope.user.userId}" class="header__navbar-item-link">Trang chủ</a></li>
                                <li class="header__navbar-item">Xin chào: ${sessionScope.user.userName}  </li>
                                </c:if>
                                <c:if test="${sessionScope.user.role=='customer'}">
                                <li class="header__navbar-item"><a class="header__navbar-item-link" href="Seller.html">Đăng kí bán hàng</a></li>
                                </c:if>

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
                            <c:if test="${sessionScope.user==null}">
                                <li class="header__navbar-item header__navbar-item--strong">
                                    <a href="/WebDoGoNoiThat/Login.jsp" class="header__navbar-item-link">Đăng nhập</a>
                                </li>
                                <li class="header__navbar-item header__navbar-item--strong">
                                    <a href="/WebDoGoNoiThat/SignUp.jsp" class="header__navbar-item-link">Đăng kí</a>
                                </li> 
                            </c:if>
                            <c:if test="${sessionScope.user!=null}">
                                <li class="header__navbar-item header__navbar-user">
                                    <img src="data:image/png;base64,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" alt="" class="header_navbar-user-img">
                                    <span class="header_navbar-user-name">${sessionScope.user.userName}</span>
                                    <ul class="header__navbar-user-menu">
                                        <li class="header__navbar-user-item">
                                            <a href="AccountFileController?role=${sessionScope.user.role}&userId=${sessionScope.user.userId}">Tài khoản của tôi</a>
                                        </li>
                                        <li class="header__navbar-user-item">
                                            <a href="LogoutServlet">Đăng xuất</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if> 
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

                        <li class="quantity"><i class="quantity-icon fa-solid fa-store"></i>Số lượng: ${requestScope.shop.getShopProductQuantity()}</li>
                        <li class="sold"><i class="sold-icon fa-brands fa-sellcast"></i>Đã bán: ${requestScope.shop.getShopProductSold()} </li>
                        <li class="join"><i class="join-icon fa-solid fa-user-check"></i>Ngày tham gia: ${requestScope.shop.getShopDate()}</li>
                    </ul>
                    <ul>
                        <li class="phone-number">Số điện thoại: ${requestScope.shop.getShopPhone()}</li>
                        <li class="address">Địa chỉ: ${requestScope.shop.getShopAddress()}</li>
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
                            <a href="ShopManagerProduct?update=getAll&userId=${sessionScope.user.userId}" class="nav-link product__list-item--link">Tất cả sản phẩm</a> 
                        </li>
                        <li class="product__list-item nav-item ">
                            <a href="ShopManagerProduct?update=insert" class="nav-link product__list-item--link">Thêm sản phẩm</a> 
                        </li>
                        <li class="product__list-item nav-item ">
                            <a href="ShopManagerProduct?update=reveneu" class="nav-link product__list-item--link">Doanh thu</a> 
                        </li>

                    </ul>

                </div>
            </div>
            <!-- product -->
            <c:if test="${update=='getAll'}">
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
                    <c:forEach items="${requestScope.productlist}" var="pro">
                        <div class="row product__row">
                            <div class="col-sm-4 product__cart">
                                <img src="<c:out value="${pro.getProductImg()}"/>" alt="" class="header__cart-img img-fluid">
                                <h5 class="home-product-item__name"><c:out value="${pro.getProductName()}"/> </h5>
                            </div>
                            <div class="col-sm-2 product__style">Ghế</div>
                            <div class="col-sm-2 product__price"><fmt:formatNumber type="number" pattern="###,###,###đ" value="${pro.getProductNewPrice()}" /></div>
                            <div class="col-sm-1 product__quantity"><c:out value="${pro.getProductQuantity()}"/></div>
                            <div class="col-sm-1 product__total"><c:out value="${pro.getProductBrand()}"/></div>
                            <div class="col-sm-2 product__delete"> 
                                <span><a onclick="if (!confirm('Are you sure?')) { return false; }" href="ShopManagerProduct?productIddelete=${pro.getProductId()}&userId=${sessionScope.user.userId}" class="nav-link">Xóa</a>
                                </span><span><a href="ShopManagerProduct?productIdupdate=${pro.getProductId()}&userId=${sessionScope.user.userId}&update=update" class="nav-link">Sửa</a></span></div>
                        </div>
                    </c:forEach>
                </div>

            </div>
            </c:if>
            <!--sửa sản phẩm-->
            <c:if test="${update=='update'}">
                <div class="col-sm-9">
                    
                    <form action="ShopManagerProduct" method="post">
                        <input type="hidden" value="${sessionScope.user.userId}" name="input-shopId"/>
                        <input type="hidden" value="setting" name="update"/>
                        <input name="input-id" type="hidden" value="${requestScope.product.getProductId()}">
                        <span>
                            <h4 class="input-name">Id sản phẩm</h4>
                            <input disabled="true" type="text" value="${requestScope.product.getProductId()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">Tên sản phẩm</h4>
                            <input name="input-name" type="text" value="${requestScope.product.getProductName()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">Mô tả sản phẩm</h4>
                            <input name="input-descript" type="text" value="${requestScope.product.getProductDescript()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">Ảnh</h4>
                            <input name="input-img" type="text" value="${requestScope.product.getProductImg()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">Số lượng sản phẩm</h4>
                            <input name="input-quantity" type="number" value="${requestScope.product.getProductQuantity()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">Giá sản phẩm</h4>
                            <input name="input-price" type="text" value="${requestScope.product.getProductNewPrice()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">Thương hiệu sản phẩm</h4>
                            <input name="input-brand" type="text" value="${requestScope.product.getProductBrand()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">Xuất xứ</h4>
                            <input name="input-origin" type="text" value="${requestScope.product.getProductOrigin()}">
                        </span><br>
                        <span> 
                        <h4 class="input-name">Loại sản phẩm</h4>
                        <select name="input-type" class="form-select">
                            <option value="Nội thất phòng học">Nội thất phòng học</option>
                            <option value="Nội thất phòng ngủ">Nội thất phòng ngủ</option>
                            <option value="Nội thất phòng bếp">Nội thất phòng bếp</option>
                            <option value="Nội thất phòng làm việc">Nội thất phòng làm việc</option>
                            <option value="Nội thất phòng khách">Nội thất phòng khách</option>
                        </select>
                    </span>
                        <input type="submit" class="submit-btn" value="Cập nhật">
                    </form>

                </div>
            </c:if>
            
            <!--thêm mới sản phẩm-->
            <c:if test="${update=='insert'}">
            <div class="col-sm-9">
               
                <form action="ShopManagerProduct" method="post">
                    <input type="hidden" value="insert-new" name="update"/>
                    <input type="hidden" value="${sessionScope.user.userId}" name="input-shopId">
                    <span>
                        <h4 class="input-name">Tên sản phẩm</h4>
                        <input name="input-name" type="text">
                    </span><br>
                    <span>
                        <h4 class="input-name">Mô tả sản phẩm</h4>
                        <input name="input-descript" type="text">
                    </span><br>
                    <span>
                        <h4 class="input-img">Ảnh sản phẩm</h4>
                        <input name="input-img" type="text">
                    </span><br>
                    <span>
                        <h4 class="input-quantity">Số lượng sản phẩm</h4>
                        <input name="input-quantity" type="number">
                    </span><br>
                    <span>
                        <h4 class="input-price">Giá sản phẩm</h4>
                        <input name="input-price" type="text">
                    </span><br>
                    <span>
                        <h4 class="input-brand">Thương hiệu</h4>
                        <input name="input-brand" type="text">
                    </span><br>
                    <span>
                        <h4 class="input-origin">Xuất xứ</h4>
                        <input name="input-origin" type="text">
                    </span><br>
                    <span> 
                        <h4 class="input-name">Loại sản phẩm</h4>
                        <select name="input-type" class="form-select">
                            <option value="Nội thất phòng học">Nội thất phòng học</option>
                            <option value="Nội thất phòng ngủ">Nội thất phòng ngủ</option>
                            <option value="Nội thất phòng bếp">Nội thất phòng bếp</option>
                            <option value="Nội thất phòng làm việc">Nội thất phòng làm việc</option>
                            <option value="Nội thất phòng khách">Nội thất phòng khách</option>
                        </select>
                    </span> 
                    <input type="submit" class="submit-btn" value="Thêm mới">
                </form>
            </div>
            </c:if>
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
