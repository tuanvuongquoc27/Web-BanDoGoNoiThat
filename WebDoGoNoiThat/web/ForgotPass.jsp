<%-- 
    Document   : ForgotPass
    Created on : Feb 28, 2022, 1:04:40 AM
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
   <div class="container">
            <div class="section">
                <header>Reset Password</header>
                <form action="ForgotPassServlet" method="post">
                    <input type="text" placeholder="Enter username" name="input-username" class="input-infor-acc" required><br>
                    <input type="password" placeholder="Enter email" name="input-password" class="input-infor-acc" required><br>
                    <input type="submit" value="Reset" class="btn"><br>
                </form>
                <a href="Login.jsp">Back</a>
            </div>
        </div>
</html>
