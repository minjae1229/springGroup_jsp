<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--
  성적자료를 입력받아(html form tag) -> 추가 버튼을 누르면 하면 한 줄씩 출력, 내용은 배열에 저장.
  받은 데이터를 servlet으로 이동 후 view에서 출력. 
                 
  view) 총점, 평균, 학점, 순위 를 구해서 출력하시오.
  
  (동적폼을 만들어서 여러개 입력받을수 있도록 처리)
  
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