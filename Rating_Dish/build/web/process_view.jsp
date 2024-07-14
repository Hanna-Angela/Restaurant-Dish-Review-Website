<%-- 
    Document   : process_view
    Created on : 11 21, 23, 8:59:09 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, user_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>process_view</title>
            <style>
            body 
            {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                text-align: center;
                margin: 50px;
            }

            p 
            {
                color: #333;
                background-color: #5dd55d;
                padding: 10px;
                margin: 5px;
                border-radius: 5px;
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
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            button:hover 
            {
                background-color: #2aa22a;
            }
        </style>
    </head>
    <body>
         <jsp:useBean id="P" class ="user_management.profile" scope = "session"/>
               <form action="view_user.html" method="post">
            <button type="submit">Back</button>
               </form>
        <% //receives from the create_account html
            String v_gender = request.getParameter("gender");
            
            P.gender = v_gender;
            
            List<String> userName = P.get_username();
               if (!userName.isEmpty()) 
               {
                for (String userNames : userName)
                {
        %>
                    <p>User: <%= userNames %></p>
        <%
                }
               } 
               else 
               {
        %>
                <p>No users found with the specified gender.</p>
        <%
               }
        %> 

    </body>
</html>