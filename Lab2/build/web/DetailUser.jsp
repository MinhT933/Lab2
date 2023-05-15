<%-- 
    Document   : DetailUser
    Created on : Jun 5, 2021, 12:35:57 PM
    Author     : MinhT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail User Page</title>
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
       <nav class="navbar navbar-expand-md navbar-dark bg-dark">
                <div class="container">
                    <a class="navbar-brand" href="LoadUserServlet">Home</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                        <ul class="navbar-nav m-auto">
                            <li class="text-white">Hello,${sessionScope.user.username}</li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout">Logout</a>
                        </li> 
                    </ul>
                    <form action="search">
                        <input type="text" name="nameSearch" value="${requestScope.nameSearch}" />
                        <input type="submit" value="Search" />
                    </form>
                </div>
            </div>
        </nav>

       <div class="container">
                <div class="row">
                <div class="col-sm-9">
                    <div class="container">
                        <div class="card">
                            <div class="row">
                                <aside class="col-sm-5 border-right">
                                    <article class="gallery-wrap"> 
                                        <div class="img-big-wrap">
                                             <a href="#"><img src="./image/${sessionScope.user.photo}" width="390px" height="390px"/></a>
                                        </div> <!-- slider-product.// -->
                                        <div class="img-small-wrap">
                                        </div> <!-- slider-nav.// -->
                                    </article> <!-- gallery-wrap .end// -->
                                </aside>
                                <aside class="col-sm-7">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3 border-right">${sessionScope.user.username}</h3>
                                        <p class="title mb-3"> ${sessionScope.user.userID}</p>
                                        <p class="title mb-3">${sessionScope.user.email}</p>
                                        <p  class="title mb-3">${sessionScope.user.phone}</p>
                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="num">${requestScope.mess}</span>
                                            </span> 
                                        </p> <!-- price-detail-wrap .// -->
                                    </article> <!-- card-body.// -->
                                </aside> <!-- col.// -->
                            </div> <!-- row.// -->
                        </div> <!-- card.// -->


                    </div>
                </div>
            </div>
        </div>
        <p></p>
        <c:if test="${empty requestScope.mess}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Assign Date</th>
                        <th>Promotion Name</th>
                        <th>Rank</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${requestScope.listHistory}">
                        <tr>
                            <td>${item.assignDate}</td>
                            <td>${item.promotionDTO.promotionName}</td>
                            <td>${item.statusDTO.statusName}</td>
                            <td>${item.rankDTO.rankValue}</td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </c:if>

    </body>
</html>
