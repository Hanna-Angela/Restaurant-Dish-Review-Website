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
        <title>Create a dish review</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <jsp:useBean id="dishList" class="createReviews.dish" scope="session" />
        
        <h2>Create a dish review<br></h2>
        
        <form action="review_dish.jsp">
            <!--Dynamic dropdown to select a dish to rate-->  
            <label for="selectDish">Select a dish to rate: </label>
            <select id="selectDish" name="selectDish" required>
                <option value="">Select an option</option>
                <%
                    ArrayList<String> dish_names = dishList.get_dishList();
                    ArrayList<Integer> dish_ids = dishList.get_dishIds();
                    for (int i = 0; i < dish_ids.size(); i++){
                %>
                    <option value="<%=dish_ids.get(i)%>">
                    <%=dish_names.get(i)%>
                    </option>
                <%
                    }
                %>
            </select>
            <br><br><br>

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
            <input type="text" id="review_id" name="review_text" style="width: 300px; height:50px;" required><br>
            
            <!--Button to initiate the review upload--> 
            <button type="submit">Submit</button>
        </form>
            
        <br>
        <form action="mainpage.jsp">
            <button type="submit">Return to main menu</button>
        </form>
    </body>
</html>
