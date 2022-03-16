<%-- 
    Document   : ForgotPass
    Created on : Feb 28, 2022, 1:04:40 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quên mật khẩu</title>
        <link rel="shortcut icon" href="./image/main.png" type="image/x-icon">
        <link rel="stylesheet" href="css/Login.css">
    </head>
   <div class="container">
            <div class="section">
                <header>Tạo mật khẩu mới</header>
                <form action="ForgotPassServlet" method="post">
                    <c:if test="${requestScope.message==null}">
                        <input type="text" placeholder="Tên đăng nhập" name="input-username" class="input-infor-acc" required><br>
                        <input type="text" placeholder="Email" name="input-email" class="input-infor-acc" required><br>
                    </c:if>
                    <c:if test="${requestScope.message!=null}">
                        <input type="text" name="input-username" class="input-infor-acc" value="${requestScope.username}" ><br>
                        <input type="password" placeholder="Nhập mật khẩu mới" name="input-password" class="input-infor-acc" required><br>
                        <input type="password" placeholder="Nhập lại mật khẩu" name="input-password-again" class="input-infor-acc" required><br>
                    </c:if>
                    
                    
                    <input type="submit" value="Tạo mới" class="btn"><br>
                </form>
                <a href="Login.jsp">Trở lại</a>
                <h3 class="message">${requestScope.error}</h3>
            </div>
        </div>
</html>
