<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>User Login</title>
        <script type = "text/javascript" src ="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryvalidate/1.19.1/jquery.validate.min.js"></script>

        <link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="sms/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="sms/vendor/fontawesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="sms/kushi/assets/css/styles.css">		


        <script>

//            var status = "<%= request.getAttribute("status") %>";
//            if (status != null) {
//                alert(status);
//            }

        </script>

        <script>
            jQuery.validator.addMethod("checkemail", function (value, element) {
                return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
            });
            jQuery(document).ready(function ($) {
                $("#login").validate({
                    rules: {
                        email: {
                            required: true,
                            checkemail: true
                        },
                        pw: {
                            required: true,
                            minlength: 6
                        },
                    },
                    messages: {
                        email: {
                            required: "Please enter the email.",
                        },
                        pw: {
                            required: "Please enter the password.",
                            minlength: "Please enter the password greater than or equal to 6.",
                        },
                    }
                })
            })
        </script>
        <style>
            .error{
                color:red;
            }
            .button{
                padding: 5px;
                width: 6%;
                background: cornflowerblue;
                color: white;
            }
            #msg
            {

                color:black;
                /* border: 1px solid green; */
                width:24%;
                font-weight: bold;
                font-size: 25px;
                padding: 5px;
            }
            td input{
                display:block;
            }
        </style>
    </head>
    <body class="login"style="padding: 80px 0; ">
        <div class="row">
            <div class="main-login col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
                <div class="logo margin-top-30">

                </div>
                <center><h2><a href="index.jsp" >Happy</a> Event Management</h2></center>
                <div class="box-login" >
                    <form class="form-login" action="register" id="login" method="post">
                        					<center><% if (request.getAttribute("status") != null) {%>
                                                                <div id="msg"> <h2><%= request.getAttribute("status")%></h2></div><%}%></center>
                        <fieldset style="font-size:   25px;">
                            <legend style="font-size: 25px;">
                                Sign in to your account
                            </legend>
                            <p>

                                <span style="color:red;"></span>

                            </p>
                            <div class="form-group">
                                <span class="input-icon">
                                    <input type="text" class="form-control" name="email" placeholder="Username">
                                    <i class="fa fa-user"></i> </span>
                            </div>
                            <div class="form-group form-actions">
                                <span class="input-icon">
                                    <input type="password" class="form-control password" name="pw" placeholder="Password">
                                    <i class="fa fa-lock"></i>
                                </span><br>
                                <center><a href="forgot.jsp"onMouseOver="this.style.color = '#00ab9f'"onMouseOut="this.style.color = 'Red'">
                                        <h4>Forgot Password ?</h4>
                                    </a></center>
                            </div>
                            <div class="form-actions">
                                <input type="submit" class="btn btn-primary pull-right" value="Login" name="login">
                                Login <i class="fa fa-arrow-circle-right"></i>
                                </input>

                            </div>


                        </fieldset>
                    </form>

                    <div class="copyright">
                        <a href="Signup.jsp"><span class="text-bold text-uppercase"> SignUp</span></a>
                    </div>

                </div>

            </div>
        </div>


    </body>
    <style>
        .box-login {
            padding: 20px 0;
            font-size: 20px;
        }

        body {
            background-image: url("background.jpeg");
            background-size: cover;
            /* Adjust the background size to cover the entire body */
            background-position: center; /* Center the background image */
            background-repeat: no-repeat;
            /* Prevent the background image from repeating */
            height: 100vh; /* Set the body height to 100% of the viewport height */
            margin: 0; /* Remove default body margin */
        }

        #msg {
            height: 60px;
            width: 200px;
        }

        h1 {
            color: hotpink;
        }

        .error{
            color: Red;
        }

        input {
            display: block;
        }

        td {
            font-size: 20px;
            padding: 10px;
        }

        input {
            font-size: 20px;
            width: 250px;
            height: 30px;
            border-radius: 10px;
        }
    </style>
    <!-- end: BODY -->
</html>