<%@page import="model.Hospital"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:useBean id ="h" class="dal.HospitalDAO" scope ="session"></jsp:useBean>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <title>Document</title>


            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
            <!-- Nạp các tệp JavaScript của jQuery, Popper.js và Bootstrap -->
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        </head>

        <style>
            body {
                padding-top: 70px; /* Khoảng cách giữa header và nội dung trang */
            }
            .fixed-top {
                position: fixed;
                top: 0;
                width: 100%;
            }

            td, th {
                padding: 0;
                width: 100px;
            }

            .editprofile .modal-body {
                padding-bottom: 0px;
                padding-left: 0px;
                padding-right: 0px;

            }
            .editprofile .modal-body .container.row {
                padding-left: 35px;
            }



            .editprofile .modal-footer{
                margin-top: 25px
            }





            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                margin: 30px 0;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }





            /* Modal styles */

            /*            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                            padding: 20px 30px;
                        }*/
            .modal .modal-content {
                border-radius: 3px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }
            .modal form label {
                font-weight: normal;
            }


            /*vaccine*/
            /* Tùy chỉnh độ rộng của cột "Detail Vaccine" */
            .detail-column {
                width: 30%;
            }

            /* Ẩn nội dung dài */
            .detail-content.collapsed {
                height: 50px; /* Chiều cao khởi tạo */
                overflow: hidden;
            }

            /* Hiển thị nút "Hiển thị" và "Ẩn" */
            .toggle-button {
                cursor: pointer;
                color: blue;
                text-decoration: underline;
            }












        </style>


        <body>

        <c:set var="page" value="${param.page}" scope="session"/>
        <c:if test="${page<=0}">
            <c:set var="page" value="1" scope="session"/>
        </c:if>
        <c:if test="${page==null}">
            <c:set var="page" value="1" scope="session"/>
        </c:if>
        <c:if test="${not empty page}">
            <c:set var="page" value="${page}" scope="session"/>
        </c:if>
        <fmt:formatNumber type="number" var="maxpage" value="${Math.ceil(h.allHospital.size()/2)}">

        </fmt:formatNumber>
        <c:if test="${page>=maxpage}">
            <c:set var="page" value="${maxpage}" scope="session"/>
        </c:if>













        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                <a class="navbar-brand" href="#">Hospital Management</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto"> <!-- Sử dụng class ml-auto để căn chỉnh sang phải -->
                        <li class="nav-item">
                            <a class="nav-link" href="#">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                Manager
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="AdminManagerVaccine.jsp">Vaccine Manager</a>
                                <a class="dropdown-item" href="hospital_manager.jsp">Hospital Manager</a>
                                <a class="dropdown-item" href="user_manager.jsp">User Manager</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">account_circle</i> Profile
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="material-icons">login</i> Login
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="material-icons">logout</i> Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>

            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Hospital</b></h2>
                        </div>
                        <div class="col-sm-6">

                            <!--                            <a href="AddVaccine.jsp "  class="btn btn-primary edit-btn"><i class="material-icons">&#xE147;</i><span>Add Vaccine</span></a> -->
                            <!--                            <a href="#" class="btn btn-primary edit-btn" data-toggle="modal" data-target="#addVaccineModal"><i class="material-icons">&#xE147;</i><span>Add Vaccine</span></a>-->
                            <a href="#" class="btn btn-primary edit-btn" data-toggle="modal" data-target="#addModal">
                                <i class="material-icons">&#xE147;</i>
                                <span>Add Hospital</span>
                            </a>

                        </div>
                    </div>
                </div>       
                
                
                <!--add hospital-->
                
                <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editModalLabel">Edit Hospital</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <!--form chỉnh sửa-->
                                <form class="form" action="AddHospitalByAdminController" method="post"
                                      id="infor">

                                    <div class="container row">

                                        <div class="col-sm-6">
                                            <label for="first_name">
                                                <h6>Hospital name</h6>
                                            </label>

                                            <input required type="text" class="form-control"
                                                   name="name" id="first_name"
                                                   placeholder="Enter name"
                                                   />
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="email">
                                                <h6>Email</h6>
                                            </label>
                                            <input required type="email" class="form-control"
                                                   name="email" id="email"
                                                   placeholder="Enter email address"
                                                   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" 
                                                   title="Wrong format email"
                                                   />
                                        </div>

                                        <div class="col-sm-6">
                                            <label for="hotline">
                                                <h6>Hotline</h6>
                                            </label>
                                            <input pattern="(84|0[3|5|7|8|9])+([0-9]{8})\b" type="text" class="form-control"
                                                   name="hotline" placeholder="Enter hotline number" 
                                                   required title="Wrong hotline number" />
                                        </div>


                                        <div class="col-sm-6">
                                            <label for="address">
                                                <h6>Address</h6>
                                            </label>
                                            <input required type="text" class="form-control"
                                                   id="location" name="address"
                                                   placeholder="Enter address" 
                                                   />

                                        </div>   
                                        <div class="col-sm-6">
                                            <label >
                                                <h6>Password</h6>
                                            </label>
                                            <input required type="password" class="form-control"
                                                   id="location" name="pass"
                                                   placeholder="Enter password" 
                                                   />

                                        </div>  
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary save-button">Save changes</button>
                                    </div>
                                </form>
                            </div> 
                        </div>
                    </div>
                </div>







               <!--add hospital-->

                <%
                    if (session.getAttribute("addinforsucess") != null) {
                %>
                <script>
                    alert("<%= session.getAttribute("addinforsucess")%>");
                </script>
                <%
                        // Xóa session để không hiển thị lại khi người dùng tải lại trang
                        session.removeAttribute("addinforsucess");
                    }
                %>   

                <!--email exist-->
                <%
                    if (session.getAttribute("existEmail") != null) {
                %>
                <script>
                    alert("<%= session.getAttribute("existEmail")%>");
                </script>
                <%
                        // Xóa session để không hiển thị lại khi người dùng tải lại trang
                        session.removeAttribute("existEmail");
                    }
                %> 



                <!--hotline exist-->
                <%
                    if (session.getAttribute("existhotline") != null) {
                %>
                <script>
                    alert("<%= session.getAttribute("existhotline")%>");
                </script>
                <%
                        // Xóa session để không hiển thị lại khi người dùng tải lại trang
                        session.removeAttribute("existhotline");
                    }
                %> 

                <!--update infor-->
                <%
                    if (session.getAttribute("updateinforsucess") != null) {
                %>
                <script>
                    alert("<%= session.getAttribute("updateinforsucess")%>");
                </script>
                <%
                        // Xóa session để không hiển thị lại khi người dùng tải lại trang
                        session.removeAttribute("updateinforsucess");
                    }
                %>     

                <!--delete infor-->

                <%
                    if (session.getAttribute("delete") != null) {
                %>
                <script>
                    alert("<%= session.getAttribute("delete")%>");
                </script>
                <%
                        // Xóa session để không hiển thị lại khi người dùng tải lại trang
                        session.removeAttribute("delete");
                    }
                %>     

                <!--reset pass-->
                <%
                    if (session.getAttribute("resetPass") != null) {
                %>
                <script>
                    alert("<%= session.getAttribute("resetPass")%>");
                </script>
                <%
                        // Xóa session để không hiển thị lại khi người dùng tải lại trang
                        session.removeAttribute("resetPass");
                    }
                %>  

                <div id="product-manager " class="container " >
                    <table class="table table-striped table-hover ">
                        <thead>
                            <tr>
                                <th>Serial</th>
                                <th>ID</th>
                                <th>Hospital Name</th>
                                <th>Address</th>
                                <th>Email</th>
                                <th>Hotline</th>
                                <th> Action</th>  
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${h.allHospital}" var = "i" begin="${(page-1)*10}" end="${page*10-1}" varStatus="loop">     
                                <tr>
                                    <td>${loop.index + 1}</td>
                                    <td>${i.idBV}</td>
                                    <td>${i.name}</td>
                                    <td>${i.address}</td>
                                    <td>${i.email}</td>
                                    <td> ${i.hotline}</td>

                                    <td style="display: flex; flex-direction: row" >  
                                        <a href="#" class=" edit-btn" data-toggle="modal" data-target="#editModal${i.idBV}" >
                                            <i class="material-icons"  title="Edit">&#xE147;</i>
                                        </a>
                                        <a href="#" class="delete" data-bs-toggle="modal" data-bs-target="#exampleModal${i.idBV}"><i class="material-icons" title="Delete">&#xE872;</i></a>
                                        <a href="#" style="color: blue" data-bs-toggle="modal" data-bs-target="#resetPass${i.idBV}"><i class="material-icons" title="Reset Password">&#xeade;  </i></a>
                                    </td>
                                </tr>


                                <!--reset Pass-->


                            <div class="modal fade" id="resetPass${i.idBV}" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="exampleModalLabel"><i class="bi bi-trash-fill"></i>
                                                Reset password</h4>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close">&times;</button>
                                        </div>
                                        <div class="modal-body">
                                            <h6>Are you sure to reset password this User?</h6>
                                        </div>
                                        <div class="modal-footer">
                                            <form action="ResetPasswordHospitalByAdminController" method="Post">
                                                <input type="search" value="${i.idBV}" name="idUser" hidden>
                                                <input type="search" value="${i.email}" name="email" hidden>
                                                <!-- <input type="search" value="w" name="pid" hidden> -->
                                                <button type="submit" class="btn btn-primary">Yes</button>
                                                <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">No</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <!--delete-->



                            <div class="modal fade" id="exampleModal${i.idBV}" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="exampleModalLabel"><i class="bi bi-trash-fill"></i>
                                                Delete</h4>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close">&times;</button>
                                        </div>
                                        <div class="modal-body">
                                            <h6> Are you sure to delete this Hospital?</h6>
                                        </div>
                                        <div class="modal-footer">
                                            <form action="DeleteHospitalByAdminController" method="Post">
                                                <input type="search" value="${i.idBV}" name="idBV" hidden>
                                                <!-- <input type="search" value="w" name="pid" hidden> -->
                                                <button type="submit" class="btn btn-primary">Yes</button>
                                                <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">No</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--edit-->

                            <div class="modal fade editprofile" id="editModal${i.idBV}" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="editModalLabel">Edit Hospital</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <!--form chỉnh sửa-->
                                            <form class="form" action="UpdateHospitalByAdminController" method="post"
                                                  id="infor">
                                                <input type="search" value="${i.idBV}" name="idBV" hidden>
                                                <div class="container row">

                                                    <div class="col-sm-6">
                                                        <label for="first_name">
                                                            <h5>Hospital name</h5>
                                                        </label>

                                                        <input required type="text" class="form-control"
                                                               name="name" id="first_name"
                                                               value="${i.name}" />
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <label for="email">
                                                            <h5>Email</h5>
                                                        </label>
                                                        <input required type="email" class="form-control"
                                                               name="email" id="email"
                                                               value="${i.email}"/>
                                                    </div>

                                                    <div class="col-sm-6">
                                                        <label for="hotline">
                                                            <h5>Hotline</h5>
                                                        </label>
                                                        <input required type="text" class="form-control"
                                                               name="hotline" id="mobile"
                                                               value="${i.hotline}" />
                                                    </div>


                                                    <div class="col-sm-6">
                                                        <label for="address">
                                                            <h5>Address</h5>
                                                        </label>
                                                        <input required type="text" class="form-control"
                                                               id="location" name="address"
                                                               value=""/>

                                                    </div>                                                  
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary save-button">Save changes</button>
                                                </div>
                                            </form>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        </tbody>
                    </table>                 
                </div>
            </div>

            <div style="text-align: center" class="mt-5">
                <a href="hospital_manager.jsp?page=1"><<</a>
                <a href="hospital_manager.jsp?page=${page-1}"><</a>
                <c:out value="${page}"/>
                <a href="hospital_manager.jsp?page=${page+1}">></a>
                <a href="hospital_manager.jsp?page=${maxpage}">>></a>
            </div>
        </div>

        <!-- Modal chỉnh sửa -->






        <!--footer-->

<!--        <footer>
            <div class="row">
                <div class="col-4 col-sm-2">
                    <p>Links</p>
                    <ul class="list-unstyled">
                        <li><a href="./home.html">Home</a></li>
                        <li><a href="">About</a></li>
                        <li><a href="">Menu</a></li>
                        <li><a href="">Contact</a></li>
                    </ul>
                </div>

                <div class="col-7 col-sm-5">
                    <p>Our Address</p>
                    <span>121, Clear Water Bay Road <br>
                        Clear Water Bay, Kowloon <br>
                        HONG KONG </span>


                    <div class="row">
                        <div class="col-xl-12">
                            <img width="10" height="10" src="icon/phone-solid.svg" alt="">
                            <span class="">+852 1234 5678</span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xl-12">
                            <img width="10" height="10" src="icon/tty-solid.svg" alt="">
                            <span class="">+852 8765 4321 </span>
                        </div>
                    </div>


                    <div class="row">
                        <div class="phone col-xl-12">
                            <img width="10" height="10" src="icon/envelope-solid.svg" alt="">
                            <a href="mailto:confusion@food.net">confusion@food.net</a>
                        </div>
                    </div>


                </div>

                <div class="col-12 col-sm-4" style="margin: auto;">
                    <div class="row social-media">
                        <img width="40" height="40" src="icon/450_1000.jpg" alt="">
                        <img width="40" height="40" src="icon/640px-Facebook-icon-1.png" alt="">
                        <img width="40" height="40" src="icon/download.png" alt="">
                        <img width="40" height="40" src="icon/twitter-icon-square-logo-108D17D373-seeklogo.com.png"
                             alt="">
                        <img width="40" height="40" src="icon/pngtree-youtube-square-png-png-image_1589629.jpg" alt="">
                        <img width="40" height="40" src="icon/images.jpg" alt="">
                    </div>
                </div>

                <div class="col-auto" style="margin: auto;">© Copyright 2018 Ristorante Con Fusion</div>
            </div>
        </footer>-->

        <script src="assets/js/managerjs.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>

</html> 