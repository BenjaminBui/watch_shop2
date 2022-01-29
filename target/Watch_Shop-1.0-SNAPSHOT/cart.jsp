<%--
  Created by IntelliJ IDEA.
  User: gbuid
  Date: 25/01/2022
  Time: 3:08 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.watch_shop.DAO.ProductDAO" %>
<%@ page import="com.example.watch_shop.DTO.ProductDTO" %>
<%@ page import="com.example.watch_shop.DAO.AccountDAO" %>
<%@ page import="com.example.watch_shop.DAO.CartDAO" %>
<%@ page import="com.example.watch_shop.DTO.CartDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <style>
        .button-35 {
            width: 40%;
            align-items: center;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: transparent 0 0 0 3px, rgba(18, 18, 18, .1) 0 6px 20px;
            box-sizing: border-box;
            color: #121212;
            cursor: pointer;
            display: inline-flex;
            flex: 1 1 auto;
            font-family: Inter, sans-serif;
            font-size: 1.2rem;
            font-weight: 700;
            justify-content: center;
            line-height: 1;
            margin: 0;
            outline: none;
            padding: 1rem 1.2rem;
            text-align: center;
            text-decoration: none;
            transition: box-shadow .2s, -webkit-box-shadow .2s;
            white-space: nowrap;
            border: 0;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
        }

        .button-35:hover {
            box-shadow: #121212 0 0 0 3px, transparent 0 0 0 0;
        }
    </style>
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
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
                        <ul class="navbar-nav  ">
                            <li class="nav-item ">
                                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="about.jsp"> About </a>
                            </li>
                            <li class="nav-item active">
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
<div class="bg">


    <!-- brand section -->

    <section class="brand_section layout_padding2">
        <div class="container">
            <div class="brand_heading">
                <h3 class="custom_heading">
                    Cart
                </h3>
            </div>
        </div>
        <div class="container-fluid brand_item-container">
            <%
                CartDAO dao = new CartDAO();
                int subTotal = 0;
                boolean checkCartNull = false;
                if (dao.getItemByID(Integer.parseInt(session.getAttribute("id").toString())).isEmpty()) {
                    checkCartNull = true;
                }
                if (checkCartNull) {
            %>
            <h1>Nothing in your cart</h1>
            <%
            } else {
                for (ProductDTO dto : dao.getItemByID(Integer.parseInt(session.getAttribute("id").toString()))
                ) {
                    subTotal += subTotal + (dto.getProductPrice() * dao.getQuanity(dto.getProductID(), Integer.parseInt(session.getAttribute("id").toString())));
            %>
            <div class="brand_item-box">
                <div class="brand_img-box" style="background-image: url(<%= dto.getProductImg()%>)">
                    <a href="QuanityUpdateServlet?ProductID=<%= dto.getProductID()%>&opr=2">
                        -
                    </a>
                    <a href="" readonly>
                        <%= dao.getQuanity(dto.getProductID(), Integer.parseInt(session.getAttribute("id").toString()))%>
                    </a>
                    <a href="QuanityUpdateServlet?ProductID=<%= dto.getProductID()%>&opr=1">
                        +
                    </a>
                </div>
                <div class="brand_detail-box">
                    <h5>
                        $<span> <%= dto.getProductPrice() * dao.getQuanity(dto.getProductID(), Integer.parseInt(session.getAttribute("id").toString()))%> </span>
                    </h5>
                    <h6 class="">
                        <%= dto.getProductName()%>
                    </h6>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>

    </section>


    <!-- end brand section -->

</div>

<!-- info section -->
<%
    if (!checkCartNull) {
%>
<section class="info_section layout_padding">
    <div class="container" style="text-align: center">
        <form action="QuanityUpdateServlet" method="post">
            <div class="detail-box" style="font-weight: bold; text-align: center;">
                <p>
                    Sub Total
                </p>
            </div>
            <div class="item ">
                <p style="margin: auto;padding-bottom: 12px; text-align: center;">$<%= subTotal%>
                </p>
            </div>
            <button class="button-35" role="button" type="submit">
                Checkout
            </button>
        </form>
    </div>
</section>
<%
    }
%>

<!-- end info_section -->

<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>

</html>