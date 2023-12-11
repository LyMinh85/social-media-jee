<script>

    async function processLike(btnLike, postId) {
        const icon = btnLike.querySelector('.bi');

        <c:if test="${not empty user}">
            const res = await fetch(`<c:url value="/api/likes?postId=\${postId}" />`);
            const json = await res.json();



            if (json.isLike) {
                icon.classList.remove("bi-suit-heart");
                icon.classList.add("bi-suit-heart-fill");
            } else {
                icon.classList.remove("bi-suit-heart-fill");
                icon.classList.add("bi-suit-heart");
            }


            btnLike.querySelector('span').innerHTML = json.numberOfLikes;
        </c:if>
        <c:if test="${empty user}">
            window.location.replace("${pageContext.request.contextPath}/auth/sign-in");
        </c:if>

    }

</script>