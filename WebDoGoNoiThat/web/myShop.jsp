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
            <!-- header -->
            <div class="header">
                <div class="grid">
                    <!-- header navbar -->
                    <nav class="header__navbar">
                        <ul class="header__navbar-list">
                            <c:if test="${user!=null}">
                                <li class="header__navbar-item"><a href="HomeServletController?page=1" class="header__navbar-item-link">Trang ch???</a></li>
                                <li class="header__navbar-item">Xin ch??o: ${user.userName}  </li>
                                </c:if>

                        </ul>
                        <!--th??ng b??o y??u c???u-->
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item-has-notify ">
                                <a href="" class="header__navbar-item-link"><i class="fa-solid fa-bell bell-icon"></i>Th??ng
                                    b??o</a>
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
                    <c:if test="${shop.getShopId()!=user.userId}">
                        <img class="shop-img" src="./image/login-img.jpg" alt="">
                        <h3>Qu???n l?? c???a h??ng</h3>
                    </c:if>
                    <c:if test="${shop.getShopId()==user.userId}">
                        <img class="shop-img" src="./image/login-img.jpg" alt="">
                        <h3 class="shop-name">C???a h??ng c???a t??i</h3>
                    </c:if>    



                </div>
                <div class="shop__infor2">
                    <ul>

                        <li class="quantity"><i class="quantity-icon fa-solid fa-store"></i>S??? l?????ng: ${shop.getShopProductQuantity()}</li>
                        <li class="sold"><i class="sold-icon fa-brands fa-sellcast"></i>???? b??n: ${shop.getShopProductSold()} </li>
                        <li class="join"><i class="join-icon fa-solid fa-user-check"></i>Ng??y tham gia: 
                            <c:if test="${shop.getShopDate()==null}">
                                Ch??a c???p nh???t
                            </c:if>
                            <c:if test="${shop.getShopDate()!=null}}">
                                ${shop.getShopDate()}
                            </c:if> </li>
                    </ul>
                    <ul>
                        <li class="phone-number">S??? ??i???n tho???i: 
                            <c:if test="${shop.getShopPhone()==null}">
                                Ch??a c???p nh???t
                            </c:if>
                            <c:if test="${shop.getShopPhone()!=null}">
                                ${shop.getShopPhone()}
                            </c:if>   
                        </li>
                        <li class="address">?????a ch???:
                            <c:if test="${shop.getShopAddress()==null}">
                                Ch??a c???p nh???t
                            </c:if>
                            <c:if test="${shop.getShopAddress()!=null}">
                                ${shop.getShopAddress()}
                            </c:if>   </li>
                        <li class="rate">????nh gi??: </li>
                    </ul>
                </div>


            </div>
            <div class="col-sm-1"></div>
        </div>


        <!-- Product top -->

        <div class="row product__shop-sell">
            <div class="col-sm-3">
                <div class="product">
                    <h4 class="product__header"><i class="product__header-icon fa-solid fa-list"></i>Shop c???a t??i
                    </h4>
                    <ul class="product__list nav flex-column">
                        <c:if test="${shop.getShopId()!=user.userId}">
                            <li class="product__list-item nav-item ">
                                <a href="ShopManagerProduct?update=getAll&shopid=${shop.getShopId()}&page=1&mess=manager" class="nav-link product__list-item--link">T???t c??? s???n ph???m</a> 
                            </li>
                        </c:if>
                        <c:if test="${shop.getShopId()==user.userId}">
                            <li class="product__list-item nav-item ">
                                <a href="ShopManagerProduct?update=getAll&userId=${user.userId}&page=1" class="nav-link product__list-item--link">T???t c??? s???n ph???m</a> 
                            </li>
                        </c:if> 

                        <li class="product__list-item nav-item ">
                            <a href="ShopManagerProduct?update=reveneu&userId=${user.userId}" class="nav-link product__list-item--link">Doanh thu</a> 
                        </li>

                        <c:if test="${shop.getShopId()!=user.userId}">
                            <li class="product__list-item nav-item ">
                                <a href="UpdateInforShop?userId=${shop.getShopId()}" class="nav-link product__list-item--link">C???p nh???t th??ng tin</a> 
                            </li>
                        </c:if>
                        <c:if test="${shop.getShopId()==user.userId}">
                            <li class="product__list-item nav-item ">
                                <a href="UpdateInforShop?userId=${user.userId}" class="nav-link product__list-item--link">C???p nh???t th??ng tin</a> 
                            </li>
                        </c:if> 


                    </ul>

                </div>
            </div>
            <!-- product -->
            <c:if test="${update=='getAll'}">
                <div class="col-sm-9">
                    <div class="product__information">
                        <div class="row product__thead">
                            <div class="col-sm-4"><h2>T??n s???n ph???m </h2></div>
                            <div class="col-sm-2"><h2>Ph??n lo???i</h2></div>
                            <div class="col-sm-2"><h2>Gi??</h2></div>
                            <div class="col-sm-1"><h2>Kho</h2></div>
                            <div class="col-sm-1"><h2>???? b??n</h2></div>
                            <div class="col-sm-2"></div>
                        </div>
                        <c:forEach items="${productlist}" var="pro">
                            <div class="row product__row">
                                <div class="col-sm-4 product__cart">
                                    <img src="<c:out value="${pro.getProductImg()}"/>" alt="" class="header__cart-img img-fluid">
                                    <h5 class="home-product-item__name"><c:out value="${pro.getProductName()}"/> </h5>
                                </div>
                                <div class="col-sm-2 product__style">
                                    <c:forEach items="${categorylist}" var="cat">
                                        <c:if test="${pro.getProductType()==cat.getCategoryId()}">
                                            ${cat.getCategoryName()}
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <div class="col-sm-2 product__price"><fmt:formatNumber type="number" pattern="###,###,###??" value="${pro.getProductNewPrice()}" /></div>
                                <div class="col-sm-1 product__quantity"><c:out value="${pro.getProductQuantity()}"/></div>
                                <div class="col-sm-1 product__total"><c:out value="${pro.getProductQuantitySold()}"/></div>
                                <div class="col-sm-2 product__delete"> 
                                    <c:if test="${shop.getShopId()!=user.userId}">
                                        <span><a onclick="if (!confirm('Are you sure?')) {
                                                    return false;
                                                }" href="ShopManagerProduct?productIddelete=${pro.getProductId()}&userId=${shop.getShopId()}&page=1" class="nav-link">X??a</a>
                                        </span><span><a href="ShopManagerProduct?productIdupdate=${pro.getProductId()}&userId=${shop.getShopId()}&update=update" class="nav-link">S???a</a></span>
                                    </c:if>
                                    <c:if test="${shop.getShopId()==user.userId}">
                                        <span><a onclick="if (!confirm('Are you sure?')) {
                                                    return false;
                                                }" href="ShopManagerProduct?productIddelete=${pro.getProductId()}&userId=${sessionScope.user.userId}&page=1" class="nav-link">X??a</a>
                                        </span><span><a href="ShopManagerProduct?productIdupdate=${pro.getProductId()}&userId=${sessionScope.user.userId}&update=update" class="nav-link">S???a</a></span>
                                    </c:if>



                                </div>
                            </div>

                        </c:forEach>
                        <c:if test="${shop.getShopId()!=user.userId}">
                            <h2> <a type="button" class="btn btn-secondary" href="ShopManagerProduct?update=insert&userId=${shop.getShopId()}">Th??m s???n ph???m</a>  </h2> 
                        </c:if>
                        <c:if test="${shop.getShopId()==user.userId}">
                            <h2> <a type="button" class="btn btn-secondary" href="ShopManagerProduct?update=insert&userId=${user.userId}">Th??m s???n ph???m</a>  </h2> 
                        </c:if> 

                    </div>



                </div>
            </c:if>

            <!--s???a s???n ph???m-->
            <c:if test="${update=='update'}">
                <div class="col-sm-9">

                    <form action="ShopManagerProduct" method="post">
                        <c:if test="${shop.getShopId()!=user.userId}">
                            <input type="hidden" value="${shop.getShopId()}" name="input-shopId"/>
                        </c:if>
                        <c:if test="${shop.getShopId()==user.userId}">
                            <input type="hidden" value="${sessionScope.user.userId}" name="input-shopId"/>
                        </c:if> 

                        <input type="hidden" value="setting" name="update"/>
                        <input name="input-id" type="hidden" value="${product.getProductId()}">
                        <span>
                            <h4 class="input-name">Id s???n ph???m</h4>
                            <input disabled="true" type="text" value="${product.getProductId()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">T??n s???n ph???m</h4>
                            <input name="input-name" type="text" value="${product.getProductName()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">M?? t??? s???n ph???m</h4>
                            <input name="input-descript" type="text" value="${product.getProductDescript()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">???nh</h4>
                            <input name="input-img" type="text" value="${product.getProductImg()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">S??? l?????ng s???n ph???m</h4>
                            <input name="input-quantity" type="number" value="${product.getProductQuantity()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">Gi?? s???n ph???m</h4>
                            <input name="input-price" type="text" value="${product.getProductNewPrice()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">Th????ng hi???u s???n ph???m</h4>
                            <input name="input-brand" type="text" value="${product.getProductBrand()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">Xu???t x???</h4>
                            <input name="input-origin" type="text" value="${product.getProductOrigin()}">
                        </span><br>
                        <span> 
                            <h4 class="input-name">Lo???i s???n ph???m</h4>
                            <select name="input-type" class="form-select">
                                <option value="N???i th???t ph??ng h???c">N???i th???t ph??ng h???c</option>
                                <option value="N???i th???t ph??ng ng???">N???i th???t ph??ng ng???</option>
                                <option value="N???i th???t ph??ng b???p">N???i th???t ph??ng b???p</option>
                                <option value="N???i th???t ph??ng l??m vi???c">N???i th???t ph??ng l??m vi???c</option>
                                <option value="N???i th???t ph??ng kh??ch">N???i th???t ph??ng kh??ch</option>
                            </select>
                        </span>
                        <input type="submit" class="submit-btn" value="C???p nh???t">
                    </form>

                </div>
            </c:if>

            <!--th??m m???i s???n ph???m-->
            <c:if test="${update=='insert'}">
                <div class="col-sm-9">
                    <c:if test="${error!=null}">
                        <h3>${error}</h3>
                        <a type="button" class="btn btn-secondary" href="AccountMoneyController?userId=${sessionScope.user.userId}">N???p Ti???n</a>
                    </c:if>
                    <form action="ShopManagerProduct" method="post">
                        <input type="hidden" value="insert-new" name="update"/>
                        <c:if test="${shop.getShopId()!=user.userId}">
                            <input type="hidden" name="mess"/>
                            <input type="hidden" value="${shop.getShopId()}" name="input-shopId"/>
                        </c:if>
                        <c:if test="${shop.getShopId()==user.userId}">
                            <input type="hidden" value="${sessionScope.user.userId}" name="input-shopId"/>
                        </c:if>
                        <span>
                            <h4 class="input-name">T??n s???n ph???m</h4>
                            <input name="input-name" placeholder="${product.getProductName()}" type="text">
                        </span><br>
                        <span>
                            <h4 class="input-name">M?? t??? s???n ph???m</h4>
                            <input name="input-descript" placeholder="${product.getProductDescript()}" type="text">
                        </span><br>
                        <span>
                            <h4 class="input-img">???nh s???n ph???m</h4>
                            <input name="input-img"placeholder="${product.getProductImg()}" type="text">
                        </span><br>
                        <span>
                            <h4 class="input-quantity">S??? l?????ng s???n ph???m</h4>
                            <input name="input-quantity" placeholder="${product.getProductQuantity()}" type="number">
                        </span><br>
                        <span>
                            <h4 class="input-price">Gi?? mua</h4>
                            <input name="input-pricein" placeholder="${product.getProductEntryPrice()}" type="text">
                        </span><br>
                        <span>
                            <h4 class="input-price">Gi?? b??n</h4>
                            <input name="input-price" placeholder="${product.getProductNewPrice()}" type="text">
                        </span><br>
                        <span>
                            <h4 class="input-brand">Th????ng hi???u</h4>
                            <input name="input-brand" placeholder="${product.getProductBrand()}" type="text">
                        </span><br>
                        <span>
                            <h4 class="input-origin">Xu???t x???</h4>
                            <input name="input-origin" placeholder="${product.getProductOrigin()}" type="text">
                        </span><br>
                        <span> 
                            <h4 class="input-name">Lo???i s???n ph???m</h4>
                            <select name="input-type" class="form-select">
                                <option value="N???i th???t ph??ng h???c">N???i th???t ph??ng h???c</option>
                                <option value="N???i th???t ph??ng ng???">N???i th???t ph??ng ng???</option>
                                <option value="N???i th???t ph??ng b???p">N???i th???t ph??ng b???p</option>
                                <option value="N???i th???t ph??ng l??m vi???c">N???i th???t ph??ng l??m vi???c</option>
                                <option value="N???i th???t ph??ng kh??ch">N???i th???t ph??ng kh??ch</option>
                            </select>
                        </span> 
                        <input type="submit" class="submit-btn" value="Th??m m???i">
                    </form>
                </div>
            </c:if>

            <!--s???a th??ng tin shop-->
            <c:if test="${update=='updateshop'}">
                <div class="col-sm-9">

                    <form action="UpdateInforShop" method="post">

                        <c:if test="${shop.getShopId()!=user.userId}">
                            <input type="hidden" value="${shop.getShopId()}" name="input-shopId"/>
                        </c:if>
                        <c:if test="${shop.getShopId()==user.userId}">
                            <input type="hidden" value="${sessionScope.user.userId}" name="input-shopId"/>
                        </c:if> 


                        <span>
                            <h4 class="input-name">ID</h4>
                            <input disabled="true" type="text" value="${shop.getShopId()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">T??n c???a h??ng</h4>
                            <input name="input-name" type="text" value="${shop.getShopName()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">?????a ch??? c???a h??ng</h4>
                            <input name="input-address" type="text" value="${shop.getShopAddress()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">S??? ??i???n tho???i </h4>
                            <input name="input-phone" type="text" value="${shop.getShopPhone()}">
                        </span><br>
                        <span>
                            <h4 class="input-name">Email</h4>
                            <input name="input-email" type="email" value="${shop.getShopEmail()}">
                        </span><br>
                        <input type="submit" class="submit-btn" value="C???p nh???t">
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
                            <a href="#" class="footer__list-item--link nav-link">?????a ch???:S??? XX, ???????ng Nguy???n A, H??
                                n???i</a>
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
                    <h3 class="footer__heading">Ch??m s??c kh??ch h??ng</h3>

                </div>
            </div>

        </div>
    </div>



</body>

</html>
