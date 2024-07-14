<%-- 
    Document   : updateresult_dish
    Created on : 11 22, 23, 1:52:05 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, createReviews.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update dish</title>
        <style>
            .hidden {
                display: none;
            }

            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f4f4;
                text-align: center;
                margin: 20px;
            }

            h1 {
                color: #333;
            }

            a {
                display: inline-block;
                padding: 10px 20px;
                margin: 10px;
                text-decoration: none;
                color: #fff;
                background-color: #5dd55d;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            a:hover {
                background-color: #2aa22a;
            }
            
            select {
                width: 50%;
                margin: 0 auto;
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="d" class="createReviews.dish" scope="session" />
        <%
            d.dish_price = Float.parseFloat(request.getParameter("dish_price"));
            d.category = request.getParameter("dish_category");
            
            int status = d.updateDish();
            if (status == 0){
                %>An unknown error occurred.<%
            } else {
                %>
                Update successful!<br>
                Dish ID: <%=d.dish_id%><br>
                Dish Name: <%=d.dish%><br>
                Dish Price: <%=d.dish_price%><br>
                Dish Category: <%=d.category%><br>
                <%
            }
        %>
        <a href="view_dish.jsp">View another dish</a>
        <a href="mainpage.jsp">Return to Main Menu</a>
    </body>
</html>
