<%--@elvariable id="userProfile" type="com.example.socialmedia.entity.User"--%>
<%--@elvariable id="user" type="com.example.socialmedia.entity.User"--%>                            <%--@elvariable id="friendshipStatus" type="com.example.socialmedia.entity.FriendshipStatus"--%>
<%--@elvariable id="friendshipStatus" type="com.example.socialmedia.entity.FriendshipStatus"--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<c:if test="${not empty userProfile}">
    <div class="col-md-3 card position-fixed ms-5 d-none d-md-block">
        <div class="card-body shadow-sm">
            <div class="card-title d-flex flex-column align-items-center">
                <div class="d-flex justify-content-center">
                    <img class="img-fluid rounded-circle shadow-1-strong mb-2"
                         src="<c:url value="${userProfile.avatarImage.image.url}" />" alt="avatar"
                         width="80"
                         height="80"/>
                </div>
                <h4 class="fw-bold text-center">${userProfile.username}</h4>
                <c:choose>
                    <c:when test="${not empty user && user.id != userProfile.id}">
                        <c:choose>
                            <c:when test="${friendshipStatus == 'ACCEPTED'}">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary">Bạn bè</button>
                                    <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        <span class="visually-hidden">Toggle Dropdown</span>
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
                            </c:when>
                            <c:when test="${friendshipStatus == 'PENDING'}">
                                <a type="button" class="btn btn-primary w-50"
                                   href="<c:url value="/users/unsent-friend-request?id=${userProfile.id}"/>"
                                >
                                    Hủy lời mời
                                </a>
                            </c:when>
                            <c:when test="${empty friendshipStatus}">
                                <a type="button" class="btn btn-primary w-50"
                                   href="<c:url value="/users/send-friend-request?id=${userProfile.id}"/>"
                                >
                                    Thêm bạn bè
                                </a>
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
                    <a href="<c:url value="/users/profile?id=${user.id}"/>"
                       class="list-group-item list-group-item-action">
                        <i class="bi bi-person-circle me-2"></i>
                        Xem trang cá nhân
                    </a>
                    <a href="<c:url value="/users/friends"/>" class="list-group-item list-group-item-action">
                        <i class="bi bi-people-fill me-2"></i>
                        Bạn bè
                    </a>
                    <a href="<c:url value="/users/edit"/>" class="list-group-item list-group-item-action">
                        <i class="bi bi-people-fill me-2"></i>
                        Chỉnh sửa thông tin cá nhân
                    </a>
                </div>
            </c:if>
        </div>
    </div>
</c:if>

<c:if test="${not empty user && empty userProfile}">
    <div class="col-md-3 card position-fixed ms-5 d-none d-md-block">
        <div class="card-body shadow-sm">
            <div class="card-title d-flex flex-column align-items-center">
                <div class="d-flex justify-content-center">
                    <img class="img-fluid rounded-circle shadow-1-strong mb-2"
                         src="<c:url value="${user.avatarImage.image.url}" />" alt="avatar"
                         width="80"
                         height="80"/>
                </div>
                <h4 class="fw-bold text-center">${user.username}</h4>
            </div>
            <hr/>
            <h5 class="fw-bold">Giới thiệu</h5>
            <p>
                    ${user.bio}
            </p>
            <hr/>
            <div class="list-group list-group-flush text-start fw-medium" style="font-size: 1.1rem">
                <a href="<c:url value="/users/profile?id=${user.id}"/>"
                   class="list-group-item list-group-item-action">
                    <i class="bi bi-person-circle me-2"></i>
                    Xem trang cá nhân
                </a>
                <a href="<c:url value="/users/friends"/>" class="list-group-item list-group-item-action">
                    <i class="bi bi-people-fill me-2"></i>
                    Bạn bè
                </a>
                <a href="<c:url value="/users/edit"/>" class="list-group-item list-group-item-action">
                    <i class="bi bi-people-fill me-2"></i>
                    Chỉnh sửa thông tin cá nhân
                </a>
            </div>
        </div>
    </div>
</c:if>