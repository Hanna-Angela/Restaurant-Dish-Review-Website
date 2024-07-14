<%-- 
    Document   : profile_process
    Created on : 11 15, 23, 8:58:10 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, user_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>profile_process</title>
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
            max-width: 300px;
            margin: 0 auto;
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
            String v_username = request.getParameter("username");
            String v_bio = request.getParameter("bio");
        
            P.username = v_username;
            P.bio = v_bio;
     

            
            int status = P.isUsernameTaken();
            
            if(status == 0)
            { 
                P.profileSetUp();
                     HttpSession ses = request.getSession();
                    ses.setAttribute("loggedInUser", P.username);
         %> 
                 <h1> Profile Set Up is Done! </h1>
            <form action="mainpage.jsp" method="post">
                <button type="submit">NEXT</button>
            </form>
        
          <% }
           else
            {
               
           %>
              <h1> USERNAME IS TAKEN! ENTER A NEW ONE </h1>
            <form action="profile_setup.html" method="post">
                <button type="submit">BACK</button>
            </form>
           <%
            }
           %>    
    </body>
</html>
