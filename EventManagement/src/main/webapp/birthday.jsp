<%-- 
    Document   : birthday.jsp
    Created on : 06-Feb-2024, 1:46:56 pm
    Author     : shakthisravanth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Booking</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
	<link rel="stylesheet" type="text/css" href="assets/css/style.css" />
    </head>
    <body>
        <header id="menu-jk">
    
        <div id="nav-head" class="header-nav">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-md-3  col-sm-12" style="color:#000;font-weight:bold; font-size:42px; margin-top: 1% !important;">Happy</div>
                    <div id="menu" class="col-lg-8 col-md-9 d-none d-md-block nav-item">
                        <ul >
                             <li><h2> You are one step ahead to book event <% if (session.getAttribute("uname") != null) {%>
                                
                                    <!-- <img src="slogo.jpg" alt="User Image" style="width: 20px; height: 20px; margin-right: 5px;"> -->
                                    <span style="color: #00ab9f;"><%=session.getAttribute("uname")%></span> <%}%> </h2></li>
			
                        </ul>
                       
                    </div>
						
                    <div class="col-sm-2 d-none d-lg-block appoint">
                         
                        <a class="btn btn-success" href="register?logout=yes">Logout</a>  
                    </div>
                    
                </div>
    
            </div>
        </div>
                                  
        </section>
    </header>
                                    

    <div class="container form">
        <form id="bookingForm" action="register" method="post">
            <h2>Event Booking Form</h2>
            <div class="form-group">
                <label for="name">Your Name:</label>
                <input type="text" id="name" value="<%=session.getAttribute("uname")%>" name="name" required readonly>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" value="<%=session.getAttribute("email")%>" name="mail" required readonly>
            </div>
<!--            <div class="form-group">
                <label for="event-date">Event Date:</label>
                <input type="date" id="event-date" name="date" required>
            </div>-->
<div class="form-group">
    <label for="event-date">Event Date:</label>
    <input type="date" id="event-date" name="date" required>
</div>

<script>
    // Get today's date in the format YYYY-MM-DD
    const today = new Date().toISOString().split('T')[0];
    
    // Set the min attribute of the input element to today
    document.getElementById('event-date').min = today;
</script>

            <div class="form-group">
                <label for="event-time">Event Time:</label>
                <input type="time" id="event-time" name="time" required>
            </div>
            <div class="form-group">
                <label for="events">Select an event:</label>
                <select id="events" name="event" type="select">
                  <option value="Birthday">Birthday</option>
                  <option value="Wedding">Wedding</option>
                  <option value="Garba">Garba</option>
                  <option value="Corporate Events">Corporate Event</option>
                  <option value="Concerts">Concerts</option>
                  <option value="Naming-ceremony">Naming Ceremony</option>
                  <option value="Holi">Holi</option>
                  <option value="Feast">Feast</option>
                </select>
            </div>
            <div class="form-group">
                <label for="attendees">:</label>
                <input type="text" id="address" name="address" required>
            </div>  
            <div class="form-group">
                <label for="attendees">Number of Attendees:</label>
                <input type="number" id="attendees" name="attendees" min="1" required>
            </div>
           
            <div class="form-group">
                <button type="submit" name="book">Submit</button>
            </div>
        </form>
    </div>
</body>
    <style>
        body {
            background-image: url("background.jpeg");
            background-size: cover;
            background-position: center;  
            background-repeat: no-repeat;             
            height: 100%; 
            margin: 0;  
        }

        body form {
            
            padding:20px;
/*            width: 700px;*/
            background-color:#CDFADB;
            font-family: Arial, sans-serif;
    
}

.form .container {
    max-width: 300px;
    margin: 50px auto;
    padding: 20px;
/*    background-color: #fff;*/
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form h2 {
    color: #00ab9f;
    text-align: center;
}

.form form-group {
    margin-bottom: 20px;
}

form label {
    display: block;
    margin-bottom: 5px;
    color: #333;
}

input[type="text"],
input[type="email"],
input[type="date"],
input[type="time"],
input[type="number"],
textarea,
select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

textarea {
    resize: vertical;
}

form button {
    display:block;
    height:60px;
    width:150px;
    margin: 0 auto;
    padding: 10px 20px;
    background-color: #00ab9f;
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

form button:hover {
    background-color: #008c80;
}

    </style>
</html>
