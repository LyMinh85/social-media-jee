<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<%@include file="particle/header.jsp" %>

<body class="bg-body-tertiary">

<%@include file="particle/navbar.jsp" %>


<main class="container-fluid" style="margin-top: 6rem;">
    <div class="col-md-3 card text-center position-fixed ms-5">
        <div class="card-body shadow-sm">
            <h5 class="card-title">Special title treatment</h5>
            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-5 d-flex flex-column">

            <div class="card mb-2 shadow-sm">
                <div class="card-body">
                    <div class="d-flex flex-start w-100">
                        <img class="rounded-circle shadow-1-strong me-3"
                             src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(19).webp" alt="avatar"
                             width="40"
                             height="40"/>
                        <div class="form-outline w-100">

                            <div class="input-group">
                                <button class="z-0 btn btn-light rounded-5 w-100 text-start border border-1"
                                        type="button" data-bs-toggle="modal" data-bs-target="#modal-new-post"
                                >
                                    Đăng bài mới
                                </button>
                            </div>
                        </div>

                        <!--                    End card -->
                    </div>
                </div>
            </div>


            <div class="card mb-2 shadow-sm">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <a href="#" class="d-block link-body-emphasis text-decoration-none">
                            <img src="https://github.com/mdo.png" alt="mdo" width="40" height="40"
                                 class="rounded-circle">
                        </a>
                        <div class="d-flex flex-column ms-2 text-start">
                            <h6 class="card-title m-0">Mèo lười</h6>
                            <h6 class="fw-normal fs-6 text-secondary m-0">5 giờ trước</h6>
                        </div>
                    </div>
                    <p class="card-text">
                        Some quick example text to build on the card title and make up the bulk of the card's content.
                        Some quick example text to build on the card title and make up the bulk of the card's content.
                        Some quick example text to build on the card title and make up the bulk of the card's content.
                    </p>
                    <hr class="my-1"/>
                    <div class="d-flex flex-row justify-content-between gap-2 my-0">
                        <button class="btn btn-light fw-bold flex-fill ">
                            <i class="bi bi-heart"></i>
                            164k
                        </button>

                        <button class="btn btn-light fw-bold flex-fill">
                            <i class="bi bi-chat-text"></i>
                            400
                        </button>

                        <button class="btn btn-light fw-bold flex-fill">
                            <i class="bi bi-box-arrow-up"></i>
                            Share
                        </button>
                    </div>
                    <hr class="my-1"/>

                    <!--      Comments              -->
                    <div class="row d-flex mt-2">
                        <div class="col">
                            <p>
                                <a href="#"
                                   class="link-offset-1 link-offset-1-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover">
                                    Xem thêm bình luận
                                </a>
                            </p>

                            <div class="d-flex flex-start mb-2">
                                <img class="rounded-circle shadow-1-strong me-3"
                                     src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(31).webp" alt="avatar"
                                     width="40"
                                     height="40"/>
                                <div class="card p-0 w-100 bg-body-tertiary  border-0">
                                    <div class="card-body p-2">
                                        <div>
                                            <h6 class="card-title m-0">Mindy Campbell
                                                <i class="bi bi-dot"></i>
                                                <span class="fw-normal text-secondary small">5 hours ago</span>
                                            </h6>

                                            <p>
                                                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Delectus
                                                cumque doloribus dolorum dolor repellat nemo animi at iure autem fuga
                                                cupiditate architecto ut quam provident neque, inventore nisi eos quas?
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="d-flex flex-start mb-2">
                                <img class="rounded-circle shadow-1-strong me-3"
                                     src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(31).webp" alt="avatar"
                                     width="40"
                                     height="40"/>
                                <div class="card p-0 w-100 bg-body-tertiary border-0">
                                    <div class="card-body p-2">
                                        <div>
                                            <h6 class="card-title m-0">Mindy Campbell
                                                <i class="bi bi-dot"></i>
                                                <span class="fw-normal text-secondary small">5 hours ago</span>
                                            </h6>

                                            <p>
                                                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Delectus
                                                cumque doloribus dolorum dolor repellat nemo animi at iure autem fuga
                                                cupiditate architecto ut quam provident neque, inventore nisi eos quas?
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--   End list comment -->

                        </div>


                    </div>

                    <hr class="my-1"/>

                    <div class="card-footer p-0 pt-2 border-0 bg-transparent">
                        <div class="d-flex flex-start w-100">
                            <img class="rounded-circle shadow-1-strong me-3"
                                 src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(19).webp" alt="avatar"
                                 width="40"
                                 height="40"/>
                            <div class="form-outline w-100">

                                <div class="input-group mb-3">
                                    <textarea type="text" class="rounded-5 form-control bg-body-tertiary pe-5"
                                              placeholder="Recipient's username" rows="2"></textarea>
                                    <button class="btn btn-primary btn-sm top-50 position-absolute end-0 rounded-circle translate-middle"
                                            style="z-index: 6"
                                            type="button" id="button-addon2">
                                        <i class="bi-send-arrow-down-fill"></i>
                                    </button>
                                </div>
                            </div>

                            <!--                    End card -->
                        </div>
                    </div>


                    <!--            End -->
                </div>


            </div>

        </div>
    </div>
</main>

<!-- Modal -->
<div class="modal fade" id="modal-new-post" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <form action="<c:url value="/posts/create"/>" class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Tạo bài viết</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="d-flex align-items-center mb-2">
                    <a href="#" class="d-block link-body-emphasis text-decoration-none">
                        <img src="https://github.com/mdo.png" alt="mdo" width="40" height="40"
                             class="rounded-circle">
                    </a>
                    <div class="d-flex flex-column align-items-center ms-2 text-start">
                        <h6 class="card-title m-0">Mèo lười</h6>
                        <h6 class="fw-normal fs-6 text-secondary m-0">Công khai</h6>
                    </div>
                </div>


                <textarea name="content" type="text" class="form-control bg-body-tertiary pe-5"
                          placeholder="Nội dung bài đăng" rows="5" res></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-primary">Đăng</button>
            </div>
        </form>
    </div>
</div>


<script>

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@algolia/autocomplete-js"></script>


<script type="module">
    const {autocomplete} = window['@algolia/autocomplete-js'];



    autocomplete({
        container: '#autocomplete',
        placeholder: 'Tìm kiếm',
        insights: true,
        getSources() {
            return [
                {
                    sourceId: 'users',
                    async getItems({query}) {
                        const res = await fetch(`${pageContext.request.contextPath}/api/users?q=\${query}`);
                        const data = await res.json();
                        console.log(data);
                        return data;
                    },
                    getItemUrl({item}) {
                        return `${pageContext.request.contextPath}/users/profile?id=\${item.id}`;
                    },
                    templates: {
                        header({items, html}) {
                            if (items.length === 0) {
                                return null;
                            }

                            return html`<span class="aa-SourceHeaderTitle">Mọi người</span>
                        <div class="aa-SourceHeaderLine"/>`;
                        },
                        item({item, components, html}) {
                            const url = `${pageContext.request.contextPath}/users/profile?id=\${item.id}`;
                            return html`
                                <a class="aa-ItemWrapper text-decoration-none" href="\${url}">
                                    <div class="aa-ItemContent">
                                        <div style="width: 40px; height: 40px;">
                                            <img
                                                    class="rounded-circle"
                                                width="40" height="40" alt=""
                                                src="https://scontent.fsgn2-9.fna.fbcdn.net/v/t1.30497-1/143086968_2856368904622192_1959732218791162458_n.png?_nc_cat=1&ccb=1-7&_nc_sid=2b6aad&_nc_ohc=dq56nTg8VhUAX-bh_XN&_nc_ht=scontent.fsgn2-9.fna&oh=00_AfAEa4WB4xE0WxbDlFwjeJTZ07mvORnafJYc0MOs64hnwQ&oe=658AB138"
                                            />
                                        </div>
                                        <div class="aa-ItemContentBody">
                                            <div class="aa-ItemContentTitle">
                                                \${components.Highlight({
                                                hit: item,
                                                attribute: 'username',
                                                })}
                                            </div>
                                            <div class="aa-ItemContentDescription">
                                                Bạn bè
                                                \${components.Snippet({
                                                  hit: item,
                                                  attribute: 'description',
                                                })}
                                            </div>
                                        </div>
                                    </div>
                                </a>`;
                        },
                    },
                },
            ];
        },
    });
</script>

</body>


</html>