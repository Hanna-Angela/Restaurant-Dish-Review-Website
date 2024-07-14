<%-- 
    Document   : view_dishreview
    Created on : 11 21, 23, 1:00:30 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, createReviews.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Restaurant Reviews</title>
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
        <h2>View a dish review<br></h2>
        
        <form action="viewresult_dishreview.jsp">
            <jsp:useBean id="dr" class="createReviews.dish_review" scope="session"/>
            <label for="selectReviewID">Select Review ID: </label>
            <select id="review_id" name="review_id" required>
            <%
                ArrayList<Integer> review_idList = dr.get_dishReviewIds();
                for(int i = 0; i < review_idList.size(); i++){     
            %>  
            <option value ="<%=review_idList.get(i)%>"><%=review_idList.get(i)%></option>               
            <% } %>
            </select>
            <button type="submit" >Submit</button><br>
        </form>
            
        <form action ="mainpage.jsp">
            <button type="submit" >Return to main menu</button>
        </form>
            
    </body>
</html>
