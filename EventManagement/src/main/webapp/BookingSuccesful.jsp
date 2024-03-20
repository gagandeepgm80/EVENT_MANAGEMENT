<%-- 
    Document   : BookingSuccesful.jsp
    Created on : 07-Feb-2024, 8:01:28 pm
    Author     : shakthisravanth
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Succesfully Booked page</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/fontawsom-all.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
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
                                <li><a href="#"onMouseOver="this.style.color = '#00ab9f'"
                                       onMouseOut="this.style.color = 'black'"></a><h2> Welcome <% if (session.getAttribute("uname") != null) {%>

                                        <!-- <img src="slogo.jpg" alt="User Image" style="width: 20px; height: 20px; margin-right: 5px;"> -->
                                        <span style="color: #00ab9f;"><%=session.getAttribute("uname")%></span> <%}%> select and book your Event  </h2></li>

                            </ul>

                        </div>

                        <div class="col-sm-2 d-none d-lg-block appoint">

                            <a class="btn btn-success" href="register?logout=yes">Logout</a>  
                        </div>

                    </div>

                </div>
            </div>
        </header>

    <Center> <h1>Booking Succesful</h1> </Center> 

    </body>

    

</html>