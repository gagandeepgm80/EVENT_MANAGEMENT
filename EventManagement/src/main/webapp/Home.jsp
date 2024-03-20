<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Home page</title>
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
                        <jsp:include page="SecondaryNavbar.jsp" />                
        <div class="event-selection events">

            <div class="bookng-cards">
                <div class="event-card">
                    <div class="event-image" style="background-image: url('gallery/Birthday.jpg');"></div>
                    <div class="event-details">
                        <div class="event-title">Birthday</div>
                        <div class="event-description">Description</div>
                    </div>
                    <a href="practical.jsp?event_category=Birthday" class="book-button">Select</a>
                </div>

                <div class="event-card">
                    <div class="event-image" style="background-image: url('gallery/wedding.jpeg');"></div>
                    <div class="event-details">
                        <div class="event-title">Wedding</div>
                        <div class="event-description">Description</div>
                    </div>
                    <a href="practical.jsp?event_category=Marriage" class="book-button">Select</a>
                </div>

                <div class="event-card">
                    <div class="event-image" style="background-image: url('gallery/Garba.jpeg');"></div>
                    <div class="event-details">
                        <div class="event-title">Garba Nights</div>
                        <div class="event-description">Description</div>
                    </div>
                    <a href="birthday.jsp" class="book-button">Select</a>
                </div>

                <div class="event-card">
                    <div class="event-image" style="background-image: url('gallery/concert.jpg');"></div>
                    <div class="event-details">
                        <div class="event-title">Concert</div>
                        <div class="event-description">Description</div>
                    </div>
                    <a href="#" class="book-button">Select</a>
                </div>

                <div class="event-card">
                    <div class="event-image" style="background-image: url('gallery/corporate.jpg');"></div>
                    <div class="event-details">
                        <div class="event-title">Corporate events</div>
                        <div class="event-description">Description</div>
                    </div>
                    <a href="#" class="book-button">Select</a>
                </div>

                <div class="event-card">
                    <div class="event-image" style="background-image: url('gallery/naming.jpeg');"></div>
                    <div class="event-details">
                        <div class="event-title">Naming ceromony</div>
                        <div class="event-description">Description</div>
                    </div>
                    <a href="#" class="book-button">Select</a>
                </div>

                <div class="event-card">
                    <div class="event-image" style="background-image: url('gallery/holi.jpg');"></div>
                    <div class="event-details">
                        <div class="event-title">Holi</div>
                        <div class="event-description">Description</div>
                    </div>
                    <a href="#" class="book-button">Select</a>
                </div>

                <div class="event-card">
                    <div class="event-image" style="background-image: url('gallery/Dinner4.jpg');"></div>
                    <div class="event-details">
                        <div class="event-title">Feast</div>
                        <div class="event-description">Description</div>
                    </div>
                    <a href="#" class="book-button">Select</a>
                </div>


                <!-- Add more event cards as needed -->
            </div>
        </div>

    </body>

    <style>
        body.events{
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 10px 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .bookng-cards{
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            grid-gap: 20px;
            padding: 20px;
        }
        .event-selection {
            background-image: url(background.jpeg);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            max-width: 100%;
            width: 100%;
            padding-top: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            box-sizing: border-box;
            align-items: center;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .event-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 20px;
            overflow: hidden;
            cursor: pointer;
            transition: box-shadow 0.3s;
        }

        .event-card:hover {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            transform: scale(1.05);
        }

        .event-image {
            width: 100%;
            height: 200px;
            background-size: cover;
            background-position: center;
        }

        .event-details {
            background-color: #fff;
            padding: 10px;
        }

        .event-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }

        .event-description {
            font-size: 14px;
            color: #666;
        }

        .book-button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #00ab9f;
            color: #fff;
            text-align: center;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .book-button:hover {
            background-color: #4fe8dd;
            <!--0056b3-->
        }
    </style>

</html>