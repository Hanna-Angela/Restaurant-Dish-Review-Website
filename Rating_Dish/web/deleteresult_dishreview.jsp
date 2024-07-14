<%-- 
    Document   : deleteresult_dishreview
    Created on : 11 21, 23, 5:06:35 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, createReviews.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete dish review</title>
    </head>
    <style>
        body {
            text-align: center;
        }
        
        form {
            display: inline-block;
            text-align: left;
            margin: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            padding: 10px 20px;
            background-color: #32a852;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button[type="button"] {
            margin-right: 10px;
        }
    </style>
    <body>
        <jsp:useBean id="dr" class="createReviews.dish_review" scope="session"/>
        <%
            if (dr.deleteDishReview()){
                %><h1>Dish review deleted successfully!</h1><%
            } else {
                %><h1>Dish review delete failed</h1><%
            }
        %>
        
        <form action="view_dishreview.jsp">
            <button type="submit">Find another review</button>
        </form>
        
        <form action="mainpage.jsp">
            <button type="submit">Return to main menu</button>
        </form>
    </body>
</html>
