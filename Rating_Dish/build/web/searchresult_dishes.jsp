<%-- 
    Document   : searchresult_dishes
    Created on : 11 21, 23, 7:51:20 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%
            if (request.getParameter("cb1") == null && request.getParameter("cb2") == null){
                %>Please select at least one field.<%
            } else {
                if ("on".equals(request.getParameter("cb1"))){
                    d.category = request.getParameter("search_dishCategory");
                } else {
                    d.category = "";
                }

                if ("on".equals(request.getParameter("cb2"))){
                    if (!request.getParameter("price_ceiling").equals("") || !request.getParameter("price_floor").equals("")){
                        try {
                            d.price_ceiling = Float.parseFloat(request.getParameter("price_ceiling"));
                        } catch (Exception e){
                            d.price_ceiling = -1;
                        }

                        try {
                            d.price_floor = Float.parseFloat(request.getParameter("price_floor"));
                        } catch (Exception e){
                            d.price_floor = -1;
                        }
                    }
                } else {
                    d.price_floor = -1;
                    d.price_ceiling = -1;
                }

                int result = d.searchDishes();
                if (result == 0){
                    %>An unexpected error occurred.<%
                } else if (result == 1){
                    for (int i = 0; i < d.dish_ids.size(); i++){
                        %>
                        ----------------------------------------<br>
                        Dish ID: <%=d.dish_ids.get(i)%><br>
                        Dish Name: <%=d.dish_names.get(i)%><br>
                        Dish Price: <%=d.dish_prices.get(i)%><br>
                        Dish Category: <%=d.dish_categories.get(i)%><br>
                        ----------------------------------------<br>
                        <br><br><br>
                        <%
                    }
                } else if (result == 2){
                    %>No dishes found.<%
                }
            }
        %>
        
        <a href="search_dishes.jsp">Search dish</a>
        <a href="mainpage.jsp">Return to main menu</a>
    </body>
</html>
