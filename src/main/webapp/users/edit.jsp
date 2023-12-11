<%--@elvariable id="userProfile" type="com.example.socialmedia.entity.User"--%>
<%--@elvariable id="user" type="com.example.socialmedia.entity.User"--%>                            <%--@elvariable id="friendshipStatus" type="com.example.socialmedia.entity.FriendshipStatus"--%>
<%--@elvariable id="friendshipStatus" type="com.example.socialmedia.entity.FriendshipStatus"--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <form id="form-create-post" action="<c:url value="/posts/create"/>" method="post"
                          class="d-flex flex-start flex-column w-100">

                        <div class="d-flex align-items-center mb-2">
                            <a href="#" class="d-block link-body-emphasis text-decoration-none">
                                <img src="<c:url value="${user.avatarImage.image.url}" />" alt="mdo" width="40" height="40"
                                     class="rounded-circle">
                            </a>
                            <div class="d-flex flex-column align-items-start ms-2 text-start">
                                <h6 class="fw-medium m-0">${user.username}</h6>
                                <h6 class="fw-normal fs-6 text-secondary m-0">Công khai</h6>
                            </div>
                        </div>

                        <div class="form-floating">
                            <textarea name="content" class="form-control" placeholder="Điền vào đây"
                                      id="floatingTextarea" style="height: 100px"></textarea>
                            <label for="floatingTextarea">Nội dung bài viết</label>
                            <custom:validationErrors field="content" violations="${violations}"/>
                        </div>

                        <div class="d-flex justify-content-end my-1 gap-2">
                            <a href="<c:url value="/home"/>" type="button" class="btn btn-secondary"
                               data-bs-dismiss="modal">Hủy</a>
                            <button type="submit" class="btn btn-primary submit-form">Đăng</button>
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


</body>


</html>