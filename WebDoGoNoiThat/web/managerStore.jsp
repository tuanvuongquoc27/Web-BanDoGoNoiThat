<%-- 
   Document   : managerStore
   Created on : Mar 11, 2022, 11:50:28 PM
   Author     : Admin
--%>

<%@page import="model.Product"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="model.Order"%>
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
        <title>Quản lý admin</title>
        <link rel="shortcut icon" href="./image/main.png" type="image/x-icon"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/managerStore.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="fonts/fontawesome-free-6.0.0-web/css/all.css">
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    </head>

    <body>

        <div class="main">
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
            <!-- header -->
            <div class="header">
                <div class="grid"  style="height: 50px;">
                    <!-- header navbar -->
                    <nav class="header__navbar">
                        <ul class="header__navbar-list">
                            <c:if test="${user!=null}">
                                <li class="header__navbar-item"><a href="HomeServletController?page=1" class="header__navbar-item-link">Trang chủ</a></li>
                                <li class="header__navbar-item">Xin chào: ${user.userName}  </li>
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
                                        <a href="ManagerRequest?userId=${user.userId}" class="header__notify-footer-btn">Xem tất cả</a>
                                    </footer>
                                </div>
                            </li>
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
                        </ul>
                    </nav>
                </div>

            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-2">
                        <div class="product__list-item nav-item">
                            <div class="product__list-item">
                                <a href="InforUserController?infor=account" 
                                   class=" nav-link product__list-item--link">Thông tin tài khoản</a>

                            </div>
                        </div>
                        <div class="product__list-item nav-item">
                            <div class="product__list-item">
                                <a href="InforUserController?infor=seller" 
                                   class=" nav-link product__list-item--link">Thông tin người bán</a>

                            </div>
                        </div>
                        <div class="product__list-item nav-item">
                            <div class="product__list-item">
                                <a href="ManagerStoreServlet?infor=all&page=1" 
                                   class=" nav-link product__list-item--link">Thông tin cửa hàng</a>
                            </div>
                        </div>
                        <div class="product__list-item nav-item">
                            <div class="product__list-item">
                                <a href="InforUserController?infor=customer" 
                                   class=" nav-link product__list-item--link">Thông tin người mua</a>
                            </div>
                        </div>
                        <div class="product__list-item nav-item">
                            <div class="product__list-item">
                                <a href="ManagerRequest?store=request-infor&userId=${user.userId}" 
                                   class="nav-link product__list-item--link">Yêu cầu mở cửa hàng</a>

                            </div>
                        </div>
                        <div class="product__list-item nav-item">
                            <div class="product__list-item">
                                <a href="ManagerRequest?store=request-infor&userId=${user.userId}" 
                                   class="nav-link product__list-item--link">Yêu cầu khác</a>

                            </div>
                        </div>
                    </div>

                    <!-- thoong tin cuar hang-->
                    <div class="col-sm-10">
                        <!--information cuawr hang-->
                        <c:if test="${infor=='shop-information'}" >
                            <div class="store-infor">
                                <h1>Thông tin cửa hàng</h1>
                            </div>
                            <table>
                                <tr>
                                    <td>ID</td>
                                    <td>Tên của hàng</td>
                                    <td>Tên chủ shop</td>
                                    <td>Số lượng sản phẩm</td>
                                    <td>Doanh thu </td>
                                    <td>Lợi nhuận </td>
                                    <td>Hoa hồng</td>
                                    <td>Trạng thái</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <c:forEach items="${shoplist}" var="shoplist">
                                    <tr>
                                        <td><c:out value="${shoplist.getShopId()}"/></td>
                                        <td><a href="ShopServletController?mess=manaher&page=1&shopid=${shoplist.getShopId()}" class="nav-link store-manager"><c:out value="${shoplist.getShopName()}"/></a></td>
                                            <c:forEach items="${sellerlist}" var="sllist">
                                                <c:if test="${shoplist.getShopId()==sllist.getId()}">
                                                <td><c:out value="${sllist.getName()}"/></td>   
                                            </c:if>
                                        </c:forEach>    
                                        <td><c:out value="${shoplist.getShopProductQuantity()}"/></td>
                                        <td><fmt:formatNumber type="number" pattern="###,###,###đ" value="${shoplist.getShopRevenue()}" /></td>
                                        <td><fmt:formatNumber type="number" pattern="###,###,###đ" value="${shoplist.getShopProfit()}" /></td>
                                        <c:set var="i" value="${shoplist.getShopProfit()}"/>
                                        <td><fmt:formatNumber type="number" pattern="###,###,###đ" value="${i*0.2}" /></td>
                                        <c:if test="${shoplist.isShopActive()}" >
                                            <td>Hoạt động</td>
                                        </c:if>
                                        <c:if test="${!shoplist.isShopActive()}" >
                                            <td>Chưa cấp phép</td>
                                        </c:if>
                                        <td><a onclick="if (!confirm('Bạn có muốn xóa cửa hàng này')) {
                                                    return false;
                                                }" href="ManagerStoreServlet?infor=delete&shopId=${shoplist.getShopId()}&page=1" class="nav-link">Xóa cửa hàng</a>
                                        </td>
                                        <td><a href="UpdateInforAccount?up=update-shop&id=${shoplist.getShopId()}"> Sửa</a></td>

                                    </tr>
                                </c:forEach>
                            </table>
                            <!--                            <div class="add__store">
                                                            <a href="#" class="nav-link add__store-link">Thêm cửa hàng</a>
                                                        </div>-->
                        </c:if>

                        <!--thay doi thong tin shop-->
                        <c:if test="${infor=='shop-update'}">
                            <h1>Cập nhật thông tin cửa hàng</h1>
                            <form action="UpdateInforShop" method="post">
                                <input type="hidden" value="manager" name="place"/>
                                <input type="hidden" value="${shop.getShopId()}" name="input-shopId"/>
                                <table>
                                    <tr>
                                        <td>ID</td>
                                        <td><input disabled="true" type="text" value="${shop.getShopId()}"></td>
                                    </tr>
                                    <tr>
                                        <td>Tên cửa hàng</td>
                                        <td><input name="input-name" type="text" value="${shop.getShopName()}"></td>
                                    </tr>
                                    <tr>
                                        <td>Địa chỉ</td>
                                        <td><input name="input-address" type="text" value="${shop.getShopAddress()}"></td>
                                    </tr>
                                    <tr>
                                        <td>Số điện thoại</td>
                                        <td><input name="input-phone" type="text" value="${shop.getShopPhone()}"></td>
                                    </tr>
                                    <tr>
                                        <td>Email </td>
                                        <td><input name="input-email" type="email" value="${shop.getShopEmail()}"></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td> <input type="submit" class="submit-btn" value="Cập nhật"></td>
                                    </tr>
                                </table>
                            </form>
                        </c:if>

                        <!--thong tin tai khoan-->
                        <c:if test="${infor=='account'}" >
                            <div class="store-infor">
                                <h1>Thông tin tài khoản </h1>

                            </div>
                            <table>
                                <tr>
                                    <td>ID</td>
                                    <td>Tên tài khoản</td>
                                    <td>Số dư</td>
                                    <td>Quản trị</td>
                                    <td>Người bán</td>
                                    <td>Khách hàng</td>
                                    <td>Trạng thái</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <c:forEach begin="0" items="${account}" var="acc">
                                    <tr><td>${acc.getUserId()}</td>
                                        <td>${acc.getUserName()}</td>
                                        <td>${acc.getUserBanlance()}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${acc.isAdmin()}">
                                                    <input type="checkbox" checked="true" disabled="true">
                                                </c:when>
                                                <c:when test="${!acc.isAdmin()}">
                                                    <input type="checkbox"  disabled="true">
                                                </c:when>
                                            </c:choose>  
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${acc.isSeller()}">
                                                    <input type="checkbox" checked="true"  disabled="true">
                                                </c:when>
                                                <c:when test="${!acc.isSeller()}">
                                                    <input type="checkbox"  disabled="true">
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${acc.isCustomer()}">
                                                    <input type="checkbox" checked="true"  disabled="true">
                                                </c:when>    
                                                <c:when test="${!acc.isCustomer()}">
                                                    <input type="checkbox"  disabled="true">
                                                </c:when> 
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${!acc.isActive()}">
                                                    Đã khóa
                                                </c:when>    
                                                <c:when test="${acc.isActive()}">
                                                    Hoạt động
                                                </c:when> 
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${!acc.isActive()}">
                                                    <a onclick="if (!confirm('Bạn có muốn mở khóa tài khoản ' + '${acc.getUserName()}')) {
                                                                return false;
                                                            }" href="UpdateInforAccount?up=unlock&id=${acc.getUserId()}" class="nav-link">Mở khóa</a>
                                                </c:when>    
                                                <c:when test="${acc.isActive()}">
                                                    <a onclick="if (!confirm('Bạn có muốn khóa tài khoản ' + '${acc.getUserName()}')) {
                                                                return false;
                                                            }" href="UpdateInforAccount?up=lock&id=${acc.getUserId()}" class="nav-link">Khóa</a>
                                                </c:when> 
                                            </c:choose>
                                        </td>
                                        <td><a onclick="if (!confirm('Bạn có muốn xóa tài khoản ' + '${acc.getUserName()}')) {
                                                    return false;
                                                }" href="UpdateInforAccount?up=deleteaccount&id=${acc.getUserId()}" class="nav-link" >Xóa</a></td>

                                    </tr>
                                </c:forEach>
                            </table>
                            <h2> <a type="button" class="btn btn-secondary" href="InforUserController?infor=signupaccount">Thêm tài khoản</a>  </h2> 
                        </c:if>

                        <!--infor seller + customer-->
                        <c:if test="${infor=='infor-seller-customer'}" >
                            <div class="store-infor">
                                <c:if test="${ship=='yes'}"><h1>Thông tin người mua </h1></c:if>
                                <c:if test="${ship=='no'}"><h1>Thông tin người bán </h1></c:if>
                                </div>
                                <table>
                                    <tr>
                                        <td>ID</td>
                                        <td>Họ và tên </td>
                                        <td>Địa chỉ </td>
                                    <c:if test="${ship=='yes'}"><td>Địa chỉ ship</td></c:if>
                                        <td>Email</td>
                                        <td>Phone</td>
                                        <td>Ngày tham gia</td>
                                        <td>Giới tính</td>
                                        <td>Ngày sinh nhật</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                <c:forEach begin="0" items="${list}" var="acc">
                                    <tr><td>${acc.getId()}</td>
                                        <td>${acc.getName()}</td>
                                        <td><c:choose>  
                                                <c:when test="${acc.getAddress()==null}"> Chưa cập nhật </c:when> 
                                                <c:otherwise>${acc.getAddress()}</c:otherwise>  
                                            </c:choose></td>
                                            <c:if test="${ship=='yes'}">
                                            <td><c:choose>  
                                                    <c:when test="${acc.getAddress()==null}">Chưa cập nhật </c:when> 
                                                    <c:otherwise>${acc.getAddressShip()}</c:otherwise>  
                                                </c:choose></td>
                                            </c:if>
                                        <td>${acc.getEmail()}</td>
                                        <td><c:choose>  
                                                <c:when test="${acc.getAddress()==null}">Chưa cập nhật</c:when>
                                                <c:otherwise>${acc.getPhone()}</c:otherwise>  
                                            </c:choose></td> 
                                        <td>${acc.getDate()}</td>
                                        <td><c:choose>  
                                                <c:when test="${acc.getAddress()==null}">Chưa cập nhật
                                                </c:when> <c:otherwise>  
                                                    <c:if test="${acc.isGender()==true}">Nam</c:if>
                                                    <c:if test="${acc.isGender()==false}">Nữ</c:if>
                                                </c:otherwise></c:choose>  
                                            </td>
                                            <td>
                                            <c:choose>  
                                                <c:when test="${acc.getAddress()==null}">Chưa cập nhật</c:when>
                                                <c:otherwise> ${acc.getDOB()}</c:otherwise>  
                                            </c:choose>
                                        </td>
                                        <c:if test="${acc.isActive()}">
                                            <c:if test="${ship=='no'}">
                                                <td><a href="UpdateInforAccount?up=deleteseller&id=${acc.getId()}" class="nav-link" >Xóa</a></td>
                                            </c:if>
                                            <c:if test="${ship=='yes'}">
                                                <td><a href="UpdateInforAccount?up=deletecustomer&id=${acc.getId()}" class="nav-link" >Xóa</a></td>
                                            </c:if>

                                            <td><a href="UpdateInforAccount?up=change&id=${acc.getId()}" class="nav-link" >Sửa</a></td>
                                        </c:if>
                                        <c:if test="${!acc.isActive()}">
                                            <td>Xóa</td>

                                            <td>Sửa</td>
                                        </c:if>

                                    </tr>
                                </c:forEach>
                            </table>
                        </c:if>

                        <!--Thay doi thong customer seller-->
                        <c:if test="${infor=='change'}" >
                            <div class="store-infor">
                                <c:if test="${us.isCustomer()&&!us.isSeller()}">
                                    <h1>Thay đổi thông tin người mua</h1>
                                </c:if>
                                <c:if test="${us.isCustomer()&&us.isSeller()}">
                                    <h1>Thay đổi thông tin người bán</h1>
                                </c:if>    
                            </div>
                            <form action="UpdateInforAccount" method="post">
                                <table>
                                    <input type="hidden" name="userId" value="${us.getUserId()}"/>
                                    <tr>
                                        <c:if test="${us.isCustomer()&&!us.isSeller()}">
                                        <input type="hidden" name="role" value="customer"/>
                                    </c:if>
                                    <c:if test="${us.isCustomer()&&us.isSeller()&&!us.isAdmin()}">
                                        <input type="hidden" name="role" value="seller"/>
                                    </c:if>
                                    <c:if test="${us.isCustomer()&&us.isSeller()&&us.isAdmin()}">
                                        <input type="hidden" name="role" value="admin"/>
                                    </c:if>    

                                    <td>Tên Đăng nhập</td>
                                    <td>${us.getUserName()}</td>
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
                                    <c:if test="${(us.isCustomer()&&!us.isSeller())||us.isAdmin()}">
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
                        </c:if>
                        <c:if test="${infor=='signup'}">
                            <form action="SignUpServlet" method="post">
                                <input type="hidden" value="admin" name="input-admin"/>
                            <input type="text" placeholder="Tên đăng nhập" name="input-username" class="input-infor-acc" required/><br>
                            <input type="password" placeholder="Mật khẩu" name="input-password" class="input-infor-acc" required/><br>
                            <input type="password" placeholder="Nhập lại mật khẩu" name="input-password-2" class="input-infor-acc" required/><br>
                            <input type="email" placeholder="Nhập email" name="input-email" class="input-infor-acc" required/>
                            <input type="submit" value="Đăng kí" class="btn"><br> 
                            </form>
                        </c:if>
                        <c:if test="${infor=='bill'}">
                            <table>
                                <tr>
                                    <td>Id</td>
                                    <td>Khach hang</td>
                                    <td>Tong tien</td>
                                    <td>Ngay mua</td>
                                    <td>Ngay Ship</td>
                                    <td>Trang thai</td>
                                    
                                </tr>
                            </table>
                        </c:if>

                        <!--request-->
                        <c:if test="${infor=='request'}">

                            <c:if test="${requestlist.size()==0}">
                                <h3>Không có thông báo mới</h3>
                            </c:if>
                            <c:if test="${requestlist.size()!=0}">
                                <div class="store-infor">
                                    <h1>Thông tin yêu cầu</h1>
                                </div>

                                <table>
                                    <tr>
                                        <td>Id</td>
                                        <td>Người yêu cầu</td>
                                        <td>Nội dung yêu cầu</td>
                                        <td>Số dư tài khoản</td>
                                        <td>Trả lời</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <c:forEach items="${requestlist}" var="list">
                                        <tr>
                                            <td>${list.getCustomerId()}</td>
                                            <td>
                                                <c:forEach items="${customerlist}" var="cuslist">
                                                    <c:if test="${list.getCustomerId()==cuslist.getId()}">
                                                        ${cuslist.getName()}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>${list.getRequestSeller()}</td>
                                            <td><c:forEach items="${requestScope.userlist}" var="userlist">
                                                    <c:if test="${list.getCustomerId()==userlist.getUserId()}">
                                                        ${userlist.getUserBanlance()}
                                                    </c:if>
                                                </c:forEach>
                                            </td> 
                                            <td>${list.getReponse()}</td>

                                            <c:forEach begin="1" items="${se}" var="listse">


                                                <c:if test="${listse.isSeller()&&(listse.getUserId()==list.getShopId())}">
                                                    <td>Xóa yêu cầu</td>
                                                    <td>Chấp nhận</td>
                                                </c:if>
                                                <c:if test="${!listse.isSeller()&&(listse.getUserId()==list.getShopId())}">
                                                    <td><a  onclick="if (!confirm('Bạn có muốn xóa cửa hàng này')) {
                                                                return false;
                                                            }" 
                                                            href="ManagerRequest?rquest=delete&userId=${list.getCustomerId()}" class="nav-link">Xóa yêu cầu</a></td>
                                                    <td><a onclick="if (!confirm('Bạn có muốn chấp nhận yêu cầu này')) {
                                                                return false;
                                                            }" 
                                                           href="ManagerRequest?rquest=accept&userId=${list.getCustomerId()}" class="nav-link">Chấp nhận</a></td>
                                                    </c:if>  
                                                </c:forEach>

                                        </tr>
                                    </c:forEach>


                                </table>
                            </c:if>

                        </c:if>

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
                    </div>
                </div>



            </div>

        </div>

    </body>

</html>
