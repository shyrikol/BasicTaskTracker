<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>

<body>
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="post" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Admin Page ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
        </h2>
    </c:if>
</div>

<h1>Project List</h1>

<c:if test="${!empty listProjects}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Title</th>
            <th width="120">Author</th>
            <th width="120">Price</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:if test="${empty username}">
        <c:forEach items="${listProjects}" var="project">
                <tr>
                    <td>${project.projectId}</td>
                    <td><a href="/projectdata/${project.projectId}">${project.projectTitle}</a></td>
                    <td>${project.projectAuthor}</td>
                    <td>${project.price/100}${project.price%100}</td>
                    <td><a href="<c:url value='/edit/${project.projectId}'/>">Edit</a></td>
                    <td><a href="<c:url value='/remove/${project.projectId}'/>">Delete</a></td>
                    <td>${project.user.getUsername()}</td>
                </tr>
        </c:forEach>
        </c:if>
        <c:if test="${!empty username}">
            <c:forEach items="${listProjects}" var="project">
                <c:if test="${username == project.user.getUsername()}">
                <tr>
                    <td>${project.projectId}</td>
                    <td><a href="/projectdata/${project.projectId}">${project.projectTitle}</a></td>
                    <td>${project.projectAuthor}</td>
                    <td>${project.price/100}${project.price%100}</td>
                    <td><a href="<c:url value='/edit/${project.projectId}'/>">Edit</a></td>
                    <td><a href="<c:url value='/remove/${project.projectId}'/>">Delete</a></td>
                    <td>${project.user.getUsername()}</td>
                </tr>
                </c:if>
            </c:forEach>
        </c:if>
    </table>
</c:if>

<h1>Add a Project</h1>

<c:url var="addAction" value="admin"/>

<form:form action="${addAction}" commandName="user">
    <table>
        <tr>
            <td>
                <input type="text" name="currentProj" >
            </td>
        </tr>
        <tr>
            <td>
                    <input type="submit" class="btn btn-primary"
                           value="<spring:message text="Add Project"/>"/>
            </td>
        </tr>
    </table>
</form:form>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>