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
        <title>Delete Restaurant Reviews</title>
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
        <form action="restaurantreview_delete.jsp">
            <jsp:useBean id="R" class="restaurant_review_mgt.resto_review" scope="session"/>
            <label for="selectReviewID">Select Review ID: </label>
            <select id="review_id" name="i" required>
            <%
                // Retrieve the username from the session
                HttpSession ses = request.getSession();
                String loggedInUser = (String) ses.getAttribute("loggedInUser");
                
                R.restaurant_review_list();
                for(int i = 0; i < R.review_idlist.size(); i++){ 
                    if(R.user_namelist.get(i).equals(loggedInUser)){
            %>  
            <option value ="<%=i%>"><%=R.review_idlist.get(i)%></option>               
            <% }} %>
            </select>
            <button type="submit" >Submit</button>
            <button type="button" onclick="history.back()">Back</button>
        </form>
            
    </body>
</html>
