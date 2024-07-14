<%-- 
    Document   : search_dishes
    Created on : 11 21, 23, 7:18:02 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, createReviews.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search dishes</title>
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

        <form action="searchresult_dishes.jsp">
            <label for="cb1">Dish Category:</label>
            <input type="checkbox" id="cb1" name="cb1" onclick="toggleInput('search_dishCategory', 'cb1')" value="on">
            <select id="search_dishCategory" name="search_dishCategory" class="hidden">
                <%
                    ArrayList<String> dish_categories = d.get_dishCategories();
                    for (int i = 0; i < dish_categories.size(); i++){
                %>
                    <option value="<%=dish_categories.get(i)%>">
                    <%=dish_categories.get(i)%>
                    </option>
                <%
                    }
                %>
            </select>
            <br><br>

            <label for="cb2">Price range:</label>
            <input type="checkbox" id="cb2" name="cb2" onclick="toggleInput('upload_date_range', 'cb2')" value="on">
            <div id="upload_date_range" class="hidden">
                Format [xxx.xx]<br>
                Below:
                <input type="text" id="price_ceiling" name="price_ceiling" pattern="[0-9]*\.[0-9]{2}" title="price_ceiling" size="4"><br>
                Above:
                <input type="text" id="price_floor" name="price_floor" pattern="[0-9]*\.[0-9]{2}" title="price_floor" size="4"><br>
            </div><br>
            <button type="submit">Search dish</button>
        </form>

        <br>

        <a href="mainpage.jsp">Return to main menu</a>

        <script>
            function toggleInput(inputId, checkboxId) {
                var inputField = document.getElementById(inputId);
                var checkbox = document.getElementById(checkboxId);

                inputField.style.display = (checkbox.checked) ? 'block' : 'none';
                inputField.required = checkbox.checked;
            }
        </script>
    </body>
</html>


