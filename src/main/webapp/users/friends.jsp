<%--@elvariable id="user" type="com.example.socialmedia.entity.User"--%>                            <%--@elvariable id="friendshipStatus" type="com.example.socialmedia.entity.FriendshipStatus"--%>
<%--@elvariable id="friendshipStatus" type="com.example.socialmedia.entity.FriendshipStatus"--%>
<%--@elvariable id="requestFriends" type="java.util.List"--%>
<%--@elvariable id="requestFriend" type="com.example.socialmedia.DTO.FriendDTO"--%>
<%--@elvariable id="friend" type="com.example.socialmedia.DTO.FriendDTO"--%>

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
            <div class="card mb-2 shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Danh sách lời mời kết bạn</h5>
                    <ul class="list-group">
                        <c:forEach items="${requestFriends}" var="requestFriend">
                            <li class="list-group-item d-flex p-3 justify-content-between align-items-center">
                                <div class="d-flex flex-row align-items-center">
                                    <img class="img-fluid rounded-circle shadow-1-strong me-2"
                                         src="<c:url value="${requestFriend.avatarImage.image.url}" />"
                                         alt="avatar"
                                         width="40"
                                         height="40"/>
                                    <a href="<c:url value="/users/profile?id=${requestFriend.id}"/>"
                                       class="card-title text-decoration-none m-0">
                                        <h6 class="p-0 m-0">
                                                ${requestFriend.username}
                                        </h6>
                                    </a>

                                </div>
                                <div class="d-flex gap-2">
                                    <a href="<c:url value="/users/accept-friend-request?id=${requestFriend.id}"/>"
                                       class="btn btn-primary">
                                        Xác nhận
                                    </a>
                                    <a href="<c:url value="/users/reject-friend-request?id=${requestFriend.id}"/>"
                                       class="btn btn-secondary">
                                        Từ chối
                                    </a>
                                </div>

                            </li>
                        </c:forEach>


                    </ul>
                </div>
            </div>

            <div class="card mb-2 shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Danh sách bạn bè</h5>
                    <ul class="list-group">
                        <c:forEach items="${friends}" var="friend">
                            <li class="list-group-item d-flex p-3 justify-content-between align-items-center">
                                <div class="d-flex flex-row align-items-center">
                                    <img class="img-fluid rounded-circle shadow-1-strong me-2"
                                         src="<c:url value="${friend.avatarImage.image.url}" />" alt="avatar"
                                         width="40"
                                         height="40"/>
                                    <a href="<c:url value="/users/profile?id=${friend.id}"/>"
                                       class="card-title text-decoration-none m-0">
                                        <h6 class="p-0 m-0">
                                                ${friend.username}
                                        </h6>
                                    </a>

                                </div>
                                <div class="dropdown">
                                    <button class="btn btn-light" type="button" data-bs-toggle="dropdown"
                                            aria-expanded="false">
                                        <i class="bi bi-three-dots"></i>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a class="dropdown-item text-danger"
                                               href="<c:url value="/users/remove-friend?id=${friend.id}"/>">
                                                Hủy kết bạn
                                            </a>
                                        </li>
                                    </ul>
                                </div>

                            </li>
                        </c:forEach>

                    </ul>
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