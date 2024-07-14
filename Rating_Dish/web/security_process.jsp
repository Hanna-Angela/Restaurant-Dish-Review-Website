<%-- 
    Document   : security_process
    Created on : Nov 14, 2023, 6:43:32 PM
    Author     : cocxd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, user_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Security Processing</title>
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
        <jsp:useBean id="A" class ="user_management.account" scope = "session"/>
        <% //receives from the create_account html
            String v_password = request.getParameter("password");
            String v_verify = request.getParameter("verify");
            String v_email = request.getParameter("email");
         
            A.password = v_password;
            A.verify_password = v_verify;
            A.email = v_email;
            
            int status = A.getEmail();
            int status1 = A.password_verification();
            int status2 = A.isEight();
           
            
            if(status == 1)//check if email is already taken
            {
                
        %>    
             <h1> Email has been registered! </h1>
            <form action="account_security.html" method="post">
                <button type="submit">NEXT</button>
            </form>
         <%
            }      
            else
            { 
                if(status1 == 0)// if 0 then password is mismatched
                { 
         %> 
           <h1>Password Mismatch, Please type again!</h1>
            <form action="account_security.html" method="post">
                <button type="submit">BACK</button>
            </form>
         <%
                }
                else
                {
                    if(status2 == 1)// if 1, password is less than eight characters
                    {
         %>
                     <h1>Password is less than eight characters!</h1>
                    <form action="account_security.html" method="post">
                        <button type="submit">BACK</button>
                    </form>
         <%            
                    }
                    else
                    {
                     A.account_assignment();
         %>          
                    <h1>Account Created, Proceed to the next step!</h1>
                    <form action="profile_setup.html" method="post">
                        <button type="submit">NEXT</button>
                    </form>
         <%           
                    }    
                }
          }     
         %>
         
    </body>
</html>
