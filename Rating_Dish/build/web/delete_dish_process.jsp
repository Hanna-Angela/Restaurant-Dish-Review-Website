<%-- 
    Document   : delete_dish_process
    Created on : 11 21, 23, 7:11:34 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, user_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>delete_dish_process</title>
         <style>
        body 
        {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 50px;
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
        <jsp:useBean id="D" class ="createReviews.dish" scope = "session"/>
          <% //receives from the create_account html
        
            String v_dish = request.getParameter("dishesDropDown");
       
        
            D.dish = v_dish;
            
            int status = D.deleteDish();
            
            if(status == 1)
            {
            %>
             <h1>Dish has been removed!.</h1>
            <form action="edit_dish.html" method="post">
                <button type="submit">BACK!</button>
            </form>
            <% 
            }
            else
            {
            %>
                <h1>Dish failed to remove!.</h1>
            <form action="edit_dish.html" method="post">
                <button type="submit">BACK!</button>
            </form>
            <%
            }
            %>  
         
    </body>
</html>