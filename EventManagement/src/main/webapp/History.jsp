<%-- 
    Document   : History
    Created on : 12-Feb-2024, 3:15:43 pm
    Author     : shakthisravanth
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Events"%>
<%@page import="model.Registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                             <li><h2> Only <% if (session.getAttribute("uname") != null) {%>
                                
                                    <!-- <img src="slogo.jpg" alt="User Image" style="width: 20px; height: 20px; margin-right: 5px;"> -->
                                    <span style="color: #00ab9f;"><%=session.getAttribute("uname")%></span> <%}%> can access and Update this.. </h2></li>
			
                        </ul>
                       
                    </div>
						
                    <div class="col-sm-2 d-none d-lg-block appoint">
                         
                        <a class="btn btn-success" href="register?logout=yes">Logout</a>  
                    </div>
                    
                </div>
    
            </div>
        </div>
                                   
    </header>
                                    <jsp:include page="AdminSecondaryNavbar.jsp" /> 
    <center> <h1> Events History..</h1> 
<!--    Under development
    <br><br><br>
    <div>
        <div class="spinner-border text-primary" role="status">
  <span class="sr-only">Loading...</span>
</div>
<div class="spinner-border text-secondary" role="status">
  <span class="sr-only">Loading...</span>
</div>
<div class="spinner-border text-success" role="status">
  <span class="sr-only">Loading...</span>
</div>
<div class="spinner-border text-danger" role="status">
  <span class="sr-only">Loading...</span>
</div>
<div class="spinner-border text-warning" role="status">
  <span class="sr-only">Loading...</span>
</div>
<div class="spinner-border text-info" role="status">
  <span class="sr-only">Loading...</span>
</div>
<div class="spinner-border text-light" role="status">
  <span class="sr-only">Loading...</span>
</div>
<div class="spinner-border text-dark" role="status">
  <span class="sr-only">Loading...</span>
</div>
    </div>
    
    
    
    
    <div>
        <div class="spinner-grow text-primary" role="status">
  <span class="sr-only">Loading...</span>
</div>
<div class="spinner-grow text-secondary" role="status">
  <span class="sr-only">Loading...</span>
</div>
<div class="spinner-grow text-success" role="status">
  <span class="sr-only">Loading...</span>
</div>
<div class="spinner-grow text-danger" role="status">
  <span class="sr-only">Loading...</span>
</div>
<div class="spinner-grow text-warning" role="status">
  <span class="sr-only">Loading...</span>
</div>
<div class="spinner-grow text-info" role="status">
  <span class="sr-only">Loading...</span>
</div>
<div class="spinner-grow text-light" role="status">
  <span class="sr-only">Loading...</span>
</div>
<div class="spinner-grow text-dark" role="status">
  <span class="sr-only">Loading...</span>
</div>-->
    </div>
     <% if (request.getAttribute("status") != null) {%>
                <h1 class="errmsg"> <%= request.getAttribute("status")%></h1>
                <%}%>
                <div class="container ">
                    <div class="jumbotron">
                        <input class="form-control" id="search" type="text" placeholder="Search..">
                        <table class="table">
                            <thead>
                                <tr style="background-color: lightblue;">
                            <br>
                            <th>ID</th>
                            <th>Email</th>
                            <th>Event</th>
                            <th>Atendees</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Place</th>
<!--                            <th>Delete</th>
                            <th>Finished</th>-->
                            </tr>
                            </thead>
                            <tbody id="table">
                                <% 
                                Registration reg = new Registration(session);
                                ArrayList<Events> mydata = reg.getBookingHistoryDetails();

                                Iterator<Events> itr = mydata.iterator();
                                while (itr.hasNext()) {
                                Events s = itr.next();
                                %>
                                <tr>
                                    <td><%=s.getId()%></td>
                                    <td><%=s.getEmail()%></td>
                                    <td><%=s.getEvent()%></td>
                                    <td><%=s.getCount()%></td>
                                    <td><%=s.getDate()%></td>
                                    <td><%=s.getTime()%></td>
                                    <td><%=s.getPlace()%></td>
<!--                                    <td>
                                        <form action="deleteBooking" method="POST">
                                            <input type="hidden" name="userid" value="<%=s.getId()%>"/>
                                            <input type="submit" class="btn btn-danger" value="Delete" />
                                        </form>
                                    </td>
                                    <td>
                                        <form action="eventCompleted" method="POST">
                                            <input type="hidden" name="userid" value="<%=s.getId()%>"/>
                                            <input type="submit" class="btn btn-success" value="Done" />
                                        </form>
                                    </td>-->

                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
    </center>
    </body>
</html>
