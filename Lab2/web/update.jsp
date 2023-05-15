<%-- 
    Document   : update
    Created on : Jun 4, 2021, 8:59:39 PM
    Author     : MinhT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Form</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/manager.css" rel="stylesheet" type="text/css" />
    <style>
        img {
            width: 200px;
            height: 120px;
        }
    </style>

<body>
    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Update <b>User</b></h2>
                    </div>
                    <div class="col-sm-6">
                    </div>
                </div>
            </div>
        </div>
        <div id="editEmployeeModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <h1 style="color: green">${requestScope.updateSuccess}</h1>
                    <form action="update" method="post" enctype="multipart/form-data">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                          
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" name="userName"
                                    value="${not empty requestScope.user ? requestScope.user.username : requestScope.userUpdate.username}" /><br />
                                <p style="color: red">${requestScope.errorUser.errorName}</p>
                                <p style="color: red">${requestScope.errorUser.errorNameFormat}</p>
                                <p style="color: red">${requestScope.errorUser.errorNameLength}</p>
                            </div>
                            <div class="form-group">
                                <label>password</label>
                                <input type="password" name="password"
                                    value="${requestScope.userUpdate.password}" /><br />
                                <p style="color: red">${requestScope.errorUser.errorPassword}</p>
                                <p style="color: red">${requestScope.errorUser.errorPasswordLength}</p>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="text" name="email"
                                    value="${not empty requestScope.user ? requestScope.user.email : requestScope.userUpdate.email}" /><br />
                                <p style="color: red">${requestScope.errorUser.errorEmail}</p>
                                <p style="color: red">${requestScope.errorUser.errorEmailFormat}</p>
                                <p style="color: red">${requestScope.errorUser.errorEmailLength}</p>
                            </div>
                            <div class="form-group">
                                <label>phone</label>
                                <input type="text" name="phone"
                                    value="${not empty requestScope.user ? requestScope.user.phone : requestScope.userUpdate.phone}" /><br />
                                <p style="color: red">${requestScope.errorUser.errorPhone}</p>
                                <p style="color: red">${requestScope.errorUser.errorPhoneFormat}</p>
                            </div>
                            <div class="form-group">
                                <label>photo</label>
                                <input type="file" name="photo" /><br />
                                <p style="color: red">${requestScope.errorUser.errorPhoto}</p>
                                <p style="color: red">${requestScope.errorFormat}</p>

                            </div>
                            <div class="form-group">
                                <label>Role</label>
                                <select id="Role" name="role">
                                    <c:forEach items="${requestScope.listRole}" var="item">
                                        <option value="${item.roleName}" ${requestScope.userUpdate.roleDTO.roleName eq item.roleName ? "selected" : ""}>${item.roleName}</option>
                                    </c:forEach>
                                </select><br/>
                                <input type="hidden" name="userID" value="${not empty requestScope.user ? requestScope.user.userID : requestScope.userUpdate.userID }" />
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="update`">
                        </div>
                    </form>
                    <form action="search" method="POST">
                        <input type="submit" value="View List User" />
                    </form>
                </div>
            </div>
        </div>

    </div>


    <script src="js/manager.js" type="text/javascript"></script>
</body>

</html>