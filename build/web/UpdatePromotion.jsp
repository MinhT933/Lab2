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
                            <h2>Update <b>Promotion</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <h1 style="color: green">${requestScope.mess}</h1>
                        <form action="ConfirmUpdatedPromotion" method="post" enctype="multipart/form-data">
                            <div class="modal-header">
                                <h4 class="modal-title">Update Promotion</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">

                                <div class="form-group">
                                    <label>userID:</label>
                                    <p>${requestScope.historyPromotion.userID}</p>
                                </div>
                                <div class="form-group">
                                    <label>Assign Date</label>
                                    <p>${requestScope.historyPromotion.assignDate}</p>
                                </div>
                                <div class="form-group">
                                    <label>romotion Name</label>
                                    <select name="promotionName">
                                            <c:forEach items="${requestScope.listPromotion}" var="item">
                                                <option value="${item.promotionName}" ${item.promotionName eq requestScope.historyPromotion.promotionDTO.promotionName ? "selected" : ""}>${item.promotionName}</option>
                                            </c:forEach>
                                        </select>

                                </div>
                                <div class="form-group">
                                    <label>StatusName:</label>
                                    <p>${requestScope.historyPromotion.statusDTO.statusName}</p>
                                </div>
                                <div class="form-group">
                                    <label>Rank</label>
                                    <select name="rank">
                                            <c:forEach items="${requestScope.listRank}" var="item">
                                                <option value="${item.rankValue}" ${item.rankValue eq requestScope.historyPromotion.rankDTO.rankValue ? "selected" : ""}>${item.rankValue}</option>
                                            </c:forEach>
                                        </select>

                                </div>
                            </div>

                            <input type="hidden" name="status" value="${requestScope.historyPromotion.statusDTO.statusName}" />
                            <input type="hidden" name="userID" value="${requestScope.historyPromotion.userID}" />
                            <input type="submit" value="update submit" />

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

</div>


<script src="js/manager.js" type="text/javascript"></script>
</body>

</html>