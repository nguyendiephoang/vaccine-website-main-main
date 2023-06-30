<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>
<%@page import="model.Vaccine"%>
<jsp:useBean id ="v" class="dal.VaccineDAO" scope ="session"></jsp:useBean>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Vaccine By Admin</title>

        <link href="css/adminManager.css" rel="stylesheet" type="text/css"/>


        <!-- Nạp các tệp CSS của Bootstrap và Material Icons -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <!-- Nạp các tệp JavaScript của jQuery, Popper.js và Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>






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
        <fmt:formatNumber type="number" var="maxpage" value="${Math.ceil(v.allVaccine.size()/2)}">

        </fmt:formatNumber>
        <c:if test="${page>=maxpage}">
            <c:set var="page" value="${maxpage}" scope="session"/>
        </c:if>
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
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
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

        <!--        ----------------------------------Header----------------------------------->


        <!--------------------------------table CRUD----------------------------------->
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                <a class="navbar-brand" href="#">Vaccine Management</a>
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
                            <h2>Manage <b>Vaccine</b></h2>
                        </div>
                        <div class="col-sm-6">

                            <!--                            <a href="AddVaccine.jsp "  class="btn btn-primary edit-btn"><i class="material-icons">&#xE147;</i><span>Add Vaccine</span></a> -->
                            <!--                            <a href="#" class="btn btn-primary edit-btn" data-toggle="modal" data-target="#addVaccineModal"><i class="material-icons">&#xE147;</i><span>Add Vaccine</span></a>-->
                            <a href="#" class="btn btn-primary edit-btn" data-toggle="modal" data-target="#addVaccineModal" onclick="openAddVaccineModal(event)">
                                <i class="material-icons">&#xE147;</i>
                                <span>Add Vaccine</span>
                            </a>

                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Id Vaccine</th>
                            <th>Name Vaccine</th>
                            <th>Detail Vaccine</th>                                 
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${v.allVaccine}" var = "o"  begin="${(page-1)*10}" end="${page*10-1}" varStatus="loop">     
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${o.idVaccine}</td>                      
                                <td>${o.name}</td>
                                <td>
                                    <div class="detail-content collapsed">
                                        ${o.detail}
                                    </div>
                                    <div class="toggle-button">Show</div>
                                </td>                                                                           
                                <td>

                                    <a href="#" data-toggle="modal" data-target="#editVaccineModal${o.idVaccine}" class="edit" ><i class="material-icons">&#xE254;</i></a>
                                    <a href=#" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip"  onclick="showMess(${o.idVaccine})"title="Delete">&#xE872;</i></a>

                                </td>
                            </tr>


                            <!-- Edit Vaccine Modal -->
                        <div id="editVaccineModal${o.idVaccine}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editVaccineModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="edit" method="get">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="editVaccineModalLabel">Edit Vaccine</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>



                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="edit-id">ID</label>
                                                <input id="edit-id" value="${o.idVaccine}"  name="idVaccine" type="text" class="form-control" readonly required>
                                            </div>
                                            <div class="form-group">
                                                <label for="edit-name">Name</label>
                                                <input id="edit-name" value="${o.name}"   name="name" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Detail vaccine</label>
                                                <textarea  " name="detail" type="text" class="form-control" required>${o.detail} </textarea>
                                            </div>




                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <input type="submit" class="btn btn-primary" value="Save changes">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- Add Vaccine Modal -->
                        <div id="addVaccineModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="addVaccineModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="add" method="post">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="addVaccineModalLabel">Add Vaccine</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">

                                            <div class="form-group">
                                                <label for="add-name">Name</label>
                                                <input id="add-name" name="name" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="add-detail">Detail vaccine</label>
                                                <textarea id="add-detail" name="detail" class="form-control" required></textarea>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <input type="submit" class="btn btn-success" value="Add">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </c:forEach>


                    </tbody>
                </table>

            </div>



            <!-- Page -->
            <div style="text-align: center" class="mt-5">
                <a href="AdminManagerVaccine.jsp?page=1"><<</a>
                <a href="AdminManagerVaccine.jsp?page=${page-1}"><</a>
                <c:out value="${page}"/>
                <a href="AdminManagerVaccine.jsp?page=${page+1}">></a>
                <a href="AdminManagerVaccine.jsp?page=${maxpage}">>></a>
            </div>

        </div>

        <script>
            function  showMess(idVaccine) {
                var option = confirm(' Are you sure want to delete this Vaccine');
                if (option === true) {
                    window.location.href = 'delete?idVaccine=' + idVaccine;
                }
            }




        </script>


        <script>
            $(document).ready(function () {
                $('.toggle-button').click(function () {
                    var detailContent = $(this).prev('.detail-content');
                    detailContent.toggleClass('collapsed');
                    $(this).text(detailContent.hasClass('collapsed') ? 'Show' : 'Hide');
                });
            });
        </script>


        <!--        <script>
                    function openAddVaccineModal(event) {
                        event.preventDefault(); // Ngăn chặn hành vi mặc định khi nhấp vào liên kết
        
                     
        
                        // Kiểm tra nếu có thông báo lỗi
                        if (error) {
                            // Hiển thị thông báo lỗi bằng alert
                            alert(error);
                        } else {
                            // Đóng modal nếu không có lỗi
                            $('#addVaccineModal').modal('hide');
                        }
                    }
                </script>-->
        <!--add hospital-->
        <%
            if (session.getAttribute("existVaccine") != null) {
        %>
        <script>
            alert("<%= session.getAttribute("existVaccine")%>");
        </script>
        <%
                // Xóa session để không hiển thị lại khi người dùng tải lại trang
                session.removeAttribute("existVaccine");
            }
        %> 




        <!--add vaccine-->

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




    </body>
</html>