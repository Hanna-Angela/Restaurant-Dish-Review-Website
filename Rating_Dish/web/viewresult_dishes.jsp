<%-- 
    Document   : viewresult_dishes
    Created on : 11 21, 23, 11:40:50 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, createReviews.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View dish</title>
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
        View dish:<br>
        <%
            d.dish_id = Integer.parseInt(request.getParameter("view_dish"));
            
            if (d.viewDish() == 0){
                %>Could not retrieve the dish at this time.<%
            } else {
                %>
                Dish ID: <%=d.dish_id%><br>
                Dish Name: <%=d.dish%><br>
                Dish Price: <%=d.dish_price%><br>
                Dish Category: <%=d.category%><br><br>
                Quarterly Rating as of quarter <%=d.review_quarter%> of <%=d.review_year%>:<br>
                Overall Rating: <%=d.avg_overall%>/5<br>
                Quality Rating: <%=d.avg_quality%>/5<br>
                Price Rating: <%=d.avg_price%>/3<br>
                Total reviews this quarter: <%=d.review_count%><br>
                <%
            }
        %>
        <a href="viewresult_dishes.jsp">Search dish</a>
        <a href="update_dishes.jsp">Update dish</a>
        <a href="mainpage.jsp">Return to main menu</a>
    </body>
</html>
