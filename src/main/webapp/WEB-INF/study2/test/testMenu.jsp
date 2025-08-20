<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>testMenu.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <p><a href="${ctp}/study2/Test1">test1</a></p>
  <p><a href="${ctp}/study2/Test2">test2</a></p>
  <p><a href="${ctp}/study2/T3">test3</a></p>
  <p><a href="${ctp}/study2/T4">test4</a></p>
  <p><a href="${ctp}/study2/filter/T1_filter">T1_fILTER</a></p>
  <p><a href="${ctp}/study2/init/login">init login 테스트1</a></p>
  <p><a href="${ctp}/javaGroup">init login 테스트2</a></p>
  <p><a href="${ctp}/study2/login/Login">init login 테스트3</a></p>
  <p><a href="${ctp}/study2/password/PassForm">암호화 테스트</a></p>
  <p><a href="${ctp}/study2/ajax/AjaxMenu">aJax 테스트</a></p>
</div>
<p><br/></p>
</body>
</html>