<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Sign up</title>
    <%@include file="../bootstrap/css.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body class="h-100">
<div class="form-bg d-flex align-items-center py-4 bg-body-tertiary vh-100">
    <main class="form-sign-in w-100 m-auto bg-white shadow">
        <form id="form-sign-up" class="mx-4 mt-1" action="<c:url value="/auth/sign-up"/>" method="post">
            <h1 class="h3 mb-3 fw-normal text-center fw-bold">Đăng ký</h1>

            <div class="input-group my-3">
                <div class="form-floating">
                    <input type="email" name="email" class="form-control" id="floatingEmail"
                           placeholder="name@example.com"
                            value="${user.email}"
                    >
                    <label for="floatingEmail">Địa chỉ email</label>
                </div>
                <custom:validationErrors field="email" violations="${violations}"/>
            </div>

            <div class="input-group my-3">
                <div class="form-floating">
                    <input type="text" name="username" class="form-control" id="floatingUsername"
                           value="${user.username}"
                           placeholder="name@example.com">
                    <label for="floatingUsername">Tên người dùng</label>
                    <custom:validationErrors field="username" violations="${violations}"/>
                </div>
            </div>

            <div class="input-group my-3">
                <div class="form-floating">
                    <input name="password" type="password" class="form-control" id="floatingPassword"
                           placeholder="Password">
                    <label for="floatingPassword">Mật khẩu</label>
                </div>
                <span class="input-group-text text-primary"
                      data-bs-toggle="tooltip" data-bs-placement="bottom"
                      data-bs-html="true"
                      data-bs-title="* Tối thiểu 8 ký tự <br/> * Bao gồm số, chữ thường và chữ in hoa">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle-fill" viewBox="0 0 16 16">
                      <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
                    </svg>
                </span>
                <custom:validationErrors field="password" violations="${violations}"/>
            </div>

            <div class="input-group my-3">
                <div class="form-floating">
                    <input type="password" name="re-password" class="form-control" id="floatingReEnterPassword"
                           placeholder="name@example.com">
                    <label for="floatingReEnterPassword">Nhập lại mật khẩu</label>
                </div>
                <c:if test="${invalidRePassword}">
                    <div class="invalid-feedback">
                        Mật khẩu nhập lại không đúng
                    </div>
                </c:if>
            </div>

            <div class="input-group my-3">
                <div class="form-floating">
                    <select name="gender" class="form-select" id="floatingSelect"
                            aria-label="Floating label select example">
                        <option value="">Chọn giới tính</option>
                        <option value="nam" ${user.gender == "nam" ? "selected" : ""}>Nam</option>
                        <option value="nu" ${user.gender == "nu" ? "selected" : ""}>Nữ</option>
                    </select>
                    <label for="floatingSelect">Giới tính</label>
                </div>
                <custom:validationErrors field="gender" violations="${violations}"/>
            </div>


            <c:if test="${not empty errorMessage}">
                <div class="text-danger">
                    ${errorMessage}
                </div>
            </c:if>


            <div class="d-flex">
                <button class="btn btn-primary m-auto py-2" type="submit">
                    Đăng ký
                </button>
            </div>
            <hr/>
            <p>Đã có tài khoản? <a href="<c:url value="/auth/sign-in"/>">Đăng nhập</a></p>
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
