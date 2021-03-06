<%-- 
    Document   : shoppage
    Created on : Mar 11, 2022, 11:46:54 PM
    Author     : Admin
--%>

<%@page import="model.Order"%>
<%@page import="model.Product"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${requestScope.shop.getShopName()}</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="./css/shop.css">
        <link rel="stylesheet" href="fonts/fontawesome-free-6.0.0-web/css/all.css">
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        
    </head>

    <body>
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
        <div class="main">
            <div class="header">
                <div class="grid">
                    <!-- header navbar -->
                    <nav class="header__navbar">
                        <ul class="header__navbar-list">
                            <c:if test="${user!=null}">
                                <li class="header__navbar-item"><a href="HomeServletController?page=1" class="header__navbar-item-link">Trang ch???</a></li>
                                <li class="header__navbar-item">Xin ch??o: ${user.userName}  </li>
                                </c:if>
                                <c:if test="${user.isCustomer()&&!user.isAdmin()}">
                                <li class="header__navbar-item"><a class="header__navbar-item-link" href="Seller.jsp?userId=${user.userId}">????ng k?? b??n h??ng</a></li>
                                </c:if>
                        </ul>
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item-has-notify ">
                                <a href="" class="header__navbar-item-link"><i
                                        class="fa-solid fa-bell bell-icon"></i>Th??ng b??o</a>
                                <!-- Notification -->
                                <div class="header__notify">
                                    <header class="header__notify-header">
                                        <h3>Th??ng b??o m???i</h3>
                                    </header>
                                    <ul class="header__notify-list">
                                        <c:if test="${requestlist.size()==0}">
                                            <li class="header__notify-item header__notify-item--viewed"> <h3>Kh??ng c?? th??ng b??o m???i</h3></li>
                                            </c:if>
                                            <c:if test="${requestlist.size()!=0}">
                                                <c:forEach items="${requestlist}" var="list">
                                                    <li class="header__notify-item header__notify-item--viewed">
                                                    <a href="ManagerRequest?store=request-infor&userId=${user.userId}" class="header__notify-link">
                                                        <img src="image/login-img.jpg" alt="" class="header__notify-img">
                                                        <div class="header__notify-infor">
                                                            <span class="header__notify-name">Y??u c???u tr??? th??nh nh?? b??n h??ng</span>
                                                            <c:forEach items="${customerlist}" var="cuslist">
                                                                <c:if test="${list.getCustomerId()==cuslist.getId()}">
                                                                    <span class="header__notify-description">Ng?????i y??u c???u: ${cuslist.getName()}</span>
                                                                    <c:if test="${!list.isRequestState()}">
                                                                        <h6>Ch??a ch???p nh???n</h6>
                                                                    </c:if>

                                                                </c:if>
                                                            </c:forEach>

                                                        </div>
                                                    </a>
                                                </li>       
                                            </c:forEach>

                                        </c:if>
                                    </ul>
                                    <footer class="header__notify-footer">
                                        <a href="" class="header__notify-footer-btn">Xem t???t c???</a>
                                    </footer>
                                </div>
                            </li>
                            <c:if test="${user==null}">
                                <li class="header__navbar-item header__navbar-item--strong">
                                    <a href="/WebDoGoNoiThat/Login.jsp" class="header__navbar-item-link">????ng nh???p</a>
                                </li>
                                <li class="header__navbar-item header__navbar-item--strong">
                                    <a href="/WebDoGoNoiThat/SignUp.jsp" class="header__navbar-item-link">????ng k??</a>
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
                                            <a href="AccountFileController?role=${role}&userId=${user.userId}">T??i kho???n c???a t??i</a>
                                        </li>
                                        <li class="header__navbar-user-item">
                                            <a href="LogoutServlet">????ng xu???t</a>
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
                        <!-- header cart  -->
                        <div class="header__cart">
                            <div class="header__cart-wrap">
                                <i class="header__cart-icon  fa-solid fa-cart-shopping"></i>
                                <c:if test="${requestScope.orderlist.size()>0}">
                                    <span class="header__cart-number">${requestScope.orderlist.size()}</span>
                                </c:if>
                                <c:if test="${requestScope.orderlist.size()==0||requestScope.orderlist.size()==null}">
                                    <span class="header__cart-number">0</span>
                                </c:if>
                                <!-- no cart : header__cart-list--no-cart  -->
                                <div class="header__cart-list header__cart-list--no-cart">
                                    <c:if test="${requestScope.orderlist==null}">
                                        <img src="image/cart-empty.png" alt="" class="header__cart-list--no-cart-img" />
                                        <p class="header__cart-list--no-cart-message">Kh??ng c?? s???n ph???m</p>
                                    </c:if>
                                    <c:if test="${requestScope.orderlist!=null}">
                                        <% ArrayList<Order> ordlist = (ArrayList<Order>) request.getAttribute("orderlist");
                                            for (int i = 0; i < ordlist.size(); i++) {
                                                ProductDAO prd = new ProductDAO();
                                                Product pro = new Product();
                                                pro = prd.getProduct(ordlist.get(i).getProductId());
                                                request.setAttribute("pro", pro);
                                                request.setAttribute("order", ordlist.get(i)); %>
                                        
                                        <h4 class="header__cart-heading">S???n ph???m</h4>
                                        <ul class="header__cart-list-item">
                                            <!-- cart item -->
                                            <li class="header__cart-item">
                                                <img src="${requestScope.pro.getProductImg()}" alt="" class="header__cart-img">
                                                <div class="header__cart-item-infor">
                                                    <div class="header__cart-item-head">
                                                        <h5 class="header__cart-item-name">${requestScope.pro.getProductName()}</h5>
                                                        <div class="header__cart-item-pricewrap">
                                                            <span class="header__cart-item-price"><fmt:formatNumber type="number" pattern="###,###,###??" value="${requestScope.order.getProductPrice()}" /></span>
                                                            <span class="header__cart-item-ope">x</span>
                                                            <span class="header__cart-item-quantity">${requestScope.order.getProductQuantity()}</span>
                                                        </div>

                                                    </div>
                                                    <div class="header__cart-item-body">
                                                        <span class="header__cart-item-description">Xu???t x???: ${requestScope.pro.getProductBrand()}</span>
                                                        <span class="header__cart-item-delete">X??a</span>
                                                    </div>
                                                </div>
                                            </li>

                                        </ul>
                                        <%}%>
                                        <a href="CartServletController?userId=${sessionScope.user.userId}" class="nav-link btn-order">Xem gi??? h??ng</a>
                                    </c:if>



                                </div>
                                <!--  cart : header cart list no cart  -->
                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <div class="body">
                <div class="row shop__information">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10 shop__infor">
                        <div class="shop__infor-name">
                            <img class="shop-img" src="./image/login-img.jpg" alt="">
                            <h3 class="shop-name">${requestScope.shop.getShopName()}</h3>
                        </div>
                        <div class="shop__infor2">
                            <ul>
                                <li class="quantity"><i class="quantity-icon fa-solid fa-store"></i>S??? l?????ng: ${requestScope.shop.getShopProductQuantity()}</li>
                                <li class="sold"><i class="sold-icon fa-brands fa-sellcast"></i>???? b??n: ${requestScope.shop.getShopProductSold()} </li>
                                <li class="join"><i class="join-icon fa-solid fa-user-check"></i>Ng??y tham gia: ${requestScope.shop.getShopDate()}</li>
                            </ul>
                            <ul>
                                <li class="phone-number">S??? ??i???n tho???i: ${requestScope.shop.getShopPhone()}</li>
                                <li class="address">?????a ch???: ${requestScope.shop.getShopAddress()}</li>
                                <li class="rate">????nh gi??: </li>
                            </ul>
                        </div>


                    </div>
                    <div class="col-sm-1"></div>
                </div>


                <!-- Product top -->

                <div class="row product__shop-sell">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-2">
                        <div class="product">
                            <h4 class="product__header"><i class="product__header-icon fa-solid fa-list"></i>S???n Ph???m
                            </h4>
                            <ul class="product__list nav flex-column">
                                <li class="product__list-item nav-item ">
                                    <a class=" product__list-item--link nav-link" href="#">T???t c??? s???n ph???m</a>
                                </li>
                                <li class="product__list-item nav-item ">
                                    <a class=" product__list-item--link nav-link" href="#">N???i th???t ph??ng ng???</a>
                                </li>
                                <li class="product__list-item nav-item product__list-item--active">
                                    <a class=" product__list-item--link nav-link" href="#">N???i th???t ph??ng h???c </a>
                                </li>
                                <li class="product__list-item nav-item">
                                    <a class="product__list-item--link nav-link" href="#">N???i th???t ph??ng kh??ch </a>
                                </li>
                                <li class="product__list-item nav-item">
                                    <a class="product__list-item--link nav-link" href="#">N???i th???t ph??ng b???p </a>
                                </li>
                                <li class="product__list-item nav-item">
                                    <a class="product__list-item--link nav-link" href="#">N???i th???t ph??ng l??m vi??c </a>
                                </li>

                            </ul>

                        </div>
                    </div>
                    <!-- product -->
                    <div class="col-sm-8">
                        <div class="home-product">
                            <div class="row">
                                <c:forEach items="${requestScope.productlist}" varStatus="loop" var="p">
                                    <c:set var="percent" value="${(100-(p.getProductNewPrice()/p.getProductOldPrice())*100)}"/>
                                    <fmt:parseNumber var="j" integerOnly="true" pattern="." type="number" value="${percent}"/>  
                                    <div class="col-sm-3">
                                        <a href="ProductServletController?productId=<c:out value="${p.getProductId()}"/>&userId=${sessionScope.user.userId}" class="home-product-item">
                                            <div class="home-product-item__img"
                                                 style="background-image: url('<c:out value="${p.getProductImg()}"/>');">
                                            </div>
                                            <h5 class="home-product-item__name"><c:out value="${p.getProductName()}"/></h5>
                                            <div class="home-product-item__price">
                                                <span class="home-product-item__price-old"><fmt:formatNumber type="number" pattern="###,###,###??" value="${p.getProductOldPrice()}" /></span>
                                                <span class="home-product-item__price-current"><fmt:formatNumber type="number" pattern="###,###,###??" value="${p.getProductNewPrice()}" /></span>
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
                                                <span class="home-product-item__origin-name"><c:out value="${p.getProductOrigin()}"/> </span>
                                            </div>
                                            <div class="home-product-item__favorite">
                                                <i class="fa-solid fa-check"></i>
                                                Y??u th??ch
                                            </div>
                                            <c:if test="${percent!=0}">
                                                <div class="home-product-item__sell-off">
                                                    <span class="home-product-item__sell-off--percent"><c:out value="${j}"/> %</span>
                                                    <span class="home-product-item__sell-off--label">Gi???m</span>
                                                </div>
                                            </c:if>
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
                            <h3 class="message__header">Giao h??ng t???n n??i</h3>
                            <p class="message__description">Giao h??ng nhanh ch??ng, ?????m b???o ch???t l?????ng tr??n to??n qu???c</p>
                        </div>
                    </div>
                    <div class="message-section row">
                        <div class="message__icon col-sm-2">
                            <img class="message__icon-img" src="/web/image/footter1.png" alt="">
                        </div>
                        <div class="message__infor col-sm-10">
                            <h3 class="message__header">Thanh to??n khi nh???n h??ng </h3>
                            <p class="message__description">Thanh to??n khi nh???n ???????c h??ng ?????m b???o ch???t l?????ng.</p>
                        </div>
                    </div>
                    <div class="message-section row">
                        <div class="message__icon col-sm-2">
                            <img class="message__icon-img" src="/web/image/footer2.png" alt="">
                        </div>
                        <div class="message__infor col-sm-10">
                            <h3 class="message__header">Cam k???t ch???t l?????ng</h3>
                            <p class="message__description">Ch??ng t??i cam k???t ch???t l?????ng c??c m???t h??ng b??n ra</p>
                        </div>
                    </div>
                </div>
                <div class="row footer-main">
                    <div class="col-sm-3 first-footer footer-section">
                        <h3 class="footer__heading">Ch??m s??c kh??ch h??ng</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Trung t??m tr??? gi??p</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Mall</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">H?????ng d???n mua h??ng</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-2 footer-section">
                        <h3 class="footer__heading">Gi???i Thi???u</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Gi???i thi???u</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Tuy???n d???ng</a>
                            </li>

                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">??i???u kho???n</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-2 footer-section">
                        <h3 class="footer__heading">Li??n h???</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">?????a ch???:S??? XX, ???????ng Nguy???n A, H?? n???i</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Li??n h??? : 098XXXXXXX</a>
                            </li>

                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">??i???u kho???n</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-2 footer-section">
                        <h3 class="footer__heading">Theo d??i</h3>
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
                        <h3 class="footer__heading">Ch??m s??c kh??ch h??ng</h3>

                    </div>
                </div>

            </div>
        </div>



    </body>

</html>
