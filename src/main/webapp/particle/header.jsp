<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Home</title>
  <%@include file="../bootstrap/css.jsp" %>
  <%@include file="../bootstrap/icon.jsp" %>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@algolia/autocomplete-theme-classic" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css" type="text/css">

  <style>
    .uppercase-first-letter:first-letter {
      text-transform: uppercase;
    }
  </style>
</head>