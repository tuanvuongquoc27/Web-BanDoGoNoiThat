<%-- 
    Document   : SignUp
    Created on : Feb 28, 2022, 1:04:28 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng kí</title>
        <link rel="stylesheet" href="css/Login.css">
    </head>
    <body>
        <div class="container">
            <div class="section">
                <header>Đăng kí</header>
                <form action="SignUpServlet" method="post">
                    <input type="text" placeholder="Tên đăng nhập" name="input-username" class="input-infor-acc" required><br>
                    <input type="password" placeholder="Mật khẩu" name="input-password" class="input-infor-acc" required><br>
                    <input type="password" placeholder="Nhập lại mật khẩu" name="input-password-2" class="input-infor-acc" required><br>
                    <input type="email" placeholder="Nhập email" name="input-email" class="input-infor-acc">
                    <input type="submit" value="Đăng kí" class="btn"><br>
                </form>
                <a href="Login.jsp">Trở lại</a>
                <h3 class="message">${requestScope.error}</h3>
            </div>
        </div>





        
    </body>
</html>
