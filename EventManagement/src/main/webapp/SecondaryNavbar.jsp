<%-- 
    Document   : SecondaryNavbar
    Created on : 04-Mar-2024, 6:07:18 pm
    Author     : shakthisravanth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
  
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
 
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
         <li class="nav-item">
        <a class="nav-link" href="Home.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="UserBookingView.jsp">Bookings</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">/</a>
      </li>
     <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Profile
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#" id="name">Name: </a>
          <a class="dropdown-item" href="#" id="phone">Phone: </a>
          <a class="dropdown-item" href="#" id="email">Email: </a>
          </a>
        </div>
      </li>
    </ul>
  </div>
</nav>

<!-- Bootstrap JS (optional, for dropdowns, toggles, etc.) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
  
  const userData = {
    name: "<%=session.getAttribute("uname")%>",
    phone: "<%=session.getAttribute("phone")%>",
    email: "<%=session.getAttribute("email")%>"
  };

  // Populate dropdown with backend data
  document.getElementById('name').innerText += userData.name;
  document.getElementById('phone').innerText += userData.phone;
  document.getElementById('email').innerText += userData.email;
</script>

</body>
</html>
