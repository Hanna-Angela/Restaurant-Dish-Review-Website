<%-- 
    Document   : add_dish_process
    Created on : 11 21, 23, 5:04:20 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, createReviews.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit_dish</title>
    </head>
    <body>
         <jsp:useBean id="D" class ="createReviews.dish" scope = "session"/>
        <% //receives from the create_account html
            String v_dish = request.getParameter("new_dish");
            String v_dish_price = request.getParameter("dish_price");
            String v_category = request.getParameter("category");
       
            
            D.dish = v_dish;
            D.dish_price = Float.parseFloat(v_dish_price);
            D.category = v_category;
            
            int status = D.getDish();
            
            if(status == 1)
            { 
         %>  
            <h1>DISH ALREADY ADDED!</h1>
            <form action="add_dish.html" method="post">
                <button type="submit">BACK</button>
            </form>           
        <%  
          }
          else
         {
            D.addDish();
        %>
         
         <h1>DISH ADDED!</h1>
            <form action="add_dish.html" method="post">
                <button type="submit">BACK</button>
            </form> 
         <%  
          }
         %>
    </body>
</html>
