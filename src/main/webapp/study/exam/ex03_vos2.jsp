<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--
  성적자료를 입력받아(html form tag) -> 추가 버튼을 누르면 하면 한 줄씩 출력, 내용은 배열에 저장.
  받은 데이터를 servlet으로 이동 후 view에서 출력. 
                 
  java script 배열을 이용해서 배열명을 서버로 넘겨서 처리 후 출력.
  
 --%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>ex03_vos.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="">
  
  </form>
  
  <div id="demo"></div>
</div>
<p><br/></p>
</body>
</html>