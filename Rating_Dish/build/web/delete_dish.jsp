<%-- 
    Document   : delete_dish
    Created on : 11 21, 23, 6:10:13 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, createReviews.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>delete_dish</title>
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

        label 
        {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        select 
        {
            padding: 8px;
            font-size: 16px;
            width: 200px;
        }

        input[type="submit"] 
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

        input[type="submit"]:hover 
        {
            background-color: #2aa22a;
        }
        </style>
        
    </head>
    <body>
        <jsp:useBean id="D" class ="createReviews.dish" scope = "session"/>
          <% //receives from the create_account html
        
            String v_category = request.getParameter("category");
       
            D.category = v_category;
            
           
            
             List<String> multipleDishes = D.getDishes();
         %> 
     <form
    <% if (!multipleDishes.isEmpty()) 
       { 
    %>
       action="delete_dish_process.jsp"
    <% }    
       else 
       { 
    %>
        action="delete_dish_category.html"
    <%  
       }
    %>
    method="post">
    
    <label for="dishesDropDown">Select Dish:</label>
    <select name="dishesDropDown" id="dishesDropDown">
        <%
        if (!multipleDishes.isEmpty()) 
        {
            for (String md : multipleDishes) 
            {
        %>
            <option value="<%= md %>"><%= md %></option>
        <%
            }
        } 
        else 
        {
        %>
            <option value="" disabled selected>No dish found in this category.</option>
        <%
        }
        %>
    </select>

    <br>
    <input type="submit" value="Next">
</form>
    <form action= "delete_dish_category.html" method="post">
            <button type="submit">Back</button>
     </form>
    </body>
</html>
