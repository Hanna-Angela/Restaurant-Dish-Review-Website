<%-- 
    Document   : restaurantreviews_view
    Created on : 11 18, 23, 4:54:02 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, restaurant_review_mgt.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Restaurant Review</title>
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

        p {
            color: #666;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        select, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            background-color: #f8f9fa;
        }

        button {
            padding: 10px 20px;
            background-color: #dc3545; 
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
        <form action="restaurantreview_delete_processing.jsp">
                <jsp:useBean id="R" class="restaurant_review_mgt.resto_review" scope="session"/>
                <%
                    int i = Integer.parseInt(request.getParameter("i"));
                %>
                <p>Date Reviewed: <%= R.review_datelist.get(i)%></p>
                <label for="selectRating">Rating: </label>
                <input type="hidden" name="i" value="<%= i %>">
                <input type="hidden" name="source" value="delete">
                
                <select id="rating" name="rating" readonly>
                    <option value="" disabled hidden>Select an option</option>
                    <option value="Excellent" readonly <%= R.rating_list.get(i).equals("Excellent") ? "selected" : "disabled" %>>Excellent</option>
                    <option value="Good" readonly <%= R.rating_list.get(i).equals("Good") ? "selected" : "disabled" %>>Good</option>
                    <option value="Average" readonly <%= R.rating_list.get(i).equals("Average") ? "selected" : "disabled" %>>Average</option>
                    <option value="Fair" readonly <%= R.rating_list.get(i).equals("Fair") ? "selected" : "disabled" %>>Fair</option>
                    <option value="Poor" readonly <%= R.rating_list.get(i).equals("Poor") ? "selected" : "disabled" %>>Poor</option>
                </select><br>
                Review:<textarea id="review" name="review" rows="5" cols="60" readonly><%= R.review_textlist.get(i)%></textarea><br>
                <button type="submit">Delete</button>
                <button type="button" onclick="history.back()">Back</button>
            </form> 
                
    </body>
</html>
