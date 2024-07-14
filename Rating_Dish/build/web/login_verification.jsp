<%-- 
    Document   : login_verification
    Created on : 11 15, 23, 12:20:41 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, user_management.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Verification</title>
    <style>
        body 
        {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 20px;
        }

        h1 
        {
            color: #333;
        }

        button 
        {
            background-color: #5dd55d;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover 
        {
            background-color: #2aa22a;
        }
    </style>
</head>
<body>
    <jsp:useBean id="S" class="user_management.account" scope="session"/>
    
    <% // Receives from the login.html
        String v_password = request.getParameter("password");
        String v_email = request.getParameter("email");

        S.password = v_password;
        S.email = v_email;

        int status = S.login_credentials();

        if (status == 1) 
        {
            S.getUsername();
            HttpSession ses = request.getSession();
            ses.setAttribute("loggedInUser", S.username);  
            S.set_logDate();
    %> 
            <h1>Successfully Logged In!</h1>
            <form action="mainpage.jsp" method="post">
                <button type="submit">Next</button>
            </form>
    <%
        } 
        else 
        {
    %>
            <h1>Email or Password Mismatch</h1>
            <form action="login.html" method="post">
                <button type="submit">Back</button>
            </form>
    <%
        }
    %>
</body>
</html>