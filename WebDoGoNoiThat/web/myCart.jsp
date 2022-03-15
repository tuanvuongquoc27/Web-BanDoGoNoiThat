<%-- 
    Document   : myCart
    Created on : Mar 11, 2022, 11:46:28 PM
    Author     : Admin
--%>

<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="DAO.ProductDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Giỏ hàng</title>
        <link rel="shortcut icon" href="./image/cart.png" type="image/x-icon">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">        
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/mystore.css">
        <link rel="stylesheet" href="fonts/fontawesome-free-6.0.0-web/css/all.css">
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="main">
            <div class="row header">
                <div class="col-sm-1"></div>
                <div class="col-sm-10 header__cart">
                    <a class="" href="HomeServletController?userId=${sessionScope.user.userId}"><i class="fa-solid fa-house"></i>Trang chủ</a>
                    <span class="cart-name">Giỏ hàng</span>
                </div>
                <div class="col-sm-1"></div>
            </div>
            <div class="container product__information">
                <div class="row product__thead">
                    <div class="col-sm-5"><h2>Sản phẩm </h2></div>
                    <div class="col-sm-2"><h2>Đơn giá</h2></div>
                    <div class="col-sm-1"><h2>Số lượng</h2></div>
                    <div class="col-sm-2"><h2>Thành tiền</h2></div>
                    <div class="col-sm-2"></div>
                </div>
                <c:if test="${requestScope.orderlist!=null}">
                    <c:set var="totalmoney" value="${0}"></c:set>
                    <% ArrayList<Order> ordlist = (ArrayList<Order>) request.getAttribute("orderlist");
                        for (int i = 0; i < ordlist.size(); i++) {
                            ProductDAO prd = new ProductDAO();
                            Product pro = new Product();
                            pro = prd.getProduct(ordlist.get(i).getProductId());
                            request.setAttribute("pro", pro);
                            request.setAttribute("order", ordlist.get(i)); %>

                    <div class="row product__row">
                        <div class="col-sm-5 product__cart">
                            <img src="${requestScope.pro.getProductImg()}" alt="" class="header__cart-img img-fluid">
                            <h5 class="home-product-item__name">${requestScope.pro.getProductName()}</h5>

                        </div>
                        <div class="col-sm-2 product__price"><fmt:formatNumber type="number" pattern="###,###,###đ" value="${requestScope.order.getProductPrice()}" /></div>
                        <div class="col-sm-1 product__quantity">${requestScope.order.getProductQuantity()}</div>
                        <div class="col-sm-2 product__total"><fmt:formatNumber type="number" pattern="###,###,###đ" value="${requestScope.order.getProductTotal()}" /></div>
                        <div class="col-sm-1"> <a href="CartServletController?deleteId=${requestScope.pro.getProductId()}&userId=${sessionScope.user.userId}" class="nav-link delete-link">Xóa</a></div>
                        <div class="col-sm-1"> <a href="CartServletController?deleteId=${requestScope.pro.getProductId()}&userId=${sessionScope.user.userId}" class="nav-link delete-link">Thêm</a></div>
                    </div>

                    <c:set var="totalmoney" value="${requestScope.order.getProductTotal()+totalmoney}"></c:set>
                    <%}%>


                    <div class="row">
                        <div class="col-sm-9"></div>
                        <div class="col-sm-3 total-pay">
                            <h3>Tống tiền hàng: <fmt:formatNumber type="number" pattern="###,###,###đ" value="${totalmoney}" /></h3>
                            <h3>Phí vận chuyển: 20.000đ</h3>
                            <h3>Tổng thanh toán: <fmt:formatNumber type="number" pattern="###,###,###đ" value="${totalmoney+20000}" /></h3>
                        </div>
                    </div>  

                    <div class="product__pay">
                        <form action="BillController" method="post">
                            <input type="hidden" value="${totalmoney+20000}" name="totalmoney"/>
                            <input type="hidden" value="${sessionScope.user.userId}" name="userId"/>
                            <h2>Phương thức thanh toán</h2>
                            <select name="option-pay" id="" class="pay-option">
                                <option value="type1">Thanh toán ví điện tử</option>
                                <option value="type2">Thanh toán khi nhận hàng</option>
                            </select>
                            <input type="submit" class="sub-btn" value="Thanh toán">
                        </form>
                            
                                
                    </div>
                </c:if>
                <c:if test="${requestScope.order==null}">
                    
                    
                </c:if>
                <h2>${mess}</h2>

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
