<%-- 
    Document   : InsertPromotion
    Created on : Jun 7, 2021, 11:45:19 PM
    Author     : MinhT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add promotion</title>
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
                        <div class="modal-header">
                            <h4 class="modal-title">Add Promotion</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form method="POST" action="ConfirmAddPromotion">
                                <select name="namePromotion">
                                    <c:forEach var="item" items="${requestScope.listPromotion}">
                                        <option value="${item.promotionName}" ${requestScope.namePromotion eq item.promotionName ? "selected" : ""}>${item.promotionName}</option>
                                    </c:forEach>
                                </select><br/>
                                <input type="hidden" name="userID" value="${requestScope.userID}" />
                                <input type="submit" value="Confirm" style="display: none" id="submit"/>
                                ${requestScope.addSuccess}
                                ${requestScope.addFail}
                            </form> 
                            <button onclick="Submit_Add_Promotion()">Submit</button>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" onclick=" Submit_Add_Promotion () " value="Add" id="submit">
                        </div>
                        <p style="color: red">${requestScope.usersError.errorConfirm}</p>
                        
                    </form>
                        <form action="search" method="POST">
                            <input type="submit" value="View List User" />
                        </form>
                        <script>
                            function Submit_Add_Promotion(){
                                confirmModal = confirm("Do you want to add promotion ")
                                if(confirmModal){
                                 document.getElementById("submit").click();
                               }
                            }
                        </script>
                </div>
            </div>
        </div>  