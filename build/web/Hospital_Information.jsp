<%-- 
    Document   : Hospital_Information2
    Created on : Jun 23, 2023, 11:55:48 AM
    Author     : HUNTER
--%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

    <!-- 02_05_gallery.html  [XR&CO'2014], Tue, 22 Oct 2019 11:55:03 GMT -->

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>02_05_gallery</title>
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
        <link rel="stylesheet" href="Booking/plugin/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="Booking/plugin/bootstrap/css/bootstrap-theme.css">
        <link rel="stylesheet" href="Booking/fonts/poppins/poppins.css">
        <link rel="stylesheet"
              href="Booking/plugin/fonts/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="Booking/plugin/jquery-ui/jquery-ui.min.css">
        <link rel="stylesheet" href="Booking/plugin/process-bar/tox-progress.css">
        <link rel="stylesheet" href="Booking/plugin/owl-carouse/owl.carousel.min.css">
        <link rel="stylesheet"
              href="plugin/owl-carouse/owl.theme.default.min.css">
        <link rel="stylesheet" href="Booking/plugin/animsition/css/animate.css">
        <link rel="stylesheet" href="Booking/plugin/jquery-ui/jquery-ui.min.css">
        <link rel="stylesheet" href="Booking/plugin/mediaelement/mediaelementplayer.css">
        <link rel="stylesheet"
              href="Booking/plugin/datetimepicker/bootstrap-datepicker3.css">
        <link rel="stylesheet"
              href="Booking/plugin/datetimepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="Booking/plugin/lightgallery/lightgallery.css">
        <link rel="stylesheet" href="Booking/css/style.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            /* Custom CSS */
            .product-table {
                width: 100%;
            }

            .product-table th, .product-table td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            .product-table th {
                background-color: #f2f2f2;
            }

            .search-box {
                position: absolute;
                top: 0;
                right: 0;
                margin: 10px;
                display: flex;
            }

            .search-box .form-control {
                width: 200px;
                margin-right: 5px;
            }

            .search-box .btn {
                padding: 8px;
            }
        </style>

        <!-- Thêm liên kết Bootstrap CSS vào phần head của trang -->
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>

    <body>
        <%@include file="Booking/header.jsp"%>

        <div id="main-content" class="site-main-content">
            <section class="site-content-area">

                <div class="uni-banner-default uni-background-1">
                    <div class="container">
                        <!-- Page title -->
                        <div class="page-title">
                            <div class="page-title-inner">
                                <h1>List Hospital</h1>
                            </div>
                        </div>
                        <!-- End page title -->

                        <!-- Breadcrumbs -->
<!--                        <ul class="breadcrumbs">
                            <li><a href="#">home</a></li>
                            <li><a href="#">page</a></li>
                            <li><a href="#">Vaccine Table</a></li>
                        </ul>-->
                        <!-- End breadcrumbs -->
                    </div>
                </div>

                <!-- HTML code and product table -->
                <div class="uni-gallery-body">
                    <div class="container">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered">
                                <thead class="thead-dark">
                                    <tr>
                       
                                        <th>Name Hospital</th>
                                        <th>Address</th>
                                        <th>Email</th>
                                        <th>Hotline</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${ListHospital}" var = "o">     
                      
                                        <tr>
                                 
                                                <td>${o.name}</td>
                                                <td>${o.address}</td>
                                                 <td>${o.email}</td>
                                                <td>${o.hotline}</td>
                                           
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
        </div>

    </section>
</div>

<%@include file="Booking/footer.jsp"%>
</div>
</div>
<script src="plugin/jquery/jquery-2.0.2.min.js"></script>
<script src="plugin/jquery-ui/jquery-ui.min.js"></script>
<script src="plugin/bootstrap/js/bootstrap.js"></script>
<script src="plugin/process-bar/tox-progress.js"></script>
<script src="plugin/waypoint/jquery.waypoints.min.js"></script>
<script src="plugin/counterup/jquery.counterup.min.js"></script>
<script src="plugin/owl-carouse/owl.carousel.min.js"></script>
<script src="plugin/jquery-ui/jquery-ui.min.js"></script>
<script src="plugin/mediaelement/mediaelement-and-player.js"></script>
<script src="plugin/masonry/masonry.pkgd.min.js"></script>
<script src="plugin/datetimepicker/moment.min.js"></script>
<script src="plugin/datetimepicker/bootstrap-datepicker.min.js"></script>
<script src="plugin/datetimepicker/bootstrap-datepicker.tr.min.js"></script>
<script src="plugin/datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="plugin/datetimepicker/bootstrap-datetimepicker.fr.js"></script>

<script src="plugin/lightgallery/picturefill.min.js"></script>
<script src="plugin/lightgallery/lightgallery.js"></script>
<script src="plugin/lightgallery/lg-pager.js"></script>
<script src="plugin/lightgallery/lg-autoplay.js"></script>
<script src="plugin/lightgallery/lg-fullscreen.js"></script>
<script src="plugin/lightgallery/lg-zoom.js"></script>
<script src="plugin/lightgallery/lg-hash.js"></script>
<script src="plugin/lightgallery/lg-share.js"></script>
<script src="plugin/sticky/jquery.sticky.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="js/main.js"></script>
</body>

</html>

