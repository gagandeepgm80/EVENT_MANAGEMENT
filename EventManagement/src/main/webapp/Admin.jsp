<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin page</title>
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
<!--	 <section class="options">
                    <a href="User.jsp" class="book-button">Users</a> 
                    <a href="search.jsp" class="book-button">Search</a>
                    <a href="Booking.jsp" class="book-button">Bookings</a> 
                    <a href="History.jsp" class="book-button">History</a> 
                    
                     
        </section>-->
<!--        <section class="options">
                    <a href="Booking.jsp" class="book-button">Bookings</a> 
                    <a href="search.jsp" class="book-button">Search</a> 
        </section>-->
	<jsp:include page="AdminSecondaryNavbar.jsp" /> 
       
</body>

</html>