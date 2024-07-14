<%-- 
    Document   : remove_mobile
    Created on : 11 21, 23, 11:08:06 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, user_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>remove_mobile</title>
        <style>
        body 
        {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 50px;
        }

        form 
        {
            display: inline-block;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label 
        {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        select 
        {
            padding: 8px;
            font-size: 16px;
            width: 200px;
        }

        input[type="submit"] 
        {
            background-color: #5dd55d;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover 
        {
            background-color: #2aa22a;
        }
        </style>
    </head>
    <body>
         <jsp:useBean id="M" class ="user_management.mobile" scope = "session"/>  
           <% //receives from the create_account html
            HttpSession ses = request.getSession();
            String loggedInUser = (String) ses.getAttribute("loggedInUser");
            
            M.userName = loggedInUser;

            List<String> mobileNumbers = M.getUserMobile();
            %>
         <form
    <%-- Check if mobile numbers are found to set the form action accordingly --%>
    <% if (!mobileNumbers.isEmpty()) 
       { 
    %>
       action="remove_mobile.jsp"
    <% }    
       else 
       { 
    %>
        action="edit_number.html"
    <% } 
    %>
    method="post">
    
    <label for="mobileNumberDropdown">Select Mobile Number:</label>
    <select name="mobileNumberDropdown" id="mobileNumberDropdown">
        <%
        if (!mobileNumbers.isEmpty()) 
        {
            for (String mobileNumber : mobileNumbers) 
            {
        %>
            <option value="<%= mobileNumber %>"><%= mobileNumber %></option>
        <%
            }
        } 
        else 
        {
        %>
            <option value="" disabled selected>No mobile numbers found for the user.</option>
        <%
        }
        %>
    </select>

    <br>
    <input type="submit" value="Next">
</form>
    <form action="edit_number.html" method="post">
            <button type="submit">Back</button>
     </form>
    </body>
</html>
