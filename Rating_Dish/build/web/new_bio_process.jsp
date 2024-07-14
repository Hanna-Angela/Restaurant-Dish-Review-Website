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
    </head>
    <body>
             <jsp:useBean id="P" class ="user_management.profile" scope = "session"/>  
             
              <% //receives from the create_account html
            HttpSession ses = request.getSession();
            String loggedInUser = (String) ses.getAttribute("loggedInUser");
             
            String v_new_bio = request.getParameter("new_bio");
                    
            P.new_bio = v_new_bio;
            P.username = loggedInUser;
            P.id_profile = P.getProfileId();
            
            int status1 = P.setBio();
            
            if(status1 == 1)
            {
            %>
                <h1>New Bio has been set!</h1>
               <form action="mainpage.jsp" method="post">
                   <button type="submit">BACK!</button>
               </form>
            <%
                
             }
             else
             {  
               
            %>

            <h1>Bio has failed to set!</h1>
            <form action="mainpage.jsp" method="post">
                <button type="submit">BACK!</button>
            </form>
            <%
            }
            %>
    </body>
</html>
