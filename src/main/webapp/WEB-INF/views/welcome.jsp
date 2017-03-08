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

    <title>Welcome</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Welcome ${pageContext.request.userPrincipal.name}!
            | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
            | <a href="admin">Admin rights</a>
        </h2>
    </c:if>
</div>

<br/>
<br/>

<h1>Project List</h1>
<div class="center">
<c:if test="${!empty listProjects}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Title</th>
            <th width="120">Description</th>
            <th width="120">Price</th>
            <th width="120">User</th>
        </tr>
        <c:forEach items="${listProjects}" var="project">
            <c:if test="${project.user.getUsername()==pageContext.request.userPrincipal.name}">
            <tr>
                <td>${project.projectId}</td>
                <td><a href="/projectdata/${project.projectId}">${project.projectTitle}</a></td>
                <td>${project.projectAuthor}</td>
                <td>${project.price}</td>
                <td>${project.user.getUsername()}</td>
            </tr>
            </c:if>
        </c:forEach>
    </table>
</c:if>
</div>

<h1>Add a Project</h1>

<c:url var="addAction" value="welcome/add/"/>

<form:form action="${addAction}" commandName="project">
    <table>
        <c:if test="${!empty project.projectTitle}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="projectTitle">
                    <spring:message text="Title"/>
                </form:label>
            </td>
            <td>

                <form:input path="projectTitle"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="projectAuthor">
                    <spring:message text="Description"/>
                </form:label>
            </td>
            <td>
                <form:input path="projectAuthor"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="price">
                    <spring:message text="Price"/>
                </form:label>
            </td>
            <td>
                <form:input path="price"/>
            </td>
            <td>
                <input type="hidden" name="ide" value=${pageContext.request.userPrincipal.name}>
            </td>
        </tr>
        <tr>
            <td>
                <c:if test="${empty project.projectTitle}">
                    <div class="center">
                    <input type="submit" class="btn btn-primary"
                           value="<spring:message text="Add Project"/>"/>
                    </div>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>





<h1>Add task by id</h1>

<c:url var="addAction" value="welcome/addu/"/>

<form:form action="${addAction}" commandName="task">
    <table>
        <tr>
            <td>
                <spring:message text="Project ID:"/>
                <input type="text" name="currentProj" >
            </td>
            <td>

                <form:label path="description">
                </form:label>
                &nbsp&nbsp&nbsp
                <spring:message text="Description"/>
                <form:input path="description"/>
            </td>
        </tr>

        <tr>
            <td>
                <c:if test="${empty task.description}">
                    <input type="submit" class="btn btn-primary"
                           value="<spring:message text="Add Project"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>

</body>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>