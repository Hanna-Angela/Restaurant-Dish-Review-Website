<%-- 
    Document   : viewresult_dishreview
    Created on : 11 21, 23, 1:18:01 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, createReviews.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Restaurant Review</title>
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
        <h2>View a dish review<br></h2>
        <form action="mainpage.jsp">
                <jsp:useBean id="dr" class="createReviews.dish_review" scope="session"/>
                <%
                    int review_id = Integer.parseInt(request.getParameter("review_id"));
                    if (dr.viewDishReview(review_id) == 1){
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
                            Review: <textarea id="review_text" name="review_text" readonly><%= dr.review_text%></textarea><br>
                        <%
                    } else {
                        %>
                            Unknown error occurred.
                        <%
                    }
                %>
                
                <button type="submit">Main Menu</button>
                <button type="button" onclick="history.back()">Back</button>
            </form> 
                
            <%
            // Retrieve the username from the session
            HttpSession ses = request.getSession();
            String loggedInUser = (String) ses.getAttribute("loggedInUser");
            
            if (dr.user_name.equals(loggedInUser)){
                %>
                    <!--If p.user_name = logged in user-->
                    <form action="update_dishreview.jsp">
                        <button type="submit">Update Dish Review</button>
                    </form>

                    <!--If p.user_name = logged in user-->
                    <form action="delete_dishreview.jsp">
                        <button type="submit">Delete Dish Review</button>
                    </form>
                <%
            }
           %>
            
    </body>
</html>
