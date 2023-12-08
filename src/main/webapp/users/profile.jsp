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
    <div class="col-md-3 card position-fixed ms-5 d-none d-md-block">
        <div class="card-body shadow-sm">
            <div class="card-title d-flex flex-column align-items-center">
                <div class="d-flex justify-content-center">
                    <img class="rounded-circle shadow-1-strong mb-2"
                         src="<c:url value="${userProfile.avatarImage.image.url}" />" alt="avatar"
                         width="80"
                         height="80"/>
                </div>
                <h4 class="fw-bold text-center">${userProfile.username}</h4>
                <c:choose>
                    <c:when test="${not empty user && user.id != userProfile.id}">
                        <c:choose>
                            <c:when test="${friendshipStatus == 'ACCEPTED'}">
                                <a type="button" class="btn btn-secondary w-50"
                                   href="<c:url value="/users/send-friend-request?id=${userProfile.id}"/>"
                                >
                                    Bạn bè
                                </a>
                            </c:when>
                            <c:when test="${friendshipStatus == null}">
                                <c:if test="${isFriend == false}">
                                    <a type="button" class="btn btn-primary w-50"
                                       href="<c:url value="/users/send-friend-request?id=${userProfile.id}"/>"
                                    >
                                        Kết bạn
                                    </a>
                                </c:if>
                            </c:when>
                        </c:choose>

                    </c:when>
                </c:choose>
            </div>
            <hr/>
            <h5 class="fw-bold">Giới thiệu</h5>
            <p>
                ${userProfile.bio}
            </p>
            <c:if test="${not empty user && user.id == userProfile.id}">

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
            </c:if>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-5 d-flex flex-column">

            <div class="card mb-2 shadow-sm d-block d-md-none">
                <div class="card-body">
                    <div class="card-title d-flex flex-column text-center align-items-center">
                        <div class="d-flex justify-content-center">
                            <img class="rounded-circle shadow-1-strong mb-2"
                                 src="<c:url value="${userProfile.avatarImage.image.url}" />" alt="avatar"
                                 width="80"
                                 height="80"/>
                        </div>
                        <h4 class="fw-bold">${userProfile.username}</h4>
                        <c:choose>
                            <c:when test="${not empty user}">
                                <c:if test="${isFriend == true}">
                                    <a type="button" class="btn btn-secondary w-50"
                                       href="<c:url value="/users/send-friend-request?id=${userProfile.id}"/>"
                                    >
                                        Bạn bè
                                    </a>
                                </c:if>
                                <c:if test="${isFriend == false}">
                                    <a type="button" class="btn btn-primary w-50"
                                       href="<c:url value="/users/send-friend-request?id=${userProfile.id}"/>"
                                    >
                                        Kết bạn
                                    </a>
                                </c:if>
                            </c:when>
                        </c:choose>

                    </div>
                    <hr/>
                    <h5 class="fw-bold">Giới thiệu</h5>
                    <p>
                        ${userProfile.bio}
                    </p>

                    <c:if test="${not empty user && user.id == userProfile.id}">

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
                    </c:if>
                </div>


            </div>

            <div class="card mb-2 shadow-sm">
                <div class="card-body">
                    <h5 class="fw-bold">Bài viết của ${userProfile.username}</h5>
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



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/@algolia/autocomplete-js"></script>

<%@include file="/particle/autocomplete-js.jsp"%>


</body>


</html>