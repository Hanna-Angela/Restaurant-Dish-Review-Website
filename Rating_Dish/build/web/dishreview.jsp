<%-- 
    Document   : dishreview_input
    Created on : 11 17, 23, 1:27:27 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, createReviews.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dish review</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
        body 
        {   
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
            text-align: center;
        }

        div {
            margin: 20px;
        }

        h1 {
            color: #333;
        }

        p {
            color: #666;
        }

        a 
        {
            display: inline-block;
            width: 200px; /* Set a fixed width for the buttons */
            margin: 10px;
            padding: 10px;
            text-decoration: none;
            background-color: #5dd55d;
            color: #fff;
            border-radius: 5px;
        }
        a:hover 
        {
            background-color: #2aa22a;
        }
    </style>
    </head>
    
    <body>
        <h2>Dish reviews<br></h2>
        
        <a href="input_review.jsp">Create a dish review</a><br>
        <a href="view_dishreview.jsp">View, Update, and Delete a review</a><br>
        <a href="search_review.jsp">Search a dish review</a><br>
        <a href="mainpage.jsp">Return to main menu</a><br>
    </body>
</html>