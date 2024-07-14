<%-- 
    Document   : update_dishes
    Created on : 11 22, 23, 1:38:05 AM
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
        <form action="updateresult_dish.jsp">
            Dish ID: <%=d.dish_id%><br>
            Dish Name: <%=d.dish%><br>

            <label for="dish_price">Dish price: </label>
            <input type="text" id="dish_price" name="dish_price" required value =<%=d.dish_price%>><br>

             <select id="dish_category" name="dish_category" required>
            <%
                ArrayList<String> dish_categories = d.get_dishCategories();
                for (int i = 0; i < dish_categories.size(); i++){
            %>
            <option value="<%=dish_categories.get(i)%>">
            <%=dish_categories.get(i)%>
            </option>
            <%}
            %>
             </select><br>
            <button type="submit">Update dish</button>
        </form>
        <a href="view_dish.jsp">Cancel</a>
        <a href="mainpage.jsp">Return to Main Menu</a>
    </body>
</html>
