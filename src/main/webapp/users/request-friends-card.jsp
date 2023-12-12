<%--@elvariable id="user" type="com.example.socialmedia.entity.User"--%>
<%--@elvariable id="requestFriends" type="com.example.socialmedia.DTO.FriendDTO"--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<c:if test="${not empty user}">
  <div class="col-md-3 card position-fixed end-0 me-5 d-none d-md-block">
    <div class="card-body shadow-sm">
      <h5 class="card-title">Danh sách lời mời kết bạn</h5>
      <ul class="list-group">
        <c:forEach items="${requestFriends}" var="requestFriend">
          <li class="list-group-item d-flex p-3 justify-content-between align-items-center">
            <div class="d-flex flex-row align-items-center">
              <img class="rounded-circle shadow-1-strong me-2"
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
</c:if>