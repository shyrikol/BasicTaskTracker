<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>
<body>
<h1>Project List</h1>

<c:if test="${!empty listComments}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Content</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listComments}" var="comment">
            <c:if test="${comment.getTask().getId()==id}">
                <tr>
                    <td>${comment.id}</td>
                    <td>${comment.content}</td>
                    <td>
                        <a href="<c:url value='/remove/${comment.id}/${id}'/>">
                            Delete
                        </a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</c:if>

<h1>Add a Comment</h1>

<c:url var="addAction" value="addc"/>

<form:form action="${addAction}" commandName="comment">
    <c:if test="${!empty comment.content}">
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
    <table>
        <tr>
            <td>
                <form:label path="content">
                    <spring:message text="Content:"/>
                </form:label>
            </td>
            <td>
                <form:input path="content"/>
            </td>
            <td>
                <input type="hidden" name="currentTask" value=${id}>
            </td>
        </tr>
        <tr>
            <td>
            <td>
                <c:if test="${empty comment.content}">
                    <input type="submit" class="btn btn-primary"
                           value="<spring:message text="Add Project"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>



</body>
</html>
