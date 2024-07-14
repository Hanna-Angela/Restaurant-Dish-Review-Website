<%-- 
    Document   : result_review
    Created on : 11 19, 23, 11:38:40 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, java.text.SimpleDateFormat, createReviews.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Result</title>
    </head>
    <style>
            /* Styles for the input fields */
            .hidden {
                display: none;
            }
        </style>
    </head>
    <style>
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
        <jsp:useBean id="R" class="restaurant_review_mgt.resto_review" scope="session" />
        
        <%
            
            if (request.getParameter("cb1") == null && request.getParameter("cb2") == null && request.getParameter("cb3") == null){
        %>
                <h1>Please select at least one field.</h1>
        <%
            } else {
                String user_name, rating, start_date, end_date;
                boolean v1 = true, v3 = true;
                
                if ("on".equals(request.getParameter("cb1"))){
                    user_name = request.getParameter("user_name");
                } else {
                    user_name = "";
                }

                if ("on".equals(request.getParameter("cb2"))){
                    rating = request.getParameter("search_rating");
                } else {
                    rating = "";
                }

                if ("on".equals(request.getParameter("cb3"))){
                    start_date = request.getParameter("start_year") + "-" + request.getParameter("start_month") + "-" + request.getParameter("start_date");
                    end_date = request.getParameter("end_year") + "-" + request.getParameter("end_month") + "-" + request.getParameter("end_date");

                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    dateFormat.setLenient(false);
                    
                    //Checks if non-null dates are valid
                    if (start_date != null || end_date != null){
                        try {
                            dateFormat.parse(start_date);
                            dateFormat.parse(end_date);
                        } catch (Exception e) {
                            v3 = false;
                        }
                    } else {
                        v3 = false;
                    }
                } else {
                    start_date = "";
                    end_date = "";
                }

                

                if (v1 && v3){
                    int result = R.restaurant_review_search(user_name, rating, start_date, end_date);
                    if (result == 0){
                    %>
                        <h1>An unexpected error occurred.</h1>
                    <%
                    } else if (result == 2){
                    %>
                        <h1>No reviews found.</h1>
                    <%
                    } else if (result == 1){
                        for (int i = 0; i < R.review_idlist.size(); i++){
                            %>
                            ----------------------------------------<br>
                            Review ID: <%=R.review_idlist.get(i)%><br>
                            Username: <%=R.user_namelist.get(i)%><br>
                            Uploaded on: <%=R.review_datelist.get(i)%><br><br>
                            Overall rating: <%=R.rating_list.get(i)%><br>
                            Review: <%=R.review_textlist.get(i)%><br>
                            ----------------------------------------<br>
                            <br><br><br>
                            <%
                        }
                    }
                } else {
                    %>
                    <h1>Please provide a valid input.<br></h1>
                    <%
                }
            }
        %>
        
        <form action ="restaurantreview_search.jsp">
            <button type="submit">Search other reviews</button>
        </form>
        <br>
        <form action ="mainpage.jsp">
             <button type="submit">Return to main menu</button>
        </form>
    </body>
</html>
