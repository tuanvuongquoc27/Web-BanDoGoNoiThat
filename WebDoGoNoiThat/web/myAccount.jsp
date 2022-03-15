<%-- 
    Document   : myAccount
    Created on : Mar 11, 2022, 11:46:02 PM
    Author     : Admin
--%>

<%@page import="model.Product"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tài khoản của tôi</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/header.css">
        <link rel="stylesheet" href="./css/base.css">
        <link rel="stylesheet" href="./css/account.css">
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
                                <li class="header__navbar-item"><a class="header__navbar-item-link" href="Seller.jsp?userId=${sessionScope.user.userId}">Đăng kí bán hàng</a></li>
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
                                            <c:if test="${requestScope.requestlist.size()==0}">
                                                <h3>Không có thông báo mới</h3>
                                            </c:if>
                                            <c:if test="${requestScope.requestlist.size()!=0}">
                                                <c:forEach items="${requestScope.requestlist}" var="list">
                                                    <a href="ManagerRequest?store=request-infor&userId=${sessionScope.user.userId}" class="header__notify-link">
                                                        <img src="image/login-img.jpg" alt="" class="header__notify-img">
                                                        <div class="header__notify-infor">
                                                            <span class="header__notify-name">Yêu cầu trở thành nhà bán hàng</span>
                                                            <c:forEach items="${requestScope.customerlist}" var="cuslist">
                                                                <c:if test="${list.getCustomerId()==cuslist.getCustomerId()}">
                                                                    <span class="header__notify-description">Người yêu cầu: ${cuslist.getCustomerName()}</span>
                                                                </c:if>
                                                            </c:forEach>

                                                        </div>
                                                    </a>
                                                </c:forEach>

                                            </c:if>

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
                                            <a href="AccountFileController?userId=${sessionScope.user.userId}">Tài khoản của tôi</a>
                                        </li>
                                        <li class="header__navbar-user-item">
                                            <a href="LogoutServlet">Đăng xuất</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if> 
                        </ul>
                    </nav>

                </div>
            </div>


        </div>

        <!-- body -->
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="account__infor">
                        <img class="account-img"
                             src="https://mpng.subpng.com/20180411/rzw/kisspng-user-profile-computer-icons-user-interface-mystique-5aceb0245aa097.2885333015234949483712.jpg"
                             alt="">
                        <div>
                            <span class="account-name">${sessionScope.user.userName}</span>
                            <span class="account-money">Số dư tài khoản:<fmt:formatNumber type="number" pattern="###,###,###đ" value="${sessionScope.user.userBanlance}" /></span>
                        </div>

                    </div>
                    <div class="account">
                        <a href="AccountFileController?role=${sessionScope.user.role}&userId=${sessionScope.user.userId}" class="account-file">Thông tin tài khoản</a>
                    </div>
                    <div class="account">
                        <a href="AccountFileUpdate?userId=${sessionScope.user.userId}" class="account-file">Thay đổi thông tin</a>
                    </div>
                    <div class="account">
                        <a href="AccountHistoryController?userId=${sessionScope.user.userId}" class="account-history">Lịch sử mua hàng</a>
                    </div>
                    <div class="account">
                        <a href="AccountPasswordController?userId=${sessionScope.user.userId}" class="account-change-pass">Thay đổi mật khẩu</a>
                    </div>
                    <div class="account">
                        <a href="AccountMoneyController?userId=${sessionScope.user.userId}" class="account-get-money">Nạp tiền</a>
                    </div>

                </div>
                <!--  thông tin -->
                <c:if test="${requestScope.account=='file'}">
                    <div class="col-sm-9 dis-play">
                        <h2>Hồ sơ của tôi </h2>
                        <table>
                            <tr>
                                <td>Tên Đăng nhập</td>
                                <td>${sessionScope.user.userName}</td>
                            </tr>
                            <tr>
                                <td>Họ và Tên </td>
                                <td>
                                    <c:choose>  
                                        <c:when test="${requestScope.seller.getSellerAddress()!=null}">  
                                            ${requestScope.seller.getSellerName()}
                                        </c:when>  
                                        <c:when test="${requestScope.customer.getCustomerAddress()!=null}">  
                                            ${requestScope.customer.getCustomerName()}  
                                        </c:when>  
                                        <c:otherwise>  
                                            Chưa cập nhật 
                                        </c:otherwise>  
                                    </c:choose> 
                                </td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>${requestScope.seller.getSellerEmail()}
                                    ${requestScope.customer.getCustomerEmail()}</td>
                            </tr>
                            <tr>
                                <td>Địa chỉ</td>
                                <td>
                                    <c:choose>  
                                        <c:when test="${requestScope.seller.getSellerAddress()!=null}">  
                                            ${requestScope.seller.getSellerAddress()}
                                        </c:when>  
                                        <c:when test="${requestScope.customer.getCustomerAddress()!=null}">  
                                            ${requestScope.customer.getCustomerAddress()}  
                                        </c:when>  
                                        <c:otherwise>  
                                            Chưa cập nhật 
                                        </c:otherwise>  
                                    </c:choose> 
                                </td>
                            </tr>
                            <tr>
                                <td>Số điện thoại</td>
                                <td>
                                    <c:choose>  
                                        <c:when test="${requestScope.seller.getSellerAddress()!=null}">  
                                            ${requestScope.seller.getSellerPhone()}
                                        </c:when>  
                                        <c:when test="${requestScope.customer.getCustomerAddress()!=null}">  
                                            ${requestScope.customer.getCustomerPhone()}  
                                        </c:when>  
                                        <c:otherwise>  
                                            Chưa cập nhật 
                                        </c:otherwise>  
                                    </c:choose> 
                                </td>
                            </tr>
                            <tr>
                                <td>Giới tính</td>
                                <td>
                                    <c:choose>  
                                        <c:when test="${requestScope.seller.getSellerAddress()!=null}">  
                                            <c:if test="${requestScope.seller.isSellerGender()==true}">
                                                Nam
                                            </c:if>
                                            <c:if test="${requestScope.seller.isSellerGender()==false}">
                                                Nữ
                                            </c:if>
                                        </c:when>  
                                        <c:when test="${requestScope.customer.getCustomerAddress()!=null}">  
                                            <c:if test="${requestScope.customer.isCustomerGender()==true}">
                                                Nam
                                            </c:if>
                                            <c:if test="${requestScope.customer.isCustomerGender()==false}">
                                                Nữ
                                            </c:if>  
                                        </c:when>  
                                        <c:otherwise>  
                                            Chưa cập nhật 
                                        </c:otherwise>  
                                    </c:choose> 
                                </td>
                            </tr>
                            <tr>
                                <td>Ngày sinh</td>
                                <td>
                                    <c:choose>  
                                        <c:when test="${requestScope.seller.getSellerAddress()!=null}">  
                                            ${requestScope.seller.getSellerDOB()}
                                        </c:when>  
                                        <c:when test="${requestScope.customer.getCustomerAddress()!=null}">  
                                            ${requestScope.customer.getCustomerDOB()}  
                                        </c:when>  
                                        <c:otherwise>  
                                            Chưa cập nhật 
                                        </c:otherwise>  
                                    </c:choose> 
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><a href="AccountFileUpdate?userId=${sessionScope.user.userId}" type="button" class="btn btn-secondary btn-lg">Cập nhật</a></td>
                            </tr>
                        </table>
                    </div> 
                </c:if>
                <c:if test="${requestScope.account=='update'}">
                    <div class="col-sm-9 dis-play">
                        <h2>Hồ sơ của tôi </h2>
                        <form action="AccountFileUpdate" method="post">
                            <table>
                                <input type="hidden" name="userId" value="${sessionScope.user.userId}"/>
                                <tr>
                                <input type="hidden" name="role" value="${sessionScope.user.role}"/>
                                <td>Tên Đăng nhập</td>
                                <td>${sessionScope.user.userName}</td>
                                </tr>
                                <tr>
                                    <td>Họ và Tên </td>
                                    <td><input name="input-name" type="text"></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><input name="input-email" type="email"></td>
                                </tr>
                                <tr>
                                    <td>Địa chỉ</td>
                                    <td><input name="input-address" type="text"></td>
                                </tr>
                                <tr>
                                    <td>Số điện thoại</td>
                                    <td><input name="input-phone" type="text"></td>
                                </tr>
                                <tr>
                                    <td>Giới tính</td>
                                    <td><input name="input-gender" value="nam" type="radio"> Nam <input value="nu" name="input-gender" type="radio" /> Nữ </td>
                                </tr>
                                <tr>
                                    <td>Ngày sinh</td>
                                    <td><input name="input-DOB" type="date"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input class="submit-btn" type="submit" value="Lưu"></td>
                                </tr>
                            </table>
                        </form>

                    </div> 
                </c:if>
                <c:if test="${requestScope.account=='password'}">
                    <!-- Thay đổi mật khẩu -->
                    <div class="col-sm-9 dis-play">
                        <div class="change-password">
                            <h2>Thay đổi mật khẩu</h2>
                            <form action="AccountPasswordController" method="post">
                                <table>
                                    <tr>
                                        <td>Mật khẩu cũ</td>
                                        <td><input name="old-pass" type="password"></td>
                                    </tr>
                                    <tr>
                                    <input type="hidden" name="userId" value="${sessionScope.user.userId}"/>
                                    <td>Mật khẩu mới</td>
                                    <td><input name="new-pass" type="password"></td>
                                    </tr>
                                    <tr>
                                        <td>Nhập lại mật khẩu</td>
                                        <td><input name="new-pass-again" type="password"></td>
                                    </tr>
                                    <tr>
                                        <td><input class="submit-btn" type="Submit" value="Thay đổi"></td>
                                        <td>${requestScope.mess}</td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div> 
                </c:if>
                <c:if test="${requestScope.account=='money'}">
                    <!-- Nạp tiền -->
                    <div class="col-sm-9 dis-play">
                        <div class="">
                            <h2>Nạp tiền vào tài khoản</h2>
                            <form action="AccountMoneyController" method="post">
                                <table>
                                    <tr>
                                        <td>Mệnh giá nạp tiền</td>
                                        <td><select id="card-money" name="money">
                                                <option value="20000">20.000đ</option>
                                                <option value="50000">50.000đ</option>
                                                <option value="100000">100.000đ</option>
                                                <option value="200000">200.000d</option>
                                                <option value="500000">500.000đ</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                    <input type="hidden" name="userId" value="${sessionScope.user.userId}"/>
                                    <td>Nhập mật khẩu để xác nhận</td>
                                    <td><input name="input-password" type="password"></td>
                                    </tr>
                                    <tr>
                                        <td>Nhập lại mật khẩu</td>
                                        <td><input name ="input-password-again" type="password"></td>
                                    </tr>
                                    <tr>
                                        <td><input class="submit-btn" type="Submit" value="Nạp tiền"></td>
                                        <td>${requestScope.mess}</td>
                                    </tr>

                                </table>
                            </form>
                        </div>
                    </div>
                </c:if>

            </div>
        </div>
    </div>
</body>

</html>
