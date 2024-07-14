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
             <jsp:useBean id="M" class ="user_management.mobile" scope = "session"/>  
             
              <% //receives from the create_account html
            HttpSession ses = request.getSession();
            String loggedInUser = (String) ses.getAttribute("loggedInUser");
             
            String v_mobile = request.getParameter("mobile");
                    
            out.println(loggedInUser);
            M.mobile = v_mobile; 
            M.userName = loggedInUser;
            
            int status1 = M.getMobile();
            
            if(status1 == 1)
            {
            %>
              <h1>Mobile Number has been taken.</h1>
            <form action="mobile_number.html" method="post">
                <button type="submit">BACK!</button>
            </form>
            <%
                
             }
             else
             {   
               M.setMobile();
            %>
            <h1>Mobile Number added!</h1>
            <form action="mainpage.jsp" method="post">
                <button type="submit">BACK!</button>
            </form>
            <%
            }
            %>
    </body>
</html>
