<%--@elvariable id="user" type="com.example.socialmedia.entity.User"--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<nav class="navbar navbar-expand-md bg-body-tertiary fixed-top gradient-bg shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand d-md-none d-flex align-items-center" href="#">
            <svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor"
                 class="bi bi-bootstrap-fill" viewBox="0 0 16 16">
                <path d="M6.375 7.125V4.658h1.78c.973 0 1.542.457 1.542 1.237 0 .802-.604 1.23-1.764 1.23H6.375zm0 3.762h1.898c1.184 0 1.81-.48 1.81-1.377 0-.885-.65-1.348-1.886-1.348H6.375v2.725z"/>
                <path d="M4.002 0a4 4 0 0 0-4 4v8a4 4 0 0 0 4 4h8a4 4 0 0 0 4-4V4a4 4 0 0 0-4-4h-8zm1.06 12V3.545h3.399c1.587 0 2.543.809 2.543 2.11 0 .884-.65 1.675-1.483 1.816v.1c1.143.117 1.904.931 1.904 2.033 0 1.488-1.084 2.396-2.888 2.396H5.062z"/>
            </svg>
            <span class="ms-1">
                FaceCat
            </span>

        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end gradient-bg" tabindex="-1" id="offcanvasNavbar"
             aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Offcanvas</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-between flex-grow-1">
                    <li class="nav-item">
                        <a class="navbar-brand mb-0 py-0 d-none d-md-flex align-items-center" href="<c:url value="/home"/>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor"
                                 class="bi bi-bootstrap-fill" viewBox="0 0 16 16">
                                <path d="M6.375 7.125V4.658h1.78c.973 0 1.542.457 1.542 1.237 0 .802-.604 1.23-1.764 1.23H6.375zm0 3.762h1.898c1.184 0 1.81-.48 1.81-1.377 0-.885-.65-1.348-1.886-1.348H6.375v2.725z"/>
                                <path d="M4.002 0a4 4 0 0 0-4 4v8a4 4 0 0 0 4 4h8a4 4 0 0 0 4-4V4a4 4 0 0 0-4-4h-8zm1.06 12V3.545h3.399c1.587 0 2.543.809 2.543 2.11 0 .884-.65 1.675-1.483 1.816v.1c1.143.117 1.904.931 1.904 2.033 0 1.488-1.084 2.396-2.888 2.396H5.062z"/>
                            </svg>
                            <span class="ms-1">
                                FaceCat
                            </span>
                        </a>
                    </li>
                    <li class="nav-item" style="width: 500px; min-width: 200px;">
                        <form class="d-block d-md-none col-12 col-lg-auto my-2"
                              style="max-width: 200px;"
                              role="search">
                            <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
                        </form>
                        <div class="d-none d-md-block col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 w-100" role="search">
                            <div id="autocomplete"></div>
                        </div>
                    </li>
                    <li class="nav-item d-flex">

                        <c:choose>
                            <c:when test="${not empty user}">
                                <div class="dropdown text-end align-self-center">
                                    <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle"
                                       data-bs-toggle="dropdown" aria-expanded="false">
                                        <img src="
                                        <c:url value="${user.avatarImage.image.url}" />" alt="mdo" width="32" height="32"
                                             class="rounded-circle">
                                    </a>
                                    <ul class="dropdown-menu text-small dropdown-menu-end" style="">
                                        <li><a class="dropdown-item" href="<c:url value="/users/profile?id=${user.id}"/>">Trang cá nhân</a></li>
                                        <li><a class="dropdown-item" href="<c:url value="/auth/sign-out"/>">Thoát</a></li>
                                    </ul>
                                </div>
                            </c:when>
                            <c:when test="${empty user}">
                                <div class="align-self-center">
                                    <a type="button" class="btn btn-primary"
                                        href="<c:url value="/auth/sign-in"/>"
                                    >
                                        Đăng nhập
                                    </a>
                                    <a type="button" class="btn btn-secondary"
                                        href="<c:url value="/auth/sign-up"/>"
                                    >
                                        Đăng ký
                                    </a>
                                </div>

                            </c:when>
                        </c:choose>


                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>