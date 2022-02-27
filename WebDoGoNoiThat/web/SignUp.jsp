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
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/Login.css">
    </head>
    <body>
        <div class="container">
            <div class="section">
                <header>Sign Up</header>
                <form action="SignUpServlet" method="post">
                    <input type="text" placeholder="Enter username" name="input-username" class="input-infor-acc" required><br>
                    <input type="password" placeholder="Enter password" name="input-password" class="input-infor-acc" required><br>
                    <input type="password" placeholder="Enter Password again" name="input-password-2" class="input-infor-acc" required><br>
                    <input type="email" placeholder="Enter email" name="input-email" class="input-infor-acc">
                    <input type="submit" value="Sign Up" class="btn"><br>
                </form>
                <a href="Login.jsp">Back</a>
            </div>
        </div>





        
    </body>
</html>
