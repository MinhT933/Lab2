<%-- 
    Document   : insert
    Created on : Jun 2, 2021, 10:40:57 PM
    Author     : MinhT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert Product</title>
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
                        <h2>add <b>User</b></h2>
                    </div>
                    <div class="col-sm-6">
                    </div>
                </div>
            </div>
        </div>
        <div id="editEmployeeModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <h1 style="color: green">${requestScope.success}</h1>
                    <form action="insert" method="post" enctype="multipart/form-data">
                        <div class="modal-header">
                            <h4 class="modal-title">Add User</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <label>UserID</label>
                                <input type="text" name="userID" value="${requestScope.userNew.userID}" /><br />
                                <p style="color: red">${requestScope.usersError.errorID}</p>
                                <p style="color: red">${requestScope.usersError.errorIDlength}</p>
                                <p style="color: red">${requestScope.usersError.errorIDformat}</p>
                                <p style="color: red">${requestScope.usersError.errorIDduplicate}</p>
                            </div>
                            <div class="form-group">
                                <label>UserName</label>
                                <input type="text" name="userName" value="${requestScope.userNew.username}" /><br />
                                <p style="color: red">${requestScope.usersError.errorName}</p>
                                <p style="color: red">${requestScope.usersError.errorNameFormat}</p>
                                <p style="color: red">${requestScope.usersError.errorNameLength}</p>
                            </div>
                            <div class="form-group">
                                <label>PassWord</label>
                                <input type="password" name="password" value="${requestScope.userNew.password}" /><br />
                                <p style="color: red">${requestScope.usersError.errorPassword}</p>
                                <p style="color: red">${requestScope.usersError.errorPasswordLength}</p>
                            </div>
                            <div class="form-group">
                                <label>RePassword</label>
                                <input type="password" name="rePassword" value="${requestScope.repassword}" /><br />
                                <p style="color: red">${requestScope.usersError.errorRePassword}</p>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="text" name="email" value="${requestScope.userNew.email}" /><br/>
                                <p style="color: red">${requestScope.usersError.errorEmail}</p>
                                <p style="color: red">${requestScope.usersError.errorEmailFormat}</p>
                                <p style="color: red">${requestScope.usersError.errorEmailLength}</p>
                            </div>
                            <div class="form-group">
                                <label>phone</label>
                                <input type="text" name="phone" value="${requestScope.userNew.phone}"/><br/>
                                <p style="color: red">${requestScope.usersError.errorPhone}</p>
                                <p style="color: red">${requestScope.usersError.errorPhoneFormat}</p>
                            </div>
                            <div class="form-group">
                                <label>Roles</label>
                                <select id="Role" name="role">
                                    <c:forEach items="${requestScope.listRole}" var="item">
                                        <option value="${item.roleName}">${item.roleName}</option>
                                    </c:forEach>
                                </select></br>
                            </div>
                            <div class="form-group">
                                <label>photo</label>
                                <input type="file" name="photo" /><br />
                                <p style="color: red">${requestScope.usersError.errorPhoto}</p>
                                <p style="color: red">${requestScope.errorFile}</p>
                                <input type="submit" value="Insert"  />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                        <p style="color: red">${requestScope.usersError.errorConfirm}</p>
                        
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