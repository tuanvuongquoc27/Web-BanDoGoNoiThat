<%-- 
    Document   : HomePage
    Created on : Mar 6, 2022, 1:05:15 AM
    Author     : Admin
--%>

<%@page import="model.Product"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>

    <head>
        <title>Trang chủ</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="./image/main.png" type="image/x-icon">
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
    <c:set var="user" scope="session" value="${sessionScope.user}"/>
    <c:choose>  
        <c:when test="${user.isAdmin()}">  
            <c:set var="role" scope="session" value="admin"/>
        </c:when>  
        <c:when test="${user.isCustomer()}">  
            <c:set var="role" scope="session" value="customer"/>
        </c:when>  
        <c:otherwise>  
            <c:set var="role" scope="session" value="seller"/>  
        </c:otherwise>  
    </c:choose> 

    <body>
        <div class="main">
            <!-- header -->
            <div class="header">
                <div class="grid">
                    <!-- header navbar -->
                    <nav class="header__navbar">
                        <ul class="header__navbar-list">    
                            <c:if test="${user!=null}"> <%--đã đăng nhập--%>  
                                <li class="header__navbar-item"><a href="HomeServletController?page=1" class="header__navbar-item-link">Trang chủ</a></li>
                                <li class="header__navbar-item">Xin chào: ${user.userName}  </li>
                                </c:if > 
                                <c:if test="${user.isCustomer()&&!user.isSeller()}">  <%--đã đăng nhập với tư cách khách hàng có thể đăng kí nhà bán hàng--%>
                                <li class="header__navbar-item"><a class="header__navbar-item-link" href="SignupSeller">Đăng kí bán hàng</a></li>
                                </c:if>  
                                <c:if test="${!user.isAdmin()&&user!=null}">  <%--đã đăng nhập với tư cách khách hàng hoặc nhà bán hàng --%>
                                <li class="header__navbar-item"><a class="header__navbar-item-link" href="NewRequest">Đang cập nhật</a></li>
                                </c:if>          
                        </ul>
                        <ul class="header__navbar-list">
                            <!-- Notification -->
                            <c:if test="${user!=null&&user.isAdmin()}">
                                <li class="header__navbar-item header__navbar-item-has-notify ">
                                    <a href="" class="header__navbar-item-link"><i class="fa-solid fa-bell bell-icon"></i>Thông báo</a>

                                    <div class="header__notify">
                                        <header class="header__notify-header">
                                            <h3>Thông báo mới</h3>
                                        </header>
                                        <ul class="header__notify-list">
                                            <c:if test="${requestlist.size()==0}"> <!-- ko có yêu cầu -->
                                                <li class="header__notify-item header__notify-item--viewed"> <h3>Không có thông báo mới</h3></li>
                                                </c:if>
                                                <c:if test="${requestlist.size()!=0}"><!-- có yêu cầu -->
                                                <c:forEach items="${requestlist}" var="list">
                                                    <li class="header__notify-item header__notify-item--viewed">
                                                        <a href="ManagerRequest?store=request-infor" class="header__notify-link">
                                                            <img src="image/login-img.jpg" alt="" class="header__notify-img">
                                                            <div class="header__notify-infor">
                                                                <span class="header__notify-name">Yêu cầu trở thành nhà bán hàng</span>
                                                                <c:if test="${user.isAdmin()}"><!-- hiển thị yêu cầu cho user -->
                                                                    <c:forEach items="${customerlist}" var="cuslist">
                                                                        <c:if test="${list.getCustomerId()==cuslist.getId()}"> <!-- check yêu cầu của user nào -->
                                                                            <span class="header__notify-description">Người yêu cầu: ${cuslist.getName()}</span>
                                                                            <h6>${list.getReponse()}</h6>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </c:if>
                                                            </div>
                                                        </a>
                                                    </li>       
                                                </c:forEach>
                                            </c:if>
                                        </ul>
                                        <footer class="header__notify-footer">
                                            <a href="ManagerRequest?store=request-infor&userId=${user.userId}" class="header__notify-footer-btn">Xem tất cả</a>
                                        </footer>
                                    </div>
                                </li>
                            </c:if>
                            <!--End Notification --> 
                            <!--Start dăng nhập đăng kí -->    
                            <c:if test="${user==null}">
                                <li class="header__navbar-item header__navbar-item--strong">
                                    <a href="/WebDoGoNoiThat/Login.jsp" class="header__navbar-item-link">Đăng nhập</a>
                                </li>
                                <li class="header__navbar-item header__navbar-item--strong">
                                    <a href="/WebDoGoNoiThat/SignUp.jsp" class="header__navbar-item-link">Đăng kí</a>
                                </li> 
                            </c:if>
                            <c:if test="${user!=null}">
                                <li class="header__navbar-item header__navbar-user">
                                    <c:if test="${user.userImg==null}">
                                        <img src="./image/no-avatar.png" alt="" class="header_navbar-user-img">
                                    </c:if>
                                    <c:if test="${user.userImg!=null}">
                                        <img src="${user.userImg}" alt="" class="header_navbar-user-img">
                                    </c:if>
                                    <span class="header_navbar-user-name">${user.userName}</span>
                                    <ul class="header__navbar-user-menu">
                                        <li class="header__navbar-user-item">
                                            <a href="AccountFileController?role=${role}&userId=${user.userId}">Tài khoản của tôi</a>
                                        </li>
                                        <li class="header__navbar-user-item">
                                            <a href="LogoutServlet">Đăng xuất</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if> 
                            <!--End Đăng nhập đăng kí -->     
                        </ul>
                    </nav>

                    <div class="header-with-search">
                        <!-- header with search -->
                        <div class="header__search">
                            <input type="text" class="header__search-input" placeholder="Enter to search"></input>
                            <button type="submit" formaction="LoginServlet.java" class="header__search-btn">
                                <i class="header__search-btn-icon fa-solid fa-magnifying-glass"></i>
                            </button>

                        </div>
                        <!--end search -->
                        <!-- header cart  -->
                        <div class="header__cart">
                            <div class="header__cart-wrap">
                                <i class="header__cart-icon  fa-solid fa-cart-shopping"></i>
                                <!--Start Hiển thị số sản phẩm trên icon-->
                                <c:if test="${orderlist.size()>0}">
                                    <span class="header__cart-number">${orderlist.size()}</span>
                                </c:if>
                                <c:if test="${orderlist.size()==0||orderlist==null}">
                                    <span class="header__cart-number">0</span>
                                </c:if>
                                <!--End Hiển thị số sản phẩm trên icon-->    
                                <!--Start giỏ hàng  -->
                                <div class="header__cart-list header__cart-list--no-cart">
                                    <!--giỏ hàng trông-->
                                    <c:if test="${orderlist==null}">
                                        <img src="image/cart-empty.png" alt="" class="header__cart-list--no-cart-img" />
                                        <p class="header__cart-list--no-cart-message">Không có sản phẩm</p>
                                    </c:if>
                                    <!--giỏ hàng ko trông-->    
                                    <c:if test="${orderlist!=null}">
                                        <!--lấy ra list product trong từng order--> 
                                        <% ArrayList<Order> ordlist = (ArrayList<Order>) request.getAttribute("orderlist");
                                            for (int i = 0; i < ordlist.size(); i++) {
                                                ProductDAO prd = new ProductDAO();
                                                Product pro = new Product();
                                                pro = prd.getProduct(ordlist.get(i).getProductId());
                                                request.setAttribute("pro", pro);
                                                request.setAttribute("order", ordlist.get(i)); %>
                                        <!--lấy ra list product trong từng order-->         

                                        <h4 class="header__cart-heading">Sản phẩm</h4>
                                        <ul class="header__cart-list-item">
                                            <!-- start sản phẩm -->
                                            <c:if test="${pro!=null}">
                                                <li class="header__cart-item">
                                                    <img src="${pro.getProductImg()}" alt="" class="header__cart-img">
                                                    <div class="header__cart-item-infor">
                                                        <div class="header__cart-item-head">
                                                            <h5 class="header__cart-item-name">${pro.getProductName()}</h5>
                                                            <div class="header__cart-item-pricewrap">
                                                                <span class="header__cart-item-price"><fmt:formatNumber type="number" pattern="###,###,###đ" value="${order.getProductPrice()}" /></span>
                                                                <span class="header__cart-item-ope">x</span>
                                                                <span class="header__cart-item-quantity">${order.getProductQuantity()}</span>
                                                            </div>

                                                        </div>
                                                        <div class="header__cart-item-body">
                                                            <span class="header__cart-item-description">Xuất xứ: ${pro.getProductBrand()}</span>
                                                            <span class="header__cart-item-delete"><a onclick="if (!confirm('Bạn có muốn xóa sản phẩm ${pro.getProductName()}')) {
                                                                        return false;
                                                                    }" href="CartServletController?deleteId=${pro.getProductId()}&userId=${user.userId}">Xóa</a></span>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:if>

                                            <!--end sản phẩm-->
                                        </ul>
                                        <%}%>
                                        <a href="CartServletController?userId=${user.userId}" class="nav-link btn-order">Xem giỏ hàng</a>
                                    </c:if>
                                </div>
                                <!--End giỏ hàng-->
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
                        <!--quản lí tài khoản và shop của admin và seller-->
                        <c:if test="${user!=null&&(user.isSeller()||user.isAdmin())}">
                            <div class="dropdown category__list-item ">
                                <a href="#" data-bs-toggle="dropdown"
                                   class="nav-link category__list-item--link"><i
                                        class="fa-solid fa-list-ul"></i></a>
                                <ul class="dropdown-menu category__list-child">
                                    <c:if test="${user.isAdmin()}">
                                        <li class="dropdown-item category__list-item--child ">
                                            <a href="ManagerStoreServlet?infor=all&page=1" class="category__list-item-link--child nav-link">Quản lí tài khoản</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${user.isSeller()||user.isAdmin()}">
                                        <li class="dropdown-item category__list-item--child ">
                                            <a href="ShopServletController?userId=${user.userId}&page=1" class="category__list-item-link--child nav-link">Quản lý cửa hàng</a>
                                        </li>
                                    </c:if>

                                </ul>
                            </div>
                        </c:if>

                        <div class="category__list-item--header">
                            <a href="CategoryServletController?categoryId=0&page=1" class="nav-link category__list-item--link">Tất cả sản phẩm</a>
                        </div>
                        <!--hiển thị category của sản phẩm -->
                        <c:forEach begin="0" end="3" items="${categorylist}" varStatus="loop" var="cate">
                            <div class="dropdown category__list-item ">
                                <a href="CategoryServletController?categoryId=<c:out value="${cate.getCategoryId()}&page=1"/>"
                                   accesskey=""class=" nav-link category__list-item--link"><c:out value="${cate.getCategoryName()}"/></a>
                            </div>
                        </c:forEach>
                        <div class="dropdown category__list-item">
                            <a href="#" data-bs-toggle="dropdown"
                               class="dropdown-toggle nav-link category__list-item--link">Tất cả sản phẩm</a>
                            <ul class="dropdown-menu category__list-child">
                                <c:forEach begin="4" items="${categorylist}" varStatus="loop" var="cate">
                                    <li class="dropdown-item category__list-item--child ">
                                        <a href="CategoryServletController?categoryId=<c:out value="${cate.getCategoryId()}&page=1"/>" class="category__list-item-link--child nav-link"><c:out value="${cate.getCategoryName()}"/></a>
                                    </li>
                                </c:forEach>
                                <!--nếu là admin có thể thêm mới-->    
                                <c:if test="${user.isAdmin()}">
                                    <li class="dropdown-item category__list-item--child ">
                                        <a href="#" class="category__list-item-link--child nav-link">Đang cập nhật</a>
                                    </li>
                                </c:if>
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
                                    <a class="product__list-item--link nav-link" href="ProductSale?page=1">Sản phẩm giảm giá</a>
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
                                <li class="product__list-item nav-item">
                                    <a class="product__list-item--link nav-link" href="#">Đang cập nhật</a>
                                </li>
                            </ul>

                        </div>
                    </div>
                    <!-- product -->
                    <!--hiển thị sản phẩm homecontroller-->

                    <div class="col-sm-10">
                        <c:if test="${productlist.size()==0}">
                            <img style="margin-left: 250px;width:600px;height:400px;" src="./image/cart-empty.png"> 
                            <h1 style="margin-left: 460px;margin-bottom: 200px;">
                                Không có sản phẩm
                            </h1> 
                        </c:if>
                        <c:if test="${productlist!=null}">
                            <div class="home-product">
                                <div class="row">
                                    <c:forEach items="${productlist}" varStatus="loop" var="p">
                                        <c:set var="percent" value="${100-(p.getProductNewPrice()/p.getProductOldPrice())*100}"/>
                                        <fmt:parseNumber var="j" integerOnly="true" pattern="." type="number" value="${percent}"/>
                                        <c:if test="${p.getProductQuantity()>0}">


                                            <div class="col-sm-3">
                                                <c:if test="${user==null}">
                                                    <a href="ProductServletController?productId=<c:out value="${p.getProductId()}"/>" class="home-product-item"/>
                                                </c:if> 
                                                <c:if test="${user!=null}">
                                                    <a href="ProductServletController?productId=<c:out value="${p.getProductId()}"/>&userId=${user.userId}" class="home-product-item"/>
                                                </c:if> 
                                                <div class="home-product-item__img" style="background-image: url('<c:out value="${p.getProductImg()}"/>');"></div>
                                                <h5 class="home-product-item__name"><c:out value="${p.getProductName()}"/></h5>
                                                <div class="home-product-item__price">
                                                    <c:if test="${j!=0}">
                                                        <span class="home-product-item__price-old"><fmt:formatNumber type="number" pattern="###,###,###đ" value="${p.getProductOldPrice()}" /></span>
                                                        <span class="home-product-item__price-current"><fmt:formatNumber type="number" pattern="###,###,###đ" value="${p.getProductNewPrice()}" /></span>
                                                    </c:if>
                                                    <c:if test="${j==0}">
                                                        <span class="home-product-item__price-current"><fmt:formatNumber type="number" pattern="###,###,###đ" value="${p.getProductOldPrice()}" /></span>
                                                    </c:if>
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
                                                    <span class="home-product-item__brand"><c:out value="${p.getProductBrand()}"/></span>
                                                    <span class="home-product-item__origin-name"><c:out value="${p.getProductOrigin()}"/></span>
                                                </div>
                                                <div class="home-product-item__favorite">
                                                    <i class="fa-solid fa-check"></i>
                                                    Yêu thích 
                                                </div>
                                                <c:if test="${j!=0}">
                                                    <div class="home-product-item__sell-off">
                                                        <span class="home-product-item__sell-off--percent"><c:out value="${j}"/> %</span>
                                                        <span class="home-product-item__sell-off--label">Giảm</span>
                                                    </div>
                                                </c:if>

                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>


                                </div>
                            </div>
                        </c:if>
                        <c:if test="${pageing=='cate'}">
                            <ul class="pagination">
                                <c:forEach begin="1" end="${end}" var="i">
                                    <c:if test="${i==page}">
                                        <li class="pagination-item pagination-item--active">
                                            <a href="CategoryServletController?categoryId=${cateid}&page=${i}" class="pagination-item__link">${i}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${i!=page}">
                                        <li class="pagination-item">
                                            <a href="CategoryServletController?categoryId=${cateid}&page=${i}" class="pagination-item__link">${i}</a>
                                        </li>
                                    </c:if>    
                                </c:forEach>
                            </ul>
                        </c:if>
                        <c:if test="${pageing=='home'}">
                            <ul class="pagination">                              
                                <c:forEach begin="1" end="${end}" var="i">
                                    <c:if test="${i==page}">
                                        <li class="pagination-item pagination-item--active">
                                            <a href="HomeServletController?page=${i}" class="pagination-item__link">${i}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${i!=page}">
                                        <li class="pagination-item">
                                            <a href="HomeServletController?page=${i}" class="pagination-item__link">${i}</a>
                                        </li>
                                    </c:if>    
                                </c:forEach>
                            </ul>
                        </c:if>
                        <c:if test="${pageing=='price'}">
                            <ul class="pagination">                              
                                <c:forEach begin="1" end="${end}" var="i">
                                    <c:if test="${i==page}">
                                        <li class="pagination-item pagination-item--active">
                                            <a href="ProductSale?page=${i}" class="pagination-item__link">${i}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${i!=page}">
                                        <li class="pagination-item">
                                            <a href="ProductSale?page=${i}" class="pagination-item__link">${i}</a>
                                        </li>
                                    </c:if>    
                                </c:forEach>
                            </ul>
                        </c:if> 
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
