<%-- 
    Document   : creation_porcessing
    Created on : Nov 14, 2023, 11:55:48 AM
    Author     : cocxd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, user_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCOUNT PROCESSING</title>
        <style>
        body 
        {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 50px;
        }

        h1 
        {
            color: #333;
        }

        button 
        {
            background-color: #5dd55d;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover 
        {
            background-color: #2aa22a;
        }
    </style>
    </head>
    <body>
        <jsp:useBean id="U" class ="user_management.user" scope = "session"/>
        <% //receives from the create_account html
            String v_firstname = request.getParameter("firstname");
            String v_last_name = request.getParameter("last_name");
            String v_middle_initial = request.getParameter("middle_initial");
            String v_birthdate = request.getParameter("birthday");
            String v_gender = request.getParameter("gender");
            
            U.first_name = v_firstname;
            U.last_name = v_last_name;
            U.middle_initial = v_middle_initial;
            U.birthdate = v_birthdate;
            U.gender = v_gender;
            
            int status = U.register_user();
            
            if(status == 1)
            { 
         %>  
            <h1>INFORMATION SAVED!</h1>
            <form action="account_security.html" method="post">
                <button type="submit">Next Step</button>
            </form>
         <% } 
            else 
            {
         %> 
            <h1>CREATION ACCOUNT FAILED!</h1>
        <%
            }
        %>    
    </body>
</html>
