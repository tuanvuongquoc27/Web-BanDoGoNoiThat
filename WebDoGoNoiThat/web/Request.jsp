<%-- 
    Document   : Request.jsp
    Created on : Mar 17, 2022, 11:59:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                    <table>
                        <tr>
                            <td>Tên shop</td>

                            <c:if test="${seller!=null}">
                                <td><input name="input-shopName" value="${shop.getShopName()}" readonly="true" type="text" required></td>
                                </c:if>
                                <c:if test="${seller==null}">
                                <td><input name="input-shopName" type="text" required></td>
                                </c:if>

                        </tr>
                        <tr>
                            <td>Địa chỉ</td>
                            <c:if test="${seller!=null}">
                                <td><input name="input-shopName" value="${shop.getShopAddress()}" readonly="true" type="text" required></td>
                                </c:if>
                                <c:if test="${seller==null}">
                                <td><input name="input-shopAddress" type="text" required></td>
                                </c:if>

                        </tr>
                        <tr>
                            <td>Số điện thoại</td>
                            <c:if test="${seller!=null}">
                                <td><input name="input-shopName" value="${shop.getShopPhone()}" readonly="true" type="text" required></td>
                                </c:if>
                                <c:if test="${seller==null}">
                                <td><input name="input-shopPhone" type="text" required ></td>
                                </c:if>

                        </tr>
                        <tr>
                            <td>Email</td>
                            <c:if test="${seller!=null}">
                                <td><input name="input-shopName" value="${shop.getShopEmail()}" readonly="true" type="text" required></td>
                                </c:if>
                                <c:if test="${seller==null}">
                                <td><input name="input-shopEmail" type="email" required></td>
                                </c:if>

                        </tr>
                        <tr>
                            <td></td>
                            <td>Phí dịch vụ(200.000đ)</td>
                        </tr>
                        <tr>
                        <input type="hidden" name="userId" value="${sessionScope.user.userId}"/>

                        </tr>
                    </table>
                    <c:if test="${seller==null}">
                        <input class="btn btn-secondary" type="submit" value="Đăng kí">
                    </c:if>

                    <a type="button" class="btn btn-secondary" href="HomeServletController?page=1&userId=${sessionScope.user.userId}">Trở về</a>
                </form>
            </div>
        </div>
    </body>
</html>
