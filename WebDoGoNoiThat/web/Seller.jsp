<%-- 
    Document   : Seller
    Created on : Mar 11, 2022, 11:45:15 PM
    Author     : Admin
--%>

<%@page import="model.Seller"%>
<%@page import="DAO.SellerDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng kí bán hàng</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/seller.css">
        <link rel="stylesheet" href="fonts/fontawesome-free-6.0.0-web/css/all.css">
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    </head>

    <body>
        <div class="container">
            <h1 class="">Đăng kí thông tin</h1>
            <div class="shop-information">
                <h2>${wait}</h2>
                <c:if test="${mess!=null}">
                    <h2>${mess}</h2>
                    <a type="button" class="btn btn-secondary" href="AccountMoneyController?userId=${sessionScope.user.userId}">Nạp Tiền</a>
                </c:if>

                <form action="SignupSeller" method="post">
                    <c:if test="${seller==null}">
                        <table>
                            <tr>
                                <td>Tên shop</td>
                                <td><input name="input-shopName" type="text" required></td>
                            </tr>
                            <tr>
                                <td>Địa chỉ</td>
                                <td><input name="input-shopAddress" type="text" required></td>
                            </tr>
                            <tr>
                                <td>Số điện thoại</td>
                                <td><input name="input-shopPhone" type="text" required ></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><input name="input-shopEmail" type="email" required></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>Phí dịch vụ(200.000đ)</td>
                            </tr>
                            <tr>
                            <input type="hidden" name="userId" value="${sessionScope.user.userId}"/>
                            </tr>
                        </table>
                    </c:if>
                    <c:if test="${seller!=null}">
                        <table>
                            <tr>
                                <td>Tên shop</td>
                                <td><input name="input-shopName" value="${shop.getShopName()}" readonly="true" type="text" required></td>
                            </tr>
                            <tr>
                                <td>Địa chỉ</td>
                                <td><input name="input-shopName" value="${shop.getShopAddress()}" readonly="true" type="text" required></td>
                            </tr>
                            <tr>
                                <td>Số điện thoại</td>
                                <td><input name="input-shopName" value="${shop.getShopPhone()}" readonly="true" type="text" required></td
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><input name="input-shopName" value="${shop.getShopEmail()}" readonly="true" type="text" required></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>Phí dịch vụ(200.000đ)</td>
                            </tr>
                            <tr>
                            <input type="hidden" name="userId" value="${sessionScope.user.userId}"/>

                            </tr>
                        </table>
                    </c:if>
                    <c:if test="${seller==null}">
                        <input class="btn btn-secondary" type="submit" value="Đăng kí">
                    </c:if>
                    <a type="button" class="btn btn-secondary" href="HomeServletController?page=1&userId=${sessionScope.user.userId}">Trở về</a>
                </form>
            </div>
        </div>
    </body>
</body>
</html>
