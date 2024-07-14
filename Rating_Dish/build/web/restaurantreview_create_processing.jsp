<%-- 
    Document   : reviewrestaurant_processing
    Created on : 11 16, 23, 9:36:38 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, restaurant_review_mgt.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Review Processing</title>
    </head>
    <body>
            <jsp:useBean id="R" class="restaurant_review_mgt.resto_review" scope="session"/>
            <%
                // Retrieve the username from the session
                HttpSession ses = request.getSession();
                String loggedInUser = (String) ses.getAttribute("loggedInUser");
            
                R.rating = request.getParameter("rating");
                R.review_text = request.getParameter("review");
                R.user_name = loggedInUser;
                R.profile_id = R.get_profile_id(loggedInUser);
                int status = R.restaurant_review_create();

            %> 
            
            <% if (status == 1) { %>
                <script type="text/javascript">
                    alert("Success!");
                    window.location.href = "mainpage.jsp";
                </script>
            <% } else { %>
                <script type="text/javascript">
                    alert("Failed!");
                    window.location.href = "mainpage.jsp";
                </script>
            <% } %>
    </body>
</html>
