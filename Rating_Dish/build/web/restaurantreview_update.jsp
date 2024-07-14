<%-- 
    Document   : reviewrestaurant_update
    Created on : 11 18, 23, 7:14:27 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Restaurant Review</title>
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
        <div>
            
            <form action="restaurantreview_update_processing.jsp">
                <jsp:useBean id="R" class="restaurant_review_mgt.resto_review" scope="session"/>
                <%
                    int i = Integer.parseInt(request.getParameter("i"));
                    String source = request.getParameter("source");
                    
                    if(source == null)
                        source = "update";
                %>
                <p>Date Reviewed: <%= R.review_datelist.get(i)%></p>
                <label for="selectRating">Select the rating for the restaurant: </label>
                <input type="hidden" name="i" value="<%= i %>">
                <input type="hidden" name="source" value="<%= source %>">
                
                <select id="rating" name="rating" required>
                    <option value="" disabled hidden>Select an option</option>
                    <option value="Excellent" <%= R.rating_list.get(i).equals("Excellent") ? "selected" : "" %>>Excellent</option>
                    <option value="Good" <%= R.rating_list.get(i).equals("Good") ? "selected" : "" %>>Good</option>
                    <option value="Average" <%= R.rating_list.get(i).equals("Average") ? "selected" : "" %>>Average</option>
                    <option value="Fair" <%= R.rating_list.get(i).equals("Fair") ? "selected" : "" %>>Fair</option>
                    <option value="Poor" <%= R.rating_list.get(i).equals("Poor") ? "selected" : "" %>>Poor</option>
                </select><br>
                Write a Review:<textarea id="review" name="review" rows="5" cols="60" required><%= R.review_textlist.get(i)%></textarea><br>
                <button type="submit">Update</button>
                <button type="button" onclick="history.back()">Back</button>
            </form>     
            
        </div>
        
       
        
        
    </body>
</html>
