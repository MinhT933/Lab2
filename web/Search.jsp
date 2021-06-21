<%-- 
    Document   : Search
    Created on : Jun 1, 2021, 9:27:53 PM
    Author     : MinhT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
         <div class="container-fluid">
          
            <a href="viewListPromotion">view list promotion</a>
            <h1>Search</h1> 

       
            <div class="row">
                <jsp:include page="left.jsp"></jsp:include>
                <div class="col-sm-5 tab-content" id="myTabContent">
                    <c:forEach items="${requestScope.listRole}" var="item">
                        <div class="tab-pane fade show ${item.roleName eq requestScope.roleName ? "active" : ""}" id="${item.roleName}" role="tabpanel" aria-labelledby="home-tab">
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th>userID</th>
                                        <th>userName</th>
                                        <th>email</th>
                                        <th>phone</th>
                                        <th>photo</th>
                                        <th>roleName</th>
                                        <th>Status</th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                        <th>Promotion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${requestScope.listUser}">
                                        <tr>
                                            <td>${item.userID}</td>
                                            <td>${item.username}</td>
                                            <td>${item.email}</td>
                                            <td>${item.phone}</td>
                                            <td><img src="./image/${item.photo}" width="100px" height="100px"/></td>
                                            <td>${item.roleDTO.roleName}</td>
                                            <td>${item.statusDTO.statusName}</td>
                                            <c:if test="${item.roleDTO.roleName eq 'User' && item.statusDTO.statusName eq 'Active' }">
                                                <td>
                                                    <form method="POST" action="LoadUpdate">
                                                        <input type="hidden" name="userID" value="${item.userID}" />
                                                        <input type="submit" value="Update" />
                                                    </form>
                                                </td>
                                                <td>
                                                    <form method="POST" action="delete">
                                                        <input type="hidden" name="userID" value="${item.userID}" />
                                                        <input type="submit" value="Delete" />
                                                    </form>
                                                </td>
                                            </c:if>
                                            <c:if test="${item.roleDTO.roleName eq 'User' && item.statusDTO.statusName eq 'InActive' }">
                                                <td>

                                                </td>
                                                <td>

                                                </td>
                                            </c:if>
                                            <c:if test="${item.roleDTO.roleName eq 'Admin'}">
                                                <td>

                                                </td>
                                                <td>

                                                </td>
                                                <c:if test="${item.userID eq requestScope.userID}">
                                                    <td style="color: green">${requestScope.deleteSuccess}</td>
                                                </c:if>
                                            </c:if>

                                            <c:if test="${item.roleDTO.roleName eq 'User' && item.statusDTO.statusName eq 'Active'}">
                                                <td> <form action="AddPromotion" method="Post">
                                                        <input type="hidden" name="userID" value="${item.userID}" />
                                                        <input type="submit" value="Add Promotion" />
                                                    </form>
                                                    <form action="deletePromotion" method="Post">
                                                        <input type="hidden" name="userID" value="${item.userID}" />
                                                        <input type="submit" value="Remove Promotion" />
                                                    </form>
                                                    <form action="udpatePromotion" method="Post">
                                                        <input type="hidden" name="userID" value="${item.userID}" />
                                                        <input type="submit" value="Update Promotion" />
                                                    </form> 
                                                </td>
                                                <c:if test="${not empty requestScope.mess && item.userID eq requestScope.userID}">
                                                    <td style="color: red">${requestScope.mess}</td>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${item.roleDTO.roleName eq 'User' && item.statusDTO.statusName eq 'InActive'}">
                                                <td> 
                                                </td>
                                                <c:if test="${not empty requestScope.mess && item.userID eq requestScope.userID}">
                                                    <td>${requestScope.mess}</td>
                                                </c:if>
                                            </c:if>        
                                            <c:if test="${item.roleDTO.roleName eq 'Admin'}">
                                                <td> 
                                                </td>
                                            </c:if>
                                            <c:if test="${item.userID eq requestScope.userID}">
                                                <td style="color: green">${requestScope.deleteSuccess}</td>
                                            </c:if>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    </body>
</html>
