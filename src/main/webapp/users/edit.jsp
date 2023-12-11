<%--@elvariable id="userProfile" type="com.example.socialmedia.entity.User"--%>
<%--@elvariable id="user" type="com.example.socialmedia.entity.User"--%>                            <%--@elvariable id="friendshipStatus" type="com.example.socialmedia.entity.FriendshipStatus"--%>
<%--@elvariable id="friendshipStatus" type="com.example.socialmedia.entity.FriendshipStatus"--%>
<%--@elvariable id="editUserDTO" type="com.example.socialmedia.DTO.EditUserDTO"--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<%@include file="/particle/header.jsp" %>

<body class="bg-body-tertiary">

<%@include file="/particle/navbar.jsp" %>


<main class="container-fluid" style="margin-top: 6rem;">
    <%@include file="/users/user-card.jsp" %>


    <div class="row justify-content-center">
        <div class="col-md-5 d-flex flex-column">

            <%@include file="/users/user-card-mobile.jsp" %>

            <div class="card mb-2 shadow-sm">
                <div class="card-body">
                    <h5 class="fw-bold">Chỉnh sửa thông tin cá nhân</h5>

                    <form id="form-create-post" action="<c:url value="/users/edit"/>" method="post"
                          enctype="multipart/form-data"
                          class="d-flex flex-start flex-column w-100">

                        <div class="input-group my-3">
                            <div class="form-floating">
                                <input type="email" name="email" class="form-control" id="floatingEmail"
                                       placeholder="name@example.com"
                                       value="${editUserDTO.email}"
                                >
                                <label for="floatingEmail">Địa chỉ email</label>
                            </div>
                            <custom:validationErrors field="email" violations="${violations}"/>
                        </div>

                        <div class="input-group my-3">
                            <div class="form-floating">
                                <input type="text" name="username" class="form-control" id="floatingUsername"
                                       value="${editUserDTO.username}"
                                       placeholder="name@example.com">
                                <label for="floatingUsername">Tên người dùng</label>
                                <custom:validationErrors field="username" violations="${violations}"/>
                            </div>
                        </div>

                        <div class="form-floating my-3">
                            <textarea name="bio" class="form-control"
                                      id="floatingTextarea" style="height: 100px">${editUserDTO.bio}</textarea>
                            <label for="floatingTextarea">Giới thiệu</label>
                            <custom:validationErrors field="content" violations="${violations}"/>
                        </div>

                        <div class="d-flex my-3">
                            <img id="frame" width="100" height="100" src="
                            <c:url value="${editUserDTO.avatarImage.image.url}" />"
                                 class="img-fluid rounded-circle me-3"/>
                            <div class="d-flex flex-column justify-content-center align-items-center">
                                <input name="image" class="form-control" type="file" id="formFile" onchange="preview()">
                            </div>
                        </div>

                        <c:if test="${not empty errorMessage}">
                            <div class="text-danger">
                                    ${errorMessage}
                            </div>
                        </c:if>

                        <hr />

                        <div class="d-flex justify-content-end my-1 gap-2">
                            <a href="<c:url value="/users/profile?id=${user.id}"/>" type="button"
                               class="btn btn-secondary"
                               data-bs-dismiss="modal">Hủy</a>
                            <button type="submit" class="btn btn-primary submit-form">Xác nhận</button>
                        </div>

                        <!--                    End card -->
                    </form>
                </div>
            </div>

        </div>
    </div>
</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/@algolia/autocomplete-js"></script>

<%@include file="/particle/autocomplete-js.jsp" %>

<script>
    function preview() {
        frame.src = URL.createObjectURL(event.target.files[0]);
    }
</script>

<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        const listInputGroup = document.querySelectorAll("form .input-group");
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