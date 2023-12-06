<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--@elvariable id="user" type="com.example.socialmedia.entity.User"--%>
<%--@elvariable id="post" type="com.example.socialmedia.entity.Post"--%>
<div class="card mb-2 shadow-sm">
    <%--      Begin content              --%>
    <div class="card-body">
        <%--        Content                --%>
        <div class="d-flex align-items-center">
            <a href="#" class="d-block link-body-emphasis text-decoration-none">
                <img src="<c:url value="${post.user.avatarImage.image.url}" />" alt="mdo" width="40" height="40"
                     class="rounded-circle">
            </a>
            <div class="d-flex flex-column ms-2 text-start">
                <a href="<c:url value="/users/profile?id=${post.user.id}"/>"
                   class="card-title text-decoration-none m-0">
                    <h6 class="p-0 m-0">
                        ${post.user.username}
                    </h6>
                </a>
                <h6 class="fw-normal fs-6 text-secondary m-0">${post.createAt}</h6>
            </div>
        </div>
        <p class="card-text">
            ${post.content}
        </p>
        <%--     End   Content                --%>
        <hr class="my-1"/>
        <%--       buttons                --%>
        <div class="d-flex flex-row justify-content-between gap-2 my-0">
            <button class="btn btn-light fw-bold flex-fill ">
                <i class="bi bi-heart"></i>
                ${post.numberOfLikes}
            </button>

            <button class="btn btn-light fw-bold flex-fill">
                <i class="bi bi-chat-text"></i>
                ${post.numberOfLikes}
            </button>

            <button class="btn btn-light fw-bold flex-fill">
                <i class="bi bi-box-arrow-up"></i>
                Share
            </button>
        </div>
        <hr class="my-1"/>
        <%--     End   buttons                --%>

<%--        <div class="card-footer p-0 pt-2 border-0 bg-transparent">--%>
<%--            <div class="d-flex flex-start w-100">--%>
<%--                <img class="rounded-circle shadow-1-strong me-3"--%>
<%--                     src="<c:url value="${user.avatarImage.image.url}" />" alt="avatar"--%>
<%--                     width="40"--%>
<%--                     height="40"/>--%>
<%--                <div class="form-outline w-100">--%>

<%--                    <div class="input-group mb-3">--%>
<%--                                    <textarea type="text" class="rounded-5 form-control bg-body-tertiary pe-5"--%>
<%--                                              placeholder="Recipient's username" rows="2"></textarea>--%>
<%--                        <button class="btn btn-primary btn-sm top-50 position-absolute end-0 rounded-circle translate-middle"--%>
<%--                                style="z-index: 6"--%>
<%--                                type="button" id="button-addon2">--%>
<%--                            <i class="bi-send-arrow-down-fill"></i>--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>


<%--            </div>--%>
<%--        </div>--%>
        <!--      End write comment -->

        <!--            End -->
    </div>


</div>