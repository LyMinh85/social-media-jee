<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--@elvariable id="user" type="com.example.socialmedia.entity.User"--%>
<%--@elvariable id="post" type="com.example.socialmedia.DTO.PostDTO"--%>
<div class="card mb-2 shadow-sm">
    <%--      Begin content              --%>
    <div class="card-body">
        <%--        Content                --%>
        <div class="d-flex align-items-center">
            <a href="<c:url value="/users/profile?id=${post.user.id}"/>" class="d-block link-body-emphasis text-decoration-none">
                <img src="<c:url value="${post.user.avatarImage.image.url}" />" alt="mdo" width="40" height="40"
                     class="img-fluid rounded-circle">
            </a>
            <div class="d-flex flex-column ms-2 text-start">
                <a href="<c:url value="/users/profile?id=${post.user.id}"/>"
                   class="card-title text-decoration-none m-0">
                    <h6 class="p-0 m-0">
                        ${post.user.username}
                    </h6>
                </a>
                <h6 class="fw-normal fs-6 text-secondary m-0 uppercase-first-letter">${post.createAt}</h6>
            </div>
        </div>
        <p class="card-text">
            ${post.content}
        </p>
        <%--     End   Content                --%>
        <hr class="my-1"/>
        <%--       buttons                --%>
        <div class="d-flex flex-row justify-content-between gap-2 my-0">
            <button onclick="processLike(this, ${post.id})" class="btn btn-light fw-bold flex-fill ">
                <c:if test="${not empty post.liked}">
                    <c:if test="${post.liked}">
                        <i class="bi bi-suit-heart-fill"></i>
                    </c:if>
                    <c:if test="${not post.liked}">
                        <i class="bi bi-suit-heart"></i>
                    </c:if>
                </c:if>
                <c:if test="${empty post.liked}">
                    <i class="bi bi-suit-heart"></i>
                </c:if>
                <span>
                    ${post.numberOfLikes}
                </span>
            </button>

            <a href="<c:url value="/posts/detail?id=${post.id}"/>" class="btn btn-light fw-bold flex-fill">
                <i class="bi bi-chat-text"></i>
                <span>
                    ${post.numberOfComments}
                </span>
            </a>

            <button class="btn btn-light fw-bold flex-fill">
                <i class="bi bi-box-arrow-up"></i>
                Share
            </button>
        </div>
        <hr class="my-1"/>
    </div>


</div>