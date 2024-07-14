<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, restaurant_review_mgt.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Restaurant Reviews</title>
    <style>
        body {
            text-align: center;
            margin: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            display: inline-block;
            margin: 5px;
            padding: 8px 15px;
            text-decoration: none;
            color: #fff;
            border-radius: 5px;
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #32a852;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form action="mainpage.jsp">
        <jsp:useBean id="R" class="restaurant_review_mgt.resto_review" scope="session"/>

        <table>
            <thead>
                <tr>
                    <th>Rating</th>
                    <th>Number of Ratings</th>
                    <th>Percentage of total ratings</th>
                </tr>
            </thead>
            <tbody>
                <%
                    R.restaurant_review_report();
                    for(int i = 0; i < R.rating_typelist.size(); i++){     
                %>  
                <tr>
                    <td><%=R.rating_typelist.get(i)%></td>
                    <td><%=R.count_list.get(i)%></td>
                    <td><%=R.average_list.get(i)%>%</td>
                </tr>
                <% } %>
            </tbody> 
        </table>    

        <input type="submit" value="Back to Main Menu">
    </form>
</body>
</html>
