<%-- 
    Document   : updateresult_dishreview
    Created on : 11 21, 23, 2:53:33 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, createReviews.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Dish Review</title>
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
        
        <h2>Update dish review<br></h2>
        
        <form action="mainpage.jsp">
            <%
                dr.overall_rating = Integer.parseInt(request.getParameter("selectOverallRating"));
                dr.quality_rating = Integer.parseInt(request.getParameter("selectQualityRating"));
                dr.price_rating = Integer.parseInt(request.getParameter("selectPriceRating"));
                dr.review_text = request.getParameter("review_text");
                if (dr.updateDishReview()){
            %>
            <h1>Review updated!</h1>
            <%
                    if (dr.viewDishReview(dr.review_id) == 1) {
            %>
                        Review ID: <textarea id="review_id" name="review_id" readonly><%= dr.review_id%></textarea><br>
                        Username: <textarea id="user_name" name="user_name" readonly><%= dr.user_name%></textarea><br>
                        Dish: <textarea id="dish_name" name="dish_name" readonly><%= dr.dish_name%></textarea><br>
                        Dish category: <textarea id="dish_category" name="dish_category" readonly><%= dr.dish_category%></textarea><br>
                        Uploaded by: <textarea id="time_of_upload" name="time_of_upload" readonly><%= dr.time_of_upload%></textarea><br><br>
                        Overall rating: <textarea id="overall_rating" name="overall_rating" readonly><%
                switch(dr.overall_rating){
                    case 1:
                        %>Very Dissatisfied<%
                            break;
                    case 2:
                        %>Dissatisfied<%
                            break;
                    case 3:
                        %>Neutral<%
                            break;
                    case 4:
                        %>Satisfied<%
                            break;
                    case 5:
                        %>Very Satisfied<%
                            break;
                }
            %>
                        </textarea><br>
                        Quality rating: <textarea id="quality_rating" name="quality_rating" readonly><%
                switch(dr.quality_rating){
                    case 1:
                        %>Very Dissatisfied<%
                            break;
                    case 2:
                        %>Dissatisfied<%
                            break;
                    case 3:
                        %>Neutral<%
                            break;
                    case 4:
                        %>Satisfied<%
                            break;
                    case 5:
                        %>Very Satisfied<%
                            break;
                }
            %>
                        </textarea><br>
                        Price rating: <textarea id="price_rating" name="price_rating" readonly><%
                switch(dr.price_rating){
                    case 1:
                        %>Overpriced<%
                            break;
                    case 2:
                        %>Worth the price<%
                            break;
                    case 3:
                        %>Sulit!<%
                            break;
                }
            %>
                        
                        </textarea><br>
                        Review: <textarea id="review_text" name="review_text" readonly><%= dr.review_text%></textarea><br><br>
            <%
                    }
                } else {
            %>
            <h1>Review upload failed.</h1><br>
            <h2>Try again later.</h2>
            <%
                }
            %>
            
            <!--Button to return to main menu--> 
            <button type="submit">Return to main menu</button>
        </form>
        
        <form action="view_dishreview.jsp">
           <button type="submit">Find another review</button>
        </form>
    </body>
</html>
