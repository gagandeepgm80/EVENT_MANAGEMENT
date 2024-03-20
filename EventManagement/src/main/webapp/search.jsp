<%-- 
    Document   : Bookings.jsp
    Created on : 02-Feb-2024, 4:30:37 pm
    Author     : shakthisravanth
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Registration"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bookings..</title>
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
                                    
                                    
 <center>
        <br><br>
        <form action="search" method="POST">
            <div class="form-group col-md-4">
                <label >Events.</label>
                <input type="text" name="id" class="form-control" >
            </div>
            <button type="submit" class="btn btn-primary" name="submit">Search</button>
        </form>
       
        <div class="container ">
            <div class="jumbotron">
			<% Registration reg = new Registration(session);
                            ArrayList<User> mydata = reg.getUserinfo(request.getParameter("id"));
                            if(mydata.isEmpty()){%>
                            	<h2 style="color:red">Record Not Exist<h2>
                           <% }
                            else{
								 Iterator<User> itr = mydata.iterator();
                            	while (itr.hasNext()) {
                                User s = itr.next();
                        	%>
                        	<table class="table">
                        		 <thead>
                        			<tr style="background-color: lightblue;">
                   							 <br>
                  					 <th>Slno</th>
                				     <th>Name</th>
                  				     <th>Email</th>
                                     <th>Phone</th>
                                     <th>Date</th>
								   </tr>
                 			   </thead>
                 		   <tbody id="table">
                        
                        <tr>
                            <td><%=s.getId()%></td>
                            <td><%=s.getName()%></td>
                            <td><%=s.getemail()%></td>
                            <td><%=s.getphone()%></td>
                            <td><%=s.getdate()%></td>
                        </tr>
                        <%}%> 
                    </tbody>
                </table>
                <%}%> 
			
            </div>
        </div>
        
    </center>
                                    
    </body>
    <style>
            
        </style>
</html>
