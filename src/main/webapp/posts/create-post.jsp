<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--@elvariable id="user" type="com.example.socialmedia.entity.User"--%>
<!DOCTYPE html>
<html>

<%@include file="../particle/header.jsp" %>

<body class="bg-body-tertiary">

<%@include file="../particle/navbar.jsp" %>


<main class="container-fluid" style="margin-top: 6rem;">
  <div class="row justify-content-center">
    <div class="col-md-5 d-flex flex-column">

      <div class="card mb-2 shadow-sm">
        <div class="card-body">
          <form id="form-create-post" action="<c:url value="/posts/create"/>" method="post" class="d-flex flex-start flex-column w-100">

            <div class="d-flex align-items-center mb-2">
              <a href="#" class="d-block link-body-emphasis text-decoration-none">
                <img src="
                <c:url value="${user.avatarImage.image.url}" />" alt="mdo" width="40" height="40"
                     class="rounded-circle">
              </a>
              <div class="d-flex flex-column align-items-start ms-2 text-start">
                <h6 class="fw-medium m-0">${user.username}</h6>
                <h6 class="fw-normal fs-6 text-secondary m-0">Công khai</h6>
              </div>
            </div>

            <div class="form-floating">
              <textarea name="content" class="form-control" placeholder="Điền vào đây" id="floatingTextarea" style="height: 100px"></textarea>
              <label for="floatingTextarea">Nội dung bài viết</label>
              <custom:validationErrors field="content" violations="${violations}"/>
            </div>

            <div class="d-flex justify-content-end my-1 gap-2">
              <a href="<c:url value="/home"/>" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</a>
              <button type="submit" class="btn btn-primary submit-form">Đăng</button>
            </div>

            <!--                    End card -->
          </form>
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


<script type="module">
  const {autocomplete} = window['@algolia/autocomplete-js'];

  document.addEventListener("DOMContentLoaded", function (event) {
    const listInputGroup = document.querySelectorAll("#form-create-post");
    listInputGroup.forEach(inputGroup => {
      if (inputGroup.querySelector(".invalid-feedback") !== null) {
        inputGroup.querySelector(".form-floating").classList.add("is-invalid");
        inputGroup.querySelector(".form-control")?.classList.add("is-invalid");
        inputGroup.querySelector(".form-select")?.classList.add("is-invalid");
      }
    });
  });


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