<%-- 
    Document   : deactivate_process
    Created on : 11 22, 23, 2:39:51 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <style>
        body 
        {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 50px;
        }

        form 
        {
            display: inline-block;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        </style>
    </head>
    <body>
    <jsp:useBean id="P" class ="user_management.profile" scope = "session"/>
            <%
            // Retrieve the username from the session
            HttpSession ses = request.getSession();
            String loggedInUser = (String) ses.getAttribute("loggedInUser");
            P.username = loggedInUser;
            
            int status = P.deleteProfile();
            if (status == 1)
            {
            %>
             <form action= "index.html" method="post">
            <button type="submit">Delete Success!</button>
            </form>
            <%
             }
            else
            {
           %>
             <form action= "mainpage.jsp" method="post">
            <button type="submit">Failed! Going back to mainpage</button>
            </form>
           <%
            }
            %>
    </body>
</html>