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
            <c:set var="user" value="${sessionScope.user}"/>
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
                    <div class="col-sm-1"></div>
                    <div class="col-sm-5"><h2>Sản phẩm </h2></div>
                    <div class="col-sm-2"><h2>Đơn giá</h2></div>
                    <div class="col-sm-1"><h2>Số lượng</h2></div>
                    <div class="col-sm-2"><h2>Thành tiền</h2></div>
                    <div class="col-sm-1"></div>
                </div>
                <c:if test="${orderlist==null&&mess==null}">
                    <h1 style="align-items: center;margin-top: 500px;">Không có sản phẩm </h1>
                </c:if>
                <c:if test="${orderlist==null&&mess!=null}">
                    <h1 style="align-items: center; margin-top: 500px;">${mess} </h1>
                </c:if> 
                <c:if test="${orderlist!=null&&mess!=null}">
                    <h1 style="align-items: center; margin-top: 500px;">${mess} </h1>
                    <a type="button" class="btn btn-secondary" href="AccountFileUpdate?role=customer}&userId=${user.userId}">Cập nhật</a>
                </c:if>     
                <c:if test="${requestScope.orderlist!=null}">
                    <c:if test="${pay=='continue'}">
                        <form action="BillController" method="post">
                            <% ArrayList<Order> ordlist = (ArrayList<Order>) request.getAttribute("orderlist");
                                for (int i = 0; i < ordlist.size(); i++) {
                                    ProductDAO prd = new ProductDAO();
                                    Product pro = new Product();
                                    pro = prd.getProduct(ordlist.get(i).getProductId());
                                    request.setAttribute("pro", pro);
                                    request.setAttribute("order", ordlist.get(i)); %>
                            <c:if test="${pro!=null}">
                                <div class="row product__row">
                                    <div class="col-sm-1"><input type="checkbox" value="${pro.getProductId()}" name="product" style="margin-left: 50px;margin-top: 28px;width: 20px;height: 21px;" ></div>
                                    <div class="col-sm-5 product__cart">
                                        <img src="${requestScope.pro.getProductImg()}" alt="" class="header__cart-img img-fluid">
                                        <h5 class="home-product-item__name">${requestScope.pro.getProductName()}</h5>

                                    </div>
                                    <div class="col-sm-2 product__price"><fmt:formatNumber type="number" pattern="###,###,###đ" value="${order.getProductPrice()}" /></div>
                                    <div class="col-sm-1 product__quantity"><input type="number" name="quantitynew" value="${order.getProductQuantity()}" min="1" max="${pro.getProductQuantity()}"/></div>
                                    <div class="col-sm-2 product__total">
                                        <c:if test="${pay=='continue'}">
                                            <fmt:formatNumber type="number" pattern="###,###,###đ" value="${order.getProductTotal()}" />
                                        </c:if>
                                    </div>
                                    <div class="col-sm-1"> <a onclick="if (!confirm('Bạn có muốn xóa sản phẩm này')) {
                                                return false;
                                            }" href="CartServletController?deleteId=${pro.getProductId()}&userId=${user.userId}" class="nav-link delete-link">Xóa</a></div>
                                </div>
                            </c:if>

                            <%}%>

                            <input type="hidden" value="continue" name="pay"/>
                            <input type="submit" class="sub-btn" value="Tiếp tục">   

                        </form>
                        <h2>${mess}</h2>
                    </c:if>    
                    <c:if test="${pay=='pay'}">
                        <form action="BillController" method="post">
                            <% ArrayList<Order> newordlist = (ArrayList<Order>) request.getAttribute("orderlist");
                                for (int i = 0; i < newordlist.size(); i++) {
                                    ProductDAO prd = new ProductDAO();
                                    Product pro = new Product();
                                    pro = prd.getProduct(newordlist.get(i).getProductId());
                                    request.setAttribute("pro", pro);
                                    request.setAttribute("order", newordlist.get(i)); %>
                            <div class="row product__row">
                                <c:if test="${order.isSold()}">
                                    <div class="col-sm-1"><input type="checkbox"  checked="true"  name="product" value="${pro.getProductId()}" class="" style="margin-left: 50px;margin-top: 28px;width: 20px;height: 21px;" ></div>
                                    </c:if>
                                    <c:if test="${!order.isSold()}">
                                    <div class="col-sm-1"><input type="checkbox" name="product" value="${pro.getProductId()}" class="" style="margin-left: 50px;margin-top: 28px;width: 20px;height: 21px;" ></div>
                                    </c:if>    


                                <div class="col-sm-5 product__cart">
                                    <img src="${pro.getProductImg()}" alt="" class="header__cart-img img-fluid">
                                    <h5 class="home-product-item__name">${pro.getProductName()}</h5>

                                </div>
                                <div class="col-sm-2 product__price"><fmt:formatNumber type="number" pattern="###,###,###đ" value="${order.getProductPrice()}" /></div>
                                <div class="col-sm-1 product__quantity">${order.getProductQuantity()}</div>
                                <div class="col-sm-2 product__total">
                                    <fmt:formatNumber type="number" pattern="###,###,###đ" value="${order.getProductTotal()}" />
                                </div>
                            </div>
                            <c:if test="${order.isSold()}">
                                <c:set var="totalmoney" value="${order.getProductTotal()+totalmoney}"/>
                            </c:if>
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
                                <h2>Phương thức thanh toán</h2>
                                <select name="option-pay" id="" class="pay-option">
                                    <c:forEach items="${paylist}" var="p">
                                        <option value="type${p.getPayId()}">${p.getPayType()}</option>
                                    </c:forEach>
                                </select>
                                <input type="submit" class="sub-btn" value="Thanh toán">
                            </div>
                            <input type="hidden" value="${sessionScope.user.userId}" name="userId"/>
                            <input type="hidden" value="pay" name="pay"/>
                            <input type="hidden" value="${totalmoney+20000}" name="totalmoney"/>

                        </form>
                        <h2>${mess}</h2>
                    </c:if>
                </c:if>




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
