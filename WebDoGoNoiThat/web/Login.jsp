<%-- 
    Document   : Login.jsp
    Created on : Feb 28, 2022, 1:04:14 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <link rel="stylesheet" href="css/Login.css">
    </head>
    <body>
        <div class="container">
            <div class="section">
                <header>Đăng nhập</header>
                <form action="LoginServlet" method="post">
                    <input type="text" placeholder="Tên đăng nhập" name="input-username" class="input-infor-acc" required><br>
                    <input type="password" placeholder="Mật khảu" name="input-password" class="input-infor-acc" required><br>
                    <input type="submit" value="Đăng nhập" class="btn btn-login"><br>
                    <a class="back_home" href="Home.html">Trở lại</a>
                    <div style="clear: both;"></div>
                </form>
                
                <a href="SignUp.jsp">Đăng kí</a><br>
                <a href="ForgotPass.jsp">Quên mật khẩu</a><br>
                <h3 class="message">${requestScope.success}</h3>
            </div>
        </div>
           
    </body>
</html>
