<%-- 
    Document   : product
    Created on : Mar 11, 2022, 11:46:40 PM
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${product.getProductName()}</title>
        <link rel="shortcut icon" href="./image/main.png" type="image/x-icon">
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
                                <li class="header__navbar-item">Xin ch??o ${user.userName}  </li>
                                </c:if>
                                <c:if test="${user.isCustomer()&&!user.isSeller()}">
                                <li class="header__navbar-item"><a class="header__navbar-item-link" href="Seller.jsp?userId=${user.userId}">????ng k?? b??n h??ng</a></li>
                                </c:if>
                        </ul>
                        <ul class="header__navbar-list">
                            <c:if test="${user!=null&&user.isAdmin()}">
                                <li class="header__navbar-item header__navbar-item-has-notify ">
                                    <a href="" class="header__navbar-item-link"><i class="fa-solid fa-bell bell-icon"></i>Th??ng b??o</a>

                                    <div class="header__notify">
                                        <header class="header__notify-header">
                                            <h3>Th??ng b??o m???i</h3>
                                        </header>
                                        <ul class="header__notify-list">
                                            <c:if test="${requestlist.size()==0}"> <!-- ko c?? y??u c???u -->
                                                <li class="header__notify-item header__notify-item--viewed"> <h3>Kh??ng c?? th??ng b??o m???i</h3></li>
                                                </c:if>
                                                <c:if test="${requestlist.size()!=0}"><!-- c?? y??u c???u -->
                                                <c:forEach items="${requestlist}" var="list">
                                                    <li class="header__notify-item header__notify-item--viewed">
                                                        <a href="ManagerRequest?store=request-infor" class="header__notify-link">
                                                            <img src="image/login-img.jpg" alt="" class="header__notify-img">
                                                            <div class="header__notify-infor">
                                                                <span class="header__notify-name">Y??u c???u tr??? th??nh nh?? b??n h??ng</span>
                                                                <c:if test="${user.isAdmin()}"><!-- hi???n th??? y??u c???u cho user -->
                                                                    <c:forEach items="${customerlist}" var="cuslist">
                                                                        <c:if test="${list.getCustomerId()==cuslist.getId()}"> <!-- check y??u c???u c???a user n??o -->
                                                                            <span class="header__notify-description">Ng?????i y??u c???u: ${cuslist.getName()}</span>
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
                                            <a href="ManagerRequest?store=request-infor&userId=${user.userId}" class="header__notify-footer-btn">Xem t???t c???</a>
                                        </footer>
                                    </div>
                                </li>
                            </c:if>
                            <!--Start d??ng nh???p ????ng k?? -->    
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
                                <c:if test="${orderlist.size()>0}">
                                    <span class="header__cart-number">${orderlist.size()}</span>
                                </c:if>
                                <c:if test="${orderlist.size()==0||orderlist.size()==null}">
                                    <span class="header__cart-number">0</span>
                                </c:if>
                                <!-- no cart : header__cart-list--no-cart  -->
                                <div class="header__cart-list header__cart-list--no-cart">
                                    <c:if test="${orderlist==null}">
                                        <img src="image/cart-empty.png" alt="" class="header__cart-list--no-cart-img" />
                                        <p class="header__cart-list--no-cart-message">Kh??ng c?? s???n ph???m</p>
                                    </c:if>
                                    <c:if test="${orderlist!=null}">
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
                                                <img src="${pro.getProductImg()}" alt="" class="header__cart-img">
                                                <div class="header__cart-item-infor">
                                                    <div class="header__cart-item-head">
                                                        <h5 class="header__cart-item-name">${pro.getProductName()}</h5>
                                                        <div class="header__cart-item-pricewrap">
                                                            <span class="header__cart-item-price"><fmt:formatNumber type="number" pattern="###,###,###??" value="${order.getProductPrice()}" /></span>
                                                            <span class="header__cart-item-ope">x</span>
                                                            <span class="header__cart-item-quantity">${order.getProductQuantity()}</span>
                                                        </div>

                                                    </div>
                                                    <div class="header__cart-item-body">
                                                        <span class="header__cart-item-description">Xu???t x???: ${pro.getProductBrand()}</span>
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
                <div class="row product__buy">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10 product__cart">
                        <div class="row">
                            <div class="col-sm-5 product__cart-image">
                                <img class="product__cart-img" src="${product.getProductImg()}" alt="">
                            </div>
                            <c:set var="product" value="${product}"/>
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
                                    <span class="product__cart-header--rate">3K ????nh gi??</span>
                                    <span class="product__cart-header--sold">${product.getProductQuantitySold()} ???? b??n</span>
                                </div>
                                <div class="product__cart-price">
                                    <c:if test="${j==0}">
                                        <span class="product__cart-price--new"><fmt:formatNumber type="number" pattern="###,###,###??" value="${product.getProductOldPrice()}" /></span>
                                    </c:if> 
                                    <c:if test="${j!=0}">
                                        <span class="product__cart-price--old"><fmt:formatNumber type="number" pattern="###,###,###??" value="${product.getProductOldPrice()}" /></span>
                                        <span class="product__cart-price--new"><fmt:formatNumber type="number" pattern="###,###,###??" value="${product.getProductNewPrice()}" /></span>
                                        <span class="product__cart-price--percent">
                                            ${j}% Gi???m</span>
                                        </c:if> 

                                </div>
                                <form action="AddProductToCart" method="post">
                                    <div class="product__cart-address">
                                        <span class="product__cart-address--name">?????a ch???</span>
                                        <c:if test="${customer.getAddressShip() != null}">
                                            <input type="text" name="addressship" placeholder="${customer.getAddressShip()}" required="true" class="product__cart-address--place"/>
                                        </c:if>
                                        <c:if test="${customer.getAddressShip() == null}">
                                            <input type="text" name="addressship" class="product__cart-address--place" required="true"/>
                                        </c:if>


                                    </div>

                                    <div class="product__cart-quantity">
                                        <table>
                                            <tr>
                                                <td><span class="quantity">S??? l?????ng kho</span></td>
                                                <td>${product.getProductQuantity()}</td>
                                            </tr>
                                            <tr>
                                                <td><span class="quantity">S??? l?????ng mua</span></td>
                                                <td><input type="number" class="input-quantity" name="quantity_input" min="1" max="${product.getProductQuantity()}" value="${quantity}"></td>
                                                <td><input type="hidden" name="productId" value="${product.getProductId()}"/></td>
                                                <td><input type="hidden" name="userId" value="${sessionScope.user.userId}"/></td>
                                            </tr>
                                        </table>



                                    </div>

                                    <div class="product__cart-buy">
                                        <c:if test="${sessionScope.user!=null}">
                                            <span class="product__cart-add-to-cart" >
                                                <i class="product__cart-add-to-cart-icon fa-solid fa-cart-plus"></i><input type="submit" class="product__cart-add-to-cart--input" value="Th??m v??o gi??? h??ng"/>
                                            </span>
                                            <a href="" class="product__cart-buy-product">Mua ngay</a>
                                        </c:if>
                                        <c:if test="${sessionScope.user==null}">
                                            <span class="product__cart-add-to-cart" >
                                                <a href="Login.jsp" class="product__cart-add-to-cart"><i class="fa-solid fa-cart-plus"></i>Th??m v??o gi??? h??ng</a>
                                            </span>
                                            <a href="Login.jsp" class="product__cart-buy-product">Mua ngay</a>
                                        </c:if>
                                        
                                    </div>
                                </form>

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
                                    <h4 class="shop-name">${shop.getShopName()}</h4>
                                    <a href="ShopServletController?shopId=${shop.getShopId()}&userId=${user.userId}" class="shop-watch">Xem shop</a>
                                </div>


                            </div>
                            <div class="col-sm-6 shop-description">
                                <span>Product quantity: ${shop.getShopProductQuantity()} </span>
                                <span>Product sold: ${shop.getShopProductSold()}</span>
                                <span>Ng??y tham gia: ${shop.getShopDate()} </span>
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
