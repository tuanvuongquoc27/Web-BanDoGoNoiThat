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
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/Login.css">
    </head>
    <body>
        <div class="container">
            <div class="section">
                <header>Login</header>
                <form action="LoginServlet" method="post">
                    <input type="text" placeholder="Enter username" name="input-username" class="input-infor-acc" required><br>
                    <input type="password" placeholder="Enter password" name="input-password" class="input-infor-acc" required><br>
                    <input type="submit" value="Login" class="btn btn-login"><br>
                    <a class="back_home" href="Home.html">Back</a>
                    <div style="clear: both;"></div>
                </form>
                
                <a href="SignUp.jsp">Sign Up</a><br>
                <a href="ForgotPass.jsp">Forgot Password</a><br>
            </div>
        </div>
           
    </body>
</html>
