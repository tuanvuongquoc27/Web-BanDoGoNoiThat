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
        <link rel="shortcut icon" href="./image/main.png" type="image/x-icon">
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
                                <li class="header__navbar-item"><a href="HomeServletController?userId=${user.userId}" class="header__navbar-item-link">Trang chủ</a></li>
                                <li class="header__navbar-item">Xin chào: ${user.userName}  </li>
                                </c:if>
                                <c:if test="${user.isCustomer()&&!user.isAdmin()}">
                                <li class="header__navbar-item"><a class="header__navbar-item-link" href="Seller.jsp?userId=${user.userId}">Đăng kí bán hàng</a></li>
                                </c:if>
                        </ul>
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item-has-notify ">
                                <a href="" class="header__navbar-item-link"><i class="fa-solid fa-bell bell-icon"></i>Thông báo</a>
                                <!-- Notification -->
                                <div class="header__notify">
                                    <header class="header__notify-header"><h3>Thông báo mới</h3>
                                    </header>
                                    <ul class="header__notify-list">
                                        <c:if test="${requestlist.size()==0}">
                                            <li class="header__notify-item header__notify-item--viewed"> <h3>Không có thông báo mới</h3></li>
                                            </c:if>
                                            <c:if test="${requestlist.size()!=0}">
                                                <c:forEach items="${requestlist}" var="list">
                                                    <li class="header__notify-item header__notify-item--viewed">
                                                    <a href="ManagerRequest?store=request-infor&userId=${user.userId}" class="header__notify-link">
                                                        <img src="image/login-img.jpg" alt="" class="header__notify-img">
                                                        <div class="header__notify-infor">
                                                            <span class="header__notify-name">Yêu cầu trở thành nhà bán hàng</span>
                                                            <c:forEach items="${customerlist}" var="cuslist">
                                                                <c:if test="${list.getCustomerId()==cuslist.getId()}">
                                                                    <span class="header__notify-description">Người yêu cầu: ${cuslist.getName()}</span>
                                                                    <c:if test="${!list.isRequestState()}">
                                                                        <h6>Chưa chấp nhận</h6>
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
                        <c:if test="${user.userImg==null}">
                            <img class="account-img"
                             src="https://mpng.subpng.com/20180411/rzw/kisspng-user-profile-computer-icons-user-interface-mystique-5aceb0245aa097.2885333015234949483712.jpg"
                             alt="">
                        </c:if>
                        <c:if test="${user.userImg!=null}">
                            <img class="account-img"
                             src="${user.userImg}"
                             alt="">
                        </c:if>
                        
                        <div>
                            <span class="account-name">${user.userName}</span>
                            <span class="account-money">Số dư tài khoản:<fmt:formatNumber type="number" pattern="###,###,###đ" value="${user.userBanlance}" /></span>
                        </div>

                    </div>
                    <div class="account">
                        <a href="AccountFileController?role=${role}&userId=${user.userId}" class="account-file">Thông tin tài khoản</a>
                    </div>
                    <div class="account">
                        <a href="AccountFileUpdate?role=${role}&userId=${user.userId}" class="account-file">Thay đổi thông tin</a>
                    </div>
                    <div class="account">
                        <a href="AccountHistoryController?userId=${user.userId}" class="account-history">Lịch sử mua hàng</a>
                    </div>
                    <div class="account">
                        <a href="AccountPasswordController?userId=${user.userId}" class="account-change-pass">Thay đổi mật khẩu</a>
                    </div>
                    <div class="account">
                        <a href="AccountMoneyController?userId=${user.userId}" class="account-get-money">Nạp tiền</a>
                    </div>

                </div>

                <!--  thông tin -->
                <c:if test="${account=='file'}">
                    <div class="col-sm-9 ">
                        <h2>Hồ sơ của tôi </h2>
                        <table>
                            <tr><td>Tên Đăng nhập</td>
                                <td>${user.userName}</td></tr>
                            <tr><td>Họ và Tên </td>
                                <td><c:choose>  
                                        <c:when test="${acc.getAddress()==null}">Chưa cập nhậta</c:when>
                                        <c:otherwise>${acc.getName()}</c:otherwise>  
                                    </c:choose></td>
                            </tr>
                            <tr><td>Email</td>
                                <td>${acc.getEmail()}
                                </td>
                            </tr>
                            <tr><td>Địa chỉ</td>
                                <td><c:choose>  
                                        <c:when test="${acc.getAddress()==null}">Chưa cập nhật</c:when> 
                                        
                                        <c:otherwise>${acc.getAddress()}</c:otherwise>  
                                    </c:choose></td>
                            </tr>
                            <c:if test="${user.isCustomer()||user.isAdmin()}">
                                <tr><td>Địa chỉ ship</td>
                                <td><c:choose>  
                                        <c:when test="${acc.getAddressShip()==null}">Chưa cập nhật</c:when> 
                                        <c:otherwise>${acc.getAddressShip()}</c:otherwise>  
                                    </c:choose></td>
                                </tr>
                            </c:if>
                            
                            <tr><td>Số điện thoại</td>
                                <td><c:choose>  
                                        <c:when test="${acc.getAddress()==null}">Chưa cập nhật</c:when>
                                        <c:otherwise>${acc.getPhone()}</c:otherwise>  
                                    </c:choose></td>
                            </tr>
                            <tr><td>Giới tính</td>
                                <td><c:choose>  
                                        <c:when test="${acc.getAddress()==null}">Chưa cập nhật</c:when>
                                        <c:otherwise>
                                            <c:if test="${acc.isGender()}">Nam</c:if>
                                            <c:if test="${!acc.isGender()}">Nữ</c:if>
                                        </c:otherwise>  
                                    </c:choose></td>
                            </tr>
                            <tr><td>Ngày sinh</td>
                                <td><c:choose>  
                                        <c:when test="${acc.getAddress()==null}">Chưa cập nhật</c:when> 
                                        <c:otherwise>${acc.getDOB()}</c:otherwise>  
                                    </c:choose></td>
                            </tr>

                            <tr><td></td>
                                <td><a href="AccountFileUpdate?role=${role}&userId=${user.userId}" type="button" class="btn btn-secondary btn-lg">Cập nhật</a></td>
                            </tr>
                        </table>
                    </div> 
                </c:if>

                <!--cập nhật thong tin-->
                <c:if test="${account=='update'}">


                    <div class="col-sm-9 dis-play">
                        <h2>Hồ sơ của tôi </h2>
                        <form action="AccountFileUpdate" method="post">
                            <table>
                                <input type="hidden" name="userId" value="${user.userId}"/>
                                <tr>
                                <input type="hidden" name="role" value="${role}"/>
                                <td>Tên Đăng nhập</td>
                                <td>${user.userName}</td>
                                </tr>
                                <tr>
                                    <td>Họ và Tên </td>
                                    <td><input placeholder="${acc.getName()}" name="input-name"type="text" required="true"></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><input placeholder="${acc.getEmail()}" name="input-email" type="email" required="true"></td>
                                </tr>
                                <tr>
                                    <td>Địa chỉ</td>
                                    <td><input placeholder="${acc.getAddress()}" name="input-address" type="text" required="true"></td>
                                </tr>
                                <c:if test="${user.isCustomer()||user.isAdmin()}">
                                <tr><td>Địa chỉ ship</td>
                                <td>
                                    <input placeholder="${acc.getAddressShip()}" name="input-address-ship" type="text" required="true">
                                </td>
                                </tr>
                                </c:if>
                                <tr>
                                    <td>Ảnh đại diện</td>
                                    <td><input placeholder="${user.userImg}" name="input-img" type="text" required="true"></td>
                                </tr>
                                <tr>
                                    <td>Số điện thoại</td>
                                    <td><input placeholder="${acc.getPhone()}" name="input-phone" type="text" required="true"></td>
                                </tr>
                                <tr>
                                    <td>Giới tính</td>
                                    <td><input required="true" name="input-gender" value="nam" type="radio"> Nam <input value="nu" name="input-gender" type="radio" /> Nữ </td>
                                </tr>
                                <tr>
                                    <td>Ngày sinh</td>
                                    <td><input value="${acc.getDOB()}" name="input-DOB" type="date" required="true"></td>
                                </tr>


                                <tr>
                                    <td></td>
                                    <td><input class="submit-btn" type="submit" value="Lưu"></td>
                                </tr>
                            </table>
                        </form>

                    </div> 
                </c:if>

                <!--cập nhật mật khẩu-->
                <c:if test="${account=='password'}">
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
                                    <input type="hidden" name="userId" value="${user.userId}"/>
                                    <td>Mật khẩu mới</td>
                                    <td><input name="new-pass" type="password"></td>
                                    </tr>
                                    <tr>
                                        <td>Nhập lại mật khẩu</td>
                                        <td><input name="new-pass-again" type="password"></td>
                                    </tr>
                                    <tr>
                                        <td><input class="submit-btn" type="Submit" value="Thay đổi"></td>
                                        <td>${mess}</td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div> 
                </c:if>

                <!--nạp tiền-->
                <c:if test="${account=='money'}">
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
                                                <option value="50000000">50.000.000đ</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                    <input type="hidden" name="userId" value="${user.userId}"/>
                                    <td>Nhập mật khẩu để xác nhận</td>
                                    <td><input name="input-password" type="password"></td>
                                    </tr>
                                    <tr>
                                        <td>Nhập lại mật khẩu</td>
                                        <td><input name ="input-password-again" type="password"></td>
                                    </tr>
                                    <tr>
                                        <td><input class="submit-btn" type="Submit" value="Nạp tiền"></td>
                                        <td>${mess}</td>
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
