<%-- 
    Document   : UserBookingView
    Created on : 04-Mar-2024, 6:49:18 pm
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
        <title>Bookings Page</title>
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
                                        <span style="color: #00ab9f;"><%=session.getAttribute("uname")%></span> <%}%> can access and cancel Events... </h2></li>

                            </ul>

                        </div>

                        <div class="col-sm-2 d-none d-lg-block appoint">

                            <a class="btn btn-success" href="register?logout=yes">Logout</a>  
                        </div>

                    </div>

                </div>
            </div>
        </header><jsp:include page="SecondaryNavbar.jsp" /> 
        <section>
            <center>
                <br>
                <font color="#00ab9f">
                <h1> Bookings by <%=session.getAttribute("uname")%> </h1>
                </font>
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
                            <th></th>
                            <th>Event</th>
                            <th>Atendees</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Delete</th>
                            <th>Status</th>
                            
                            </tr>
                            </thead>
                            <tbody id="table">
                                <% 
                                Registration reg = new Registration(session);
                                 String mail = (String) session.getAttribute("email");
                                ArrayList<Events> mydata = reg.getUserBookingDetails(mail);

                                Iterator<Events> itr = mydata.iterator();
                                while (itr.hasNext()) {
                                Events s = itr.next();
                                %>
                                <tr>
                                    <td></td>
                                    <td><%=s.getEvent()%></td>
                                    <td><%=s.getCount()%></td>
                                    <td><%=s.getDate()%></td>
                                    <td><%=s.getTime()%></td>
                                    <td>
                                        <form action="UserdeleteBooking" method="POST">
                                            <input type="hidden" name="userid" value="<%=s.getId()%>"/>
                                            <input type="submit" class="btn btn-danger" value="Delete" />
                                        </form>
                                    </td>
                                    <td>Pending</td>
<!--                                    <td>
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

            <script>
                $(document).ready(function () {
                    $("#search").on("keyup", function () {
                        var value = $(this).val().toLowerCase();
                        //alert(value);
                        $("#table tr").filter(function () {
                            $(this).toggle($(this).text().toLowerCase().indexOf(value) > 0)
                            //alert(this);
                        });
                    });
                });
            </script>
        </section>
    </body>
</html>
