<%@ tag description="Display validation error messages for a specific field" pageEncoding="UTF-8"%>
<%@ attribute name="field" required="true" type="java.lang.String" %>
<%@ attribute name="violations" required="true" type="java.util.Set" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="errorFlag" value="false" />
<c:forEach var="violation" items="${violations}">
    <c:if test="${violation.propertyPath.toString() == field}">
        <c:set var="errorFlag" value="true" />
        <c:set var="invalidMessage" value="${violation.message}" />
    </c:if>
</c:forEach>

<c:if test="${errorFlag}">
    <div class="invalid-feedback">
        ${invalidMessage}
    </div>
</c:if>
