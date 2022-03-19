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
                            <div class="dropdown product__list-item">
                                <div  data-bs-toggle="dropdown"
                                      class="dropdown-toggle nav-link product__list-item--link">Thông tin cửa hàng</div>
                                <ul class="dropdown-menu product__list-child">
                                    <li class="dropdown-item product__list-item--child "><a href="ManagerStoreServlet?infor=all&page=1"
                                                                                            class="product__list-item-link--child nav-link">Tất cả</a></li>


                                </ul>
                            </div>
                        </div>
                        <div class="product__list-item nav-item">
                            <div class="product__list-item">
                                <a href="InforUserController?infor=seller" class=" nav-link product__list-item--link">Thông tin chủ cửa hàng</a>

                            </div>
                        </div>
                        <div class="product__list-item nav-item">
                            <div class="product__list-item">
                                <a href="InforUserController?infor=customer" 
                                   class=" nav-link product__list-item--link">Thông tin khách hàng</a>
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
                        <c:if test="${store=='information'}" >
                            <div class="store-infor">
                                <h1>Thông tin cửa hàng</h1>
                            </div>
                            <table>
                                <tr>
                                    <td>ID</td>
                                    <td>Tên của hàng</td>
                                    <td>Tên chủ shop</td>
                                    <td>Số lượng sản phẩm</td>
                                    <td>Doanh thu của cửa hàng</td>
                                    <td>Lợi nhuận của cửa hàng</td>
                                    <td>Lợi nhuận từ cửa hàng</td>
                                    <td>Trạng thái</td>
                                    <td></td>
                                </tr>
                                <c:forEach items="${shoplist}" var="shoplist">
                                    <tr>
                                        <td><c:out value="${shoplist.getShopId()}"/></td>
                                        <td><a href="ManagerStore?infor=shop&shopId=${shoplist.getShopId()}" class="nav-link store-manager"><c:out value="${shoplist.getShopName()}"/></a></td>
                                            <c:forEach items="${sellerlist}" var="sllist">
                                                <c:if test="${shoplist.getShopId()==sllist.getId()}">
                                                <td><c:out value="${sllist.getName()}"/></td>
                                            </c:if>
                                        </c:forEach>    
                                        <td><c:out value="${shoplist.getShopProductQuantity()}"/></td>
                                        <td><c:out value="${shoplist.getShopRevenue()}"/></td>
                                        <td><c:out value="${shoplist.getShopProfit()}"/></td>
                                        <td><c:out value="${shoplist.getShopProfit()}"/></td>
                                        <c:if test="${shoplist.isShopActive()}" >
                                            <td>Hoạt động</td>
                                        </c:if>
                                        <c:if test="${!shoplist.isShopActive()}" >
                                            <td>Chưa cấp phép</td>
                                        </c:if>
                                        <td><a onclick="if (!confirm('Bạn có muốn xóa cửa hàng này')) {
                                                    return false;
                                                }" href="ManagerStoreServlet?infor=delete&shopId=${shoplist.getShopId()}" class="nav-link">Xóa cửa hàng</a></td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <!--                            <div class="add__store">
                                                            <a href="#" class="nav-link add__store-link">Thêm cửa hàng</a>
                                                        </div>-->
                        </c:if>

                        <!--inforseller-->

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
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:if>

                        <!--request-->
                        <c:if test="${requestScope.store=='request'}">

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
