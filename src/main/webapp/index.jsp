<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <%@include file="bootstrap/css.jsp"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a class="btn btn-primary" href="hello-servlet">Hello Servlet</a>
<a class="btn btn-primary" href="auth/sign-up">Sign up</a>

<%@include file="/bootstrap/js.jsp" %>

</body>
</html>