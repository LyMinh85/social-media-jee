<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Sign in</title>
    <%@include file="../bootstrap/css.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body class="h-100">
<div class="form-bg d-flex align-items-center py-4 bg-body-tertiary vh-100">
    <main class="form-sign-in w-100 m-auto bg-white shadow">
        <form id="form-sign-up" class="mx-4 mt-1" action="<c:url value="/auth/sign-in"/>" method="post">
            <h1 class="h3 mb-3 fw-normal text-center fw-bold">Đăng ký</h1>

            <div class="input-group my-3">
                <div class="form-floating">
                    <input type="email" name="email" class="form-control" id="floatingEmail"
                           placeholder="name@example.com"
                           value="${user.email}"
                    >
                    <label for="floatingEmail">Địa chỉ email</label>
                </div>
                <custom:validationErrors field="email" violations="${}"/>
            </div>

            <div class="input-group my-3">
                <div class="form-floating">
                    <input name="password" type="password" class="form-control" id="floatingPassword"
                           placeholder="Password">
                    <label for="floatingPassword">Mật khẩu</label>
                </div>
                <custom:validationErrors field="password" violations="${violations}"/>
            </div>


            <c:if test="${not empty errorMessage}">
                <div class="text-danger">
                        ${errorMessage}
                </div>
            </c:if>


            <div class="d-flex">
                <button class="btn btn-primary m-auto py-2" type="submit">
                    Đăng nhập
                </button>
            </div>
            <hr/>
            <p>Chưa có tài khoản? <a href="#">Đăng ký</a></p>
        </form>
    </main>
</div>


<%@include file="../bootstrap/js.jsp" %>

<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        const listInputGroup = document.querySelectorAll("#form-sign-up .input-group");
        listInputGroup.forEach(inputGroup => {
            if (inputGroup.querySelector(".invalid-feedback") !== null) {
                inputGroup.querySelector(".form-floating").classList.add("is-invalid");
                inputGroup.querySelector(".form-control")?.classList.add("is-invalid");
                inputGroup.querySelector(".form-select")?.classList.add("is-invalid");
            }
        });
    });
</script>
</body>
</html>
