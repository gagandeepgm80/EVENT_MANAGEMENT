<%-- 
    Document   : Booking.jsp
    Created on : 02-Feb-2024, 5:12:28 pm
    Author     : shakthisravanth
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page import="model.Registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users..Page</title>
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
        <section>
            <center>
                <br>
                <font color="#00ab9f" size="4">
                <h1> Users </h1>
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
                            <th>Slno</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Date</th>
                            <th>Delete</th>
                            </tr>
                            </thead>
                            <tbody id="table">
                                <% 
                                Registration reg = new Registration(session);
                                ArrayList<User> mydata = reg.getUserDetails();

                                Iterator<User> itr = mydata.iterator();
                                while (itr.hasNext()) {
                                User s = itr.next();
                                %>
                                <tr>
                                    <td><%=s.getId()%></td>
                                    <td><%=s.getName()%></td>
                                    <td><%=s.getemail()%></td>
                                    <td><%=s.getphone()%></td>
                                    <td><%=s.getdate()%></td>
                                    <td>
                                        <form action="delete" method="POST">
                                            <input type="hidden" name="userid" value="<%=s.getId()%>"/>
                                            <input type="submit" class="btn btn-danger" value="Delete" />
                                        </form>
                                    </td>
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
