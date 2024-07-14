<%-- 
    Document   : reviewrestaurant_processing
    Created on : 11 16, 23, 9:36:38 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, restaurant_review_mgt.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Review Processing</title>
    </head>
    <body>
        
            <jsp:useBean id="R" class="restaurant_review_mgt.resto_review" scope="session"/>
            <%
                int i = Integer.parseInt(request.getParameter("i"));
                // Receive the values
                R.review_id = R.review_idlist.get(i);
                int status = R.restaurant_review_delete();
  
                String source = request.getParameter("source");
                String nextPage = "";
                
                if(source.equals("delete"))
                    nextPage = "mainpage.jsp";
                if(source.equals("list"))
                    nextPage = "restaurantreview_list.jsp";
                
            %>
            <% if (status == 1) { %>
                <script type="text/javascript">
                    alert("Success!");
                    window.location.href = "<%= nextPage %>";
                </script>
            <% } else { %>
                <script type="text/javascript">
                    alert("Failed!");
                    window.location.href = "<%= nextPage %>";
                </script>
            <% } %>
    </body>
</html>
