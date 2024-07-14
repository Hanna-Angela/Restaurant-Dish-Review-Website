<%-- 
    Document   : mobile_process
    Created on : 11 20, 23, 8:51:16 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, user_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>mobile_number</title>
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
             <jsp:useBean id="P" class ="user_management.profile" scope = "session"/>  
             
              <% //receives from the create_account html
            HttpSession ses = request.getSession();
            String loggedInUser = (String) ses.getAttribute("loggedInUser");
             
            String v_new_name = request.getParameter("new_name");
                    
            P.username = v_new_name;
          
            
            int status1 = P.isUsernameTaken();
            
            if(status1 == 1)
            {
            %>
              <h1>Username has been taken.</h1>
            <form action="edit_username.html" method="post">
                <button type="submit">BACK!</button>
            </form>
            <%
                
             }
             else
             {  
               P.username = loggedInUser;
               P.new_username = v_new_name; 
               P.setUsername();
            ses = request.getSession();
            ses.setAttribute("loggedInUser", P.new_username);   
            %>
        
            <h1>New Username has been set!</h1>
            <form action="mainpage.jsp" method="post">
                <button type="submit">BACK!</button>
            </form>
            <%
            }
            %>
    </body>
</html>
