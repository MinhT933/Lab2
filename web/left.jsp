

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i>Group</div>
        <ul class="list-group category_block">
            <c:forEach items="${requestScope.listRole}" var="item"> 
               
                    <a class="nav-link ${item.roleName eq requestScope.roleName ? "active" : ""}" 
                       id="" data-toggle="tab" 
                       href="#${item.roleName}" 
                       role="tab" aria-controls="${item.roleName}" 
                       aria-selected="${item.roleName eq requestScope.roleName ? true : false}"
                       onclick="location.href = ('/JLP0017/search?roleName=${item.roleName}');"
                       >
                        ${item.roleName}
                    </a> 
                
            </c:forEach>
        </ul>
    </div>
   
    </div>