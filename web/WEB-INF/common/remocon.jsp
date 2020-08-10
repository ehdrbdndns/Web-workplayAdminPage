<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.Quick" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="services.QuickService" %><%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-08-03
  Time: 오후 7:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Quick> quicks = new QuickService().selectQuick();
    request.setAttribute("quicks", quicks);
%>
<!--TODO Remocon-->
<div id="MOVE_TOP_BTN">
    <c:forEach items="${quicks}" var="quick" varStatus="status">
        <c:choose>
            <c:when test="${quick.img eq null || quick.url eq null || quick.text eq null}"></c:when>
            <c:otherwise>
                <div class="remocon-section bg-main-orange" onclick="new function() {
                  location.href='${quick.url}'
                }"
                     style="background-image: url('<%=request.getContextPath()%>${quick.img}')">
                    <div class="remocon-item" style="background-color: rgba(0,0,0,.3)">
                        <a class="h6" target="_blank" href="${quick.url}">${quick.text}</a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>