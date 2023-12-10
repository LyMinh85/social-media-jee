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

            <%@include file="/users/user-card-mobile.jsp"%>

            <div class="card mb-2 shadow-sm">
                <div class="card-body">
                    <h5 class="fw-bold">Bài viết của ${userProfile.username}</h5>
                </div>
            </div>


            <%--@elvariable id="posts" type="java.util.List<com.example.socialmedia.entity.Post>"--%>
            <c:forEach items="${posts}" var="post">
                <c:set var="post" value="${post}" scope="request"/>
                <jsp:include page="/posts/post-card.jsp"/>
            </c:forEach>

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