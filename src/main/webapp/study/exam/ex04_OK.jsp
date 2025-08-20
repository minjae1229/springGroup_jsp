<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>ex04_OK.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h1>이곳은 회원 페이지입니다.</h1>
  <p>이곳에는 회원 정보들이 표시될 예정입니다.</p>
  
  <input type="button" value="로그아웃(돌아가기)" 
       onclick="location.href='<%= request.getContextPath() %>/study/exam/ex04.jsp'">
</div>
<p><br/></p>
</body>
</html>