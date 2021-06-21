<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#">Phone</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <li class="text-white">Hello,${sessionScope.user.username}</li>
                    <li class="nav-item">
                        <a href="insertPage">Insert User</a>
                    </li>
                    <li class="nav-item">
                        <a href="viewListPromotion">view list promotion</a>
                    </li>
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

<!--end of menu-->


<!--"fa fa-shopping-cart"-->