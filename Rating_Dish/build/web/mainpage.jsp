<!DOCTYPE html>
<html>
<head>
    <title>Restaurant</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body 
        {   
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
            text-align: center;
        }

        div {
            margin: 20px;
        }

        h1 {
            color: #333;
        }

        p {
            color: #666;
        }

        a 
        {
            display: inline-block;
            width: 200px; /* Set a fixed width for the buttons */
            margin: 10px;
            padding: 10px;
            text-decoration: none;
            background-color: #5dd55d;
            color: #fff;
            border-radius: 5px;
        }
        a:hover 
        {
            background-color: #2aa22a;
        }
    </style>
</head>
<body>
        <jsp:useBean id="P" class ="user_management.profile" scope = "session"/>
            <%
            // Retrieve the username from the session
            HttpSession ses = request.getSession();
            String loggedInUser = (String) ses.getAttribute("loggedInUser");
            
            P.username =loggedInUser;
            String bio = P.getBio();

            %>
            <h1>Welcome, <%= loggedInUser %>!</h1>
            <h1>Bio: <%= bio %> </h1>
    <div>
        <h1>Restaurant</h1>
        <p>Address: One Archers Place, 2311 Taft Ave, 
            Malate, Manila, 1004 Metro Manila
            <br>
            Number: 111-1111
            <br>
            Operating Hours: 10:00 AM - 8:00 PM Everyday
        </p>
    </div>
    <div>
        <a href="restaurantreview_mainpage.html">Restaurant Reviews</a><br>
        <a href="dishreview.jsp">Dish reviews</a><br>
        <a href="edit_dish.html">Edit dishes</a><br>
        <a href="edit_number.html">Edit Mobile Number</a><br>
        <a href="edit_profile.html">Edit Profile</a><br>
        <a href="view_user.html">View User</a><br>
        <a href="deactivate.html">Deactivate Account </a><br>
        <a href="index.html">LOG OUT</a><br>
        
    </div>
</body>
</html>