<%-- 
    Document   : view_dish
    Created on : 11 21, 23, 11:33:15 PM
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
        <form action="viewresult_dishes.jsp">
            <label for="view_dish">View dish:  </label>
            <select id="view_dish" name="view_dish">
                <%
                    ArrayList<String> dish_names = d.get_dishList();
                    ArrayList<Integer> dish_ids = d.get_dishIds();
                    for (int i = 0; i < dish_ids.size(); i++){
                %>
                    <option value="<%=dish_ids.get(i)%>"><%=dish_names.get(i)%></option>
                <%
                    }
                %>
            </select><br>
            <button type="submit">View dish</button>
        </form>
        <a href="mainpage.jsp">Return to main menu</a>
    </body>
</html>
