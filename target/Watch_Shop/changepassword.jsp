<%@ page import="com.example.watch_shop.DTO.AccountDTO" %>
<%@ page import="com.example.watch_shop.DAO.AccountDAO" %><%--
<%--
  Created by IntelliJ IDEA.
  User: gbuid
  Date: 22/01/2022
  Time: 2:07 CH
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <!-- Basic -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Site Metas -->
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Watcher</title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

    <!-- fonts style -->
    <link href="https://fonts.googleapis.com/css?family=Dosis:400,500|Poppins:400,700&display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet" />
    <!-- responsive style -->
    <link href="css/responsive.css" rel="stylesheet" />
</head>

<body class="sub_page">
<div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
        <div class="container-fluid">
            <nav class="navbar navbar-expand-lg custom_nav-container pt-3">
                <a class="navbar-brand" href="index.jsp">
            <span>
              Watcher
            </span>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
                        <ul class="navbar-nav  ">
                            <li class="nav-item active">
                                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about.jsp"> About </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product.jsp"> Our Watches </a>
                            </li>

                            <% int sID;
                                try {
                                    sID = Integer.parseInt(session.getAttribute("id").toString());
                                } catch (Exception e) {
                                    sID = -1;
                                }
                                if (sID == -1 || sID == 0) { %>
                            <li class="nav-item">
                                <a class="nav-link" href="LoginServlet">Login</a>
                            </li>
                            <%
                            } else {
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="account.jsp">Account</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="LogoutServlet">Logout</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="cart.jsp">Cart</a>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                        <form class="form-inline my-2 my-lg-0 ml-0 ml-lg-4 mb-3 mb-lg-0">
                            <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
                        </form>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <!-- end header section -->

</div>


<!-- contact section -->

<section class="contact_section layout_padding">
    <h2 class="custom_heading text-center">
      CHANGE PASSWORD
    </h2>
    <div class="container mt-5 pt-5">
        <div class="container" style="width: 500px; height: 300px;">
        <form action="UpdateAccountServlet" method="post" name="myForm" onsubmit = "return(validate())";>
            <div>
                <input name="password" type="password" placeholder="NEW PASSWORD" required>
            </div>
            <div>
                <input name="re_password" type="password" placeholder="CONFIRM PASSWORD" required>
            </div>
            <div class="d-flex justify-content-center mt-5 pt-5">
                <button type="submit" name="change">
                  Change
                </button>
            </div>
        </form>
        </div>

    </div>
</section>

<!-- end contact section -->

<!-- info section -->
<section class="info_section layout_padding">
    <div class="container">
        <div class="info_items">
            <a href="">
                <div class="item ">
                    <div class="img-box box-1">
                        <img src="" alt="">
                    </div>
                    <div class="detail-box">
                        <p>
                            Lorem Ipsum is simply dummy text
                        </p>
                    </div>
                </div>
            </a>
            <a href="">
                <div class="item ">
                    <div class="img-box box-2">
                        <img src="" alt="">
                    </div>
                    <div class="detail-box">
                        <p>
                            +84 123456789
                        </p>
                    </div>
                </div>
            </a>
            <a href="">
                <div class="item ">
                    <div class="img-box box-3">
                        <img src="" alt="">
                    </div>
                    <div class="detail-box">
                        <p>
                            WatchShopWP@gmail.com
                        </p>
                    </div>
                </div>
            </a>
        </div>
    </div>
</section>



<!-- end info_section -->

<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script>
    function validate() {
        if( document.myForm.password.value != document.myForm.re_password.value  ) {
            alert( "Confirm Password is not correct!" );
            return false;
        }
        return(true);
    }
</script>
</body>

</html>
