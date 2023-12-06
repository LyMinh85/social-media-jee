<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--@elvariable id="user" type="com.example.socialmedia.entity.User"--%>
<!DOCTYPE html>
<html>

<%@include file="particle/header.jsp" %>

<body class="bg-body-tertiary">

<%@include file="particle/navbar.jsp" %>


<main class="container-fluid" style="margin-top: 6rem;">
    <c:if test="${not empty user}">
        <div class="col-md-3 card text-center position-fixed ms-5">
            <div class="card-body shadow-sm">
                <div class="card-title d-flex flex-column">
                    <div class="d-flex justify-content-center">
                        <img class="rounded-circle shadow-1-strong mb-2"
                             src="<c:url value="${user.avatarImage.image.url}" />" alt="avatar"
                             width="80"
                             height="80"/>
                    </div>
                    <h4 class="fw-bold text-center">${user.username}</h4>
                </div>
                <hr/>
                <div class="list-group list-group-flush text-start fw-medium" style="font-size: 1.1rem">
                    <a href="<c:url value="/users/profile?id=${user.id}"/>" class="list-group-item list-group-item-action">
                        <i class="bi bi-person-circle me-2"></i>
                        Xem trang cá nhân
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="bi bi-people-fill me-2"></i>
                        Bạn bè
                    </a>
                </div>
            </div>
        </div>
    </c:if>

    <div class="row justify-content-center">
        <div class="col-md-5 d-flex flex-column">

            <div class="card mb-2 shadow-sm">
                <div class="card-body">
                    <div class="d-flex flex-start w-100">
                        <c:choose>
                            <c:when test="${not empty user}">
                                <img class="rounded-circle shadow-1-strong me-3"
                                     src="<c:url value="${user.avatarImage.image.url}" />" alt="avatar"
                                     width="40"
                                     height="40"/>
                            </c:when>
                            <c:when test="${empty user}">
                                <img class="rounded-circle shadow-1-strong me-3"
                                     src="<c:url value="/images/default-avatar.png" />" alt="avatar"
                                     width="40"
                                     height="40"/>
                            </c:when>
                        </c:choose>

                        <div class="form-outline w-100">

                            <div class="input-group">
                                <a class="z-0 btn btn-light rounded-5 w-100 text-start border border-1"
                                   href="<c:url value="/posts/create"/>"
                                <%--                                        type="button" data-bs-toggle="modal" data-bs-target="#modal-new-post"--%>
                                >
                                    Đăng bài mới
                                </a>
                            </div>
                        </div>

                        <!--                    End card -->
                    </div>
                </div>
            </div>

            <%--@elvariable id="posts" type="java.util.List<com.example.socialmedia.entity.Post>"--%>
            <c:forEach items="${posts}" var="post">
                <c:set var="post" value="${post}" scope="request"/>
                <jsp:include page="/posts/post-card.jsp" />
            </c:forEach>


        </div>
    </div>
</main>


<script>

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@algolia/autocomplete-js"></script>

<%@include file="particle/autocomplete-js.jsp"%>


</body>


</html>