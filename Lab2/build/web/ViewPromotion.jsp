<%-- 
    Document   : ViewPromotion
    Created on : Jun 8, 2021, 7:12:48 PM
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
                    <th scope="col">promotionID</th>
                    <th scope="col">promotionName</th>
                    <th scope="col">view list user</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${requestScope.listPromotion}">
                    <tr>
                        <td>${item.promotionID}</td>
                        <td>${item.promotionName}</td>
                        <td><form method="POST" action="viewDetailByPromotionID">
                                <input type="hidden" name="promotionID" value="${item.promotionID}" />
                                <input type="submit" value="View Detail " />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <form action="search" method="POST">
            <input type="submit" value="View List User" />
        </form>
    </body>
</html>
