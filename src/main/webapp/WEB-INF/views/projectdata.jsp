<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>ProjectData</title>

    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

</head>
<body>

<c:if test="${!empty listTasks}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="80">Description</th>
            <th width="80">Project name</th>
        </tr>
        <c:forEach items="${listTasks}" var="task">
            <c:if test="${task.getProject().getProjectId()==id}">
                <tr>
                    <td>${task.id}</td>
                    <td><a href="taskdata/${task.id}">${task.description}</a></td>
                    <td>${task.project.getProjectTitle()}</td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</c:if>
</body>
</body>
</html>
