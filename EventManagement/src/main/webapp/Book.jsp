<%-- 
    Document   : Book
    Created on : 21-Feb-2024, 6:42:28 pm
    Author     : shakthisravanth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
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
                                       onMouseOut="this.style.color = 'black'"></a><h2> You are one step ahead to book event <% if (session.getAttribute("uname") != null) {%>
                                        <span style="color: #00ab9f;"><%=session.getAttribute("uname")%></span> <%}%> </h2></li>

                            </ul>

                        </div>

                        <div class="col-sm-2 d-none d-lg-block appoint">

                            <a class="btn btn-success" href="register?logout=yes">Logout</a>  
                        </div>

                    </div>

                </div>
            </div>
        </header>
                                        
                                        <!<!-- Section starts here -->                    
                                         
                <div class="container fasak">
   
    <div class="image-side">
      <div class="image-card">
        <img src="https://images.pexels.com/photos/796606/pexels-photo-796606.jpeg?auto=compress&cs=tinysrgb&w=800" alt="Image 1">
        <h3>Image Title 1</h3>
        <p>Description of Image 1.</p>
      </div>
      <div class="image-card">
        <img src="https://images.pexels.com/photos/1857157/pexels-photo-1857157.jpeg?auto=compress&cs=tinysrgb&w=800" alt="Image 2">
        <h3>Image Title 2</h3>
        <p>Description of Image 2.</p>
      </div>
      <div class="image-card">
        <img src="https://images.pexels.com/photos/1729808/pexels-photo-1729808.jpeg?auto=compress&cs=tinysrgb&w=800" alt="Image 3">
        <h3>Image Title 3</h3>
        <p>Description of Image 3.</p>
      </div>
    </div>
                     <div class="payment-side">
      <div class="payment-card">
        <h2>Payment</h2>
        <p>Lorem ipsum dolor sit amet, consectetur l adipiscing elit. Sed do eiusmod tempor incididunt ut labore et doloreipsum dolor sit amet, consectetur l adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        <p class="price">₹99.99</p>
        <button>Pay Now</button>
      </div>
    </div>
  </div>                        
    </body>
    <style>
        /* styles.css */
.fasak {
  display: flex;
}

.payment-side, .image-side {
  flex: 1;
  padding: 20px;
}

.payment-card, .image-card {
  border: 1px solid #ccc;
  border-radius: 10px;
  padding: 20px;
  margin-bottom: 20px;
}

.payment-card button {
  padding: 10px 20px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.payment-card button:hover {
  background-color: #0056b3;
}

.image-card img {
  width: 100%;
  height: auto;
  border-radius: 5px;
  margin-bottom: 10px;
}

.image-card h3 {
  margin-top: 0;
}

.image-card p {
  margin-bottom: 0;
}
.price {
  color: red;
  font-size: 30px;
}
    </style>
    
</html>
