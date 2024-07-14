<%-- 
    Document   : review_dish
    Created on : 11 15, 23, 10:58:11 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, createReviews.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Review Upload Page</title>
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
        <jsp:useBean id="dr" class="createReviews.dish_review" scope="session" />
        
        <form action="mainpage.jsp">
            <%
                dr.overall_rating = Integer.parseInt(request.getParameter("selectOverallRating"));
                dr.quality_rating = Integer.parseInt(request.getParameter("selectQualityRating"));
                dr.price_rating = Integer.parseInt(request.getParameter("selectPriceRating"));
                dr.review_text = request.getParameter("review_text");
                dr.dish_id = Integer.parseInt(request.getParameter("selectDish"));
                
                HttpSession ses = request.getSession();
                dr.user_name = (String) ses.getAttribute("loggedInUser");
                
                int status = dr.upload_dishReview();
                if (status == 1){
            %>
            <h2>Successfully created dish review!<br></h2>
            <%
                    if (dr.get_recentDishReview()) {
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
        
        <form action="input_review.jsp">
           <button type="submit">Create another review</button>
        </form>
    </body>
</html>
