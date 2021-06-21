<%-- 
    Document   : ViewHistoryPromotion
    Created on : Jun 9, 2021, 6:57:26 PM
    Author     : MinhT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Promotion Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <h1>List Promotion</h1>
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col">UserID</th>
                    <th scope="col">Assign Date</th>
                    <th scope="col">Promotion Name</th>
                    <th scope="col">Status Name</th>
                    <th scope="col">Rank</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${requestScope.listHistory}">
                        <tr>
                            <td>${item.userID}</td>
                            <td>${item.assignDate}</td>
                            <td>${item.promotionDTO.promotionName}</td>
                            <td>${item.statusDTO.statusName}</td>
                            <td>${item.rankDTO.rankValue}</td>
                        </tr>
                </c:forEach>
            </tbody>
        </table>
        <form action="search" method="POST">
            <input type="submit" value="View List User" />
        </form>
        <form action="viewListPromotion" method="POST">
            <input type="submit" value="View List Promotion" />
        </form>
    </body>
</html>