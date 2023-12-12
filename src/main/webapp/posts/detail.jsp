<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--@elvariable id="user" type="com.example.socialmedia.entity.User"--%>
<%--@elvariable id="post" type="com.example.socialmedia.DTO.PostDTO"--%>
<%--@elvariable id="comments" type="java.util.List"--%>
<%--@elvariable id="comment" type="com.example.socialmedia.entity.Comment"--%>

<!DOCTYPE html>
<html>

<%@include file="/particle/header.jsp" %>

<body class="bg-body-tertiary">

<%@include file="/particle/navbar.jsp" %>


<main class="container-fluid" style="margin-top: 6rem;">
    <%@include file="/users/user-card.jsp" %>

    <%@include file="/users/request-friends-card.jsp"%>


    <div class="row justify-content-center">
        <div class="col-md-5 d-flex flex-column">

            <div class="card mb-2 shadow-sm">
                <%--      Begin content              --%>
                <div class="card-body">
                    <%--        Content                --%>
                    <div class="d-flex align-items-center">
                        <a href="#" class="d-block link-body-emphasis text-decoration-none">
                            <img src="<c:url value="${post.user.avatarImage.image.url}" />" alt="mdo" width="40"
                                 height="40"
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

                        <button id="btn-comment" class="btn btn-light fw-bold flex-fill">
                            <i class="bi bi-chat-text"></i>
                            <span>
                                ${post.numberOfComments}
                            </span>
                        </button>

                        <button class="btn btn-light fw-bold flex-fill">
                            <i class="bi bi-box-arrow-up"></i>
                            Share
                        </button>
                    </div>
                    <hr class="my-1"/>
                    <!--   Begin list comment -->
                    <div class="row d-flex mt-2">
                        <div id="list-comment" class="col">
<%--                            <p>--%>
<%--                                <a href="#"--%>
<%--                                   class="link-offset-1 link-offset-1-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover">--%>
<%--                                    Xem thêm bình luận--%>
<%--                                </a>--%>
<%--                            </p>--%>

                            <c:forEach items="${comments}" var="comment">
                                <div class="d-flex flex-start mb-2">
                                    <img class="rounded-circle shadow-1-strong me-3"
                                         src="<c:url value="${comment.user.avatarImage.image.url}"/>" alt="avatar"
                                         width="40"
                                         height="40"/>
                                    <div class="card p-0 w-100 bg-body-tertiary  border-0">
                                        <div class="card-body p-2">
                                            <div>
                                                <h6 class="card-title m-0">
                                                    ${comment.user.username}
                                                    <i class="bi bi-dot"></i>
                                                    <span class="fw-normal text-secondary small">${comment.createAt}</span>
                                                </h6>

                                                <p>
                                                    ${comment.content}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>



                        </div>


                    </div>
                    <!--   End list comment -->

                    <c:if test="${not empty user}">
                        <hr class="my-1"/>

                        <div class="card-footer p-0 pt-2 border-0 bg-transparent">
                            <div class="d-flex flex-start w-100">
                                <img class="rounded-circle shadow-1-strong me-3"
                                     src="<c:url value="${user.avatarImage.image.url}" /> " alt="avatar"
                                     width="40"
                                     height="40"/>
                                <div class="form-outline w-100">

                                    <div class="input-group mb-3">
                                    <textarea id="txt-comment" type="text"
                                              class="rounded-5 form-control bg-body-tertiary pe-5"
                                              placeholder="Nội dung bình luận" rows="2"></textarea>
                                        <button class="btn btn-primary btn-sm top-50 position-absolute end-0 rounded-circle translate-middle"
                                                style="z-index: 6"
                                                type="button" id="btn-post-comment">
                                            <i class="bi-send-arrow-down-fill"></i>
                                        </button>
                                    </div>
                                    <div id="error-messgae" class="text-danger"></div>

                                </div>
                            </div>
                        </div>
                        <!-- End post comment -->
                    </c:if>


                </div>


            </div>


        </div>
    </div>
</main>


<script>

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@algolia/autocomplete-js"></script>

<%@include file="/particle/autocomplete-js.jsp" %>
<%@include file="/particle/scripts.jsp"%>

<script type="module">

    function isEmpty(str) {
        return (!str || str.length === 0);
    }

    document.addEventListener("DOMContentLoaded", function (event) {
        const txtCommentEle = document.querySelector("#txt-comment");
        const btnPostComment = document.querySelector("#btn-post-comment");

        btnPostComment.addEventListener('click', async () => {
            const content = txtCommentEle.value;
            const postId = parseInt('${post.id}');

            // Build formData object.
            let formData = new FormData();
            formData.append('content', content);
            formData.append('postId', postId);

            const ParamsData = new URLSearchParams();
            for (const pair of formData) {
                ParamsData.append(pair[0], pair[1]);
            }


            const res = await fetch("<c:url value="/api/comments"/>",
                {
                    body: ParamsData,
                    method: "post",
                    credentials: 'same-origin',
                });
            const data = await res.json();
            try {
                if (data[0].content) {
                    document.querySelector('#error-messgae').innerHTML = data[0].content;
                }
            } catch (e) {
                const comment = data;
                if (!comment.userDTO.avatarImage.image.url.includes("https")) {
                    comment.userDTO.avatarImage.image.url = "${pageContext.request.contextPath}/" + comment.userDTO.avatarImage.image.url;
                }
                document.querySelector('#list-comment').innerHTML += commentTemplate(comment);
                const numberOfComments = parseInt(document.querySelector('#btn-comment span').innerHTML);
                document.querySelector('#btn-comment span').innerHTML = (numberOfComments + 1).toString();
                txtCommentEle.value = '';
            }

        });
    });

    const commentTemplate = (comment) => `
        <div class="d-flex flex-start mb-2">
            <img class="rounded-circle shadow-1-strong me-3"
                 src="\${comment.userDTO.avatarImage.image.url}" alt="avatar"
                 width="40"
                 height="40"/>
            <div class="card p-0 w-100 bg-body-tertiary  border-0">
                <div class="card-body p-2">
                    <div>
                        <h6 class="card-title m-0">
                            \${comment.userDTO.username}
                            <i class="bi bi-dot"></i>
                            <span class="fw-normal text-secondary small">\${comment.relativeTime}</span>
                        </h6>

                        <p>
                            \${comment.content}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    `;

</script>


</body>


</html>