<%@ page import="com.example.watch_shop.DAO.ProductDAO" %>
<%@ page import="com.example.watch_shop.DTO.ProductDTO" %>
<%@ page import="com.example.watch_shop.DAO.AccountDAO" %>
<%@ page import="com.example.watch_shop.DTO.AccountDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <!-- Basic -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <!-- Site Metas -->
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>Watcher</title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

    <!-- fonts style -->
    <link href="https://fonts.googleapis.com/css?family=Dosis:400,500|Poppins:400,700&display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet"/>
    <!-- responsive style -->
    <link href="css/responsive.css" rel="stylesheet"/>
</head>

<body>
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
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
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
    <!-- slider section -->
    <section class=" slider_section position-relative">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <%
                    ProductDAO Productdao = new ProductDAO();
                    int ProductCount = 0;

                    for (ProductDTO dto : Productdao.GetAllProduct()
                    ) {
                        if (dto.getProductStatus() == 1) {
                            ProductCount++;
                            if (ProductCount == 1) {
                %>
                <div class="carousel-item active">
                    <div class="slider_item-box">
                        <div class="slider_item-container">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="slider_img-box">
                                            <div>
                                                <img src="<%= dto.getProductBanner()%>" alt="" class=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="slider_item-detail">
                                            <div>
                                                <h1>
                                                    <%= dto.getProductName()%>
                                                </h1>
                                                <p>
                                                    <%= dto.getProductDes()%>
                                                </p>
                                                <div class="d-flex">
                                                    <a href="hello-servlet" class="slider-btn1 mr-3">
                                                        Read More
                                                    </a>
                                                    <a href="account.jsp" class="slider-btn2">
                                                        Contact Us
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                } else {
                %>
                <div class="carousel-item">
                    <div class="slider_item-box">
                        <div class="slider_item-container">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="slider_img-box">
                                            <div>
                                                <img src="<%= dto.getProductBanner()%>" alt="" class=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="slider_item-detail">
                                            <div>
                                                <h1>
                                                    <%= dto.getProductName()%>
                                                </h1>
                                                <p>
                                                    <%= dto.getProductDes()%>
                                                </p>
                                                <div class="d-flex">
                                                    <a href="hello-servlet" class="slider-btn1 mr-3">
                                                        Read More
                                                    </a>
                                                    <a href="account.jsp" class="slider-btn2">
                                                        Contact Us
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                            }
                        }
                    }
                %>
            </div>
            <%
                if (ProductCount > 1) {
            %>
            <div class="custom_carousel-control">
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <%
                }
            %>
        </div>
    </section>
    <!-- end slider section -->
</div>
<div class="bg">

    <!-- about section -->
    <section class="about_section layout_padding">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-5 offset-md-2">
                    <div class="about_detail-box">
                        <h3 class="custom_heading ">
                            About our watch
                        </h3>
                        <p class="">
                            It is a long established fact that a reader will be distracted by the readable content of a
                            page when
                            looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal
                            distribution
                            of
                            letters, as opposed to using 'Content here, content here', making it
                        </p>
                        <div>
                            <a href="">
                                Read More
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="about_img-box">
                        <img src="images/about.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- end about section -->

    <!-- brand section -->

    <section class="brand_section layout_padding2">
        <div class="container">
            <div class="brand_heading">
                <h3 class="custom_heading">
                    Our watch brands
                </h3>
                <p class="font-weight-bold">
                    It is a long established fact that a reader will be distracted by the readable content of a page
                </p>
            </div>
        </div>
        <div class="container-fluid brand_item-container">
            <%
                for (ProductDTO dto : Productdao.GetAllProduct()
                ) {
            %>
            <div class="brand_item-box">
                <div class="brand_img-box" style="background-image: url(<%= dto.getProductImg()%>)">
                    <a href="">
                        View More
                    </a>
                </div>
                <div class="brand_detail-box">
                    <h5>
                        $<span> <%= dto.getProductPrice()%> </span>
                    </h5>
                    <h6 class="">
                        <%= dto.getProductName()%>
                    </h6>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </section>


    <!-- end brand section -->

    <!-- why section -->
    <section class="why_section layout_padding">
        <div class="container">
            <h3 class="custom_heading">
                Why choose Us
            </h3>
            <p class="font-weight-bold">
                It is a long established fact that a reader will be distracted by the readable content of a page
            </p>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="img_box">
                        <img src="images/feature-1.png" alt="">
                    </div>
                    <div class="detail_box">
                        <h5>
                            Fast Delivery
                        </h5>
                        <p>
                            variations of passages of Lorem Ipsum available, but the majority have suffered
                        </p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="img_box">
                        <img src="images/feature-2.png" alt="">
                    </div>
                    <div class="detail_box">
                        <h5>
                            Free Shiping
                        </h5>
                        <p>
                            variations of passages of Lorem Ipsum available, but the majority have suffered
                        </p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="img_box">
                        <img src="images/feature-3.png" alt="">
                    </div>
                    <div class="detail_box">
                        <h5>
                            Best Quality
                        </h5>
                        <p>
                            variations of passages of Lorem Ipsum available, but the majority have suffered
                        </p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="img_box">
                        <img src="images/feature-4.png" alt="">
                    </div>
                    <div class="detail_box">
                        <h5>
                            24x7 Customer support
                        </h5>
                        <p>
                            variations of passages of Lorem Ipsum available, but the majority have suffered
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- end why section -->
</div>

<!-- client section -->

<section class="client_section layout_padding-bottom">
    <div class="container">
        <h3 class="custom_heading">
            Members
        </h3>
        <p class="font-weight-bold">
            We are working very hard to improve the quality of the store to satisfy customers.
        </p>
    </div>
    <div class="container"></div>
    <div id="carouselExample2Controls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <%
                AccountDAO Accountdao = new AccountDAO();
                int AccountCount = 0;
                for (AccountDTO dto : Accountdao.getAllAdmin()
                ) {
                    if (dto.getAccountStatus() == 1) {
                        AccountCount++;
                        if (AccountCount == 1) {
            %>
            <div class="carousel-item active">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="detail_box">
                                <div class="img_box">
                                    <img src="<%= dto.getAccountImg()%>" alt="">
                                </div>
                                <div class="name_box">
                                    <h5>
                                        <%= dto.getAccountName()%>
                                    </h5>
                                    <h6>
                                        <%= dto.getAccountEmail()%>
                                    </h6>
                                </div>
                            </div>
                            <div class="detail_text">
                                <p>
                                    <%= dto.getAccountDes()%>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
            } else {
            %>
            <div class="carousel-item">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="detail_box">
                                <div class="img_box">
                                    <img src="<%= dto.getAccountImg()%>" alt="">
                                </div>
                                <div class="name_box">
                                    <h5>
                                        <%= dto.getAccountName()%>
                                    </h5>
                                    <h6>
                                        <%= dto.getAccountEmail()%>
                                    </h6>
                                </div>
                            </div>
                            <div class="detail_text">
                                <p>
                                    <%= dto.getAccountDes()%>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                        }
                    }
                }
            %>
        </div>
        <%
            if (AccountCount > 1) {
        %>
        <a class="carousel-control-prev" href="#carouselExample2Controls" role="button" data-slide="prev">
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExample2Controls" role="button" data-slide="next">
            <span class="sr-only">Next</span>
        </a>
        <%
            }
        %>
    </div>
</section>


<!-- end client section -->


<!-- footer section -->

<!-- footer section -->

<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>

</html>