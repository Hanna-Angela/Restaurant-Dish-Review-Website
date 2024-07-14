<%-- 
    Document   : update_dishreview
    Created on : 11 21, 23, 2:27:52 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, createReviews.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update dish review</title>
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
        <h2>Update dish review<br></h2>
        
        <jsp:useBean id="dr" class="createReviews.dish_review" scope="session"/>
        <jsp:useBean id="dishList" class="createReviews.dish" scope="session" />
        <form action="updateresult_dishreview.jsp">
            Review ID: <textarea id="review_id" name="review_id" readonly><%= dr.review_id%></textarea><br>
            Username: <textarea id="user_name" name="user_name" readonly><%= dr.user_name%></textarea><br>
            Dish: <textarea id="dish_name" name="dish_name" readonly><%= dr.dish_name%></textarea><br>
            Dish category: <textarea id="dish_category" name="dish_category" readonly><%= dr.dish_category%></textarea><br>
            Uploaded by: <textarea id="time_of_upload" name="time_of_upload" readonly><%= dr.time_of_upload%></textarea><br><br>

            <!--Dropdown to select an overall rating for the dish selected--> 
            <label for="selectOverallRating">Select your overall rating for the dish: </label>
            <select id="selectOverallRating" name="selectOverallRating" required>
                <option value="">Select an option</option>
                <option value="5">Very Satisfied</option>
                <option value="4">Satisfied</option>
                <option value="3">Neutral</option>
                <option value="2">Dissatisfied</option>
                <option value="1">Very Dissatisfied</option>
            </select>
            <br>

            <!--Dropdown to select a quality rating for the dish selected--> 
            <label for="selectQualityRating">Rate the quality of the dish: </label>
            <select id="selectQualityRating" name="selectQualityRating" required>
                <option value="">Select an option</option>
                <option value="5">Very Satisfied</option>
                <option value="4">Satisfied</option>
                <option value="3">Neutral</option>
                <option value="2">Dissatisfied</option>
                <option value="1">Very Dissatisfied</option>
            </select>
            <br>

            <!--Dropdown to select a price rating for the dish selected--> 
            <label for="selectPriceRating">Rate the price of the dish: </label>
            <select id="selectPriceRating" name="selectPriceRating" required>
                <option value="">Select an option</option>
                <option value="1">Overpriced</option>
                <option value="2">Worth the price</option>
                <option value="3">Sulit!</option>
            </select>
            <br>

            <!--Text input for the review--> 
            <label for="inputReview">Review: </label>
            <input type="text" id="review_text" name="review_text" style="width: 300px; height:50px;" required value =<%=dr.review_text%>><br>
            
            <!--Button to initiate the review upload--> 
            <button type="submit">Update</button>
        </form>
            
        <br>
        <form action="mainpage.jsp">
            <button type="submit">Cancel</button>
        </form>
    </body>
</html>
