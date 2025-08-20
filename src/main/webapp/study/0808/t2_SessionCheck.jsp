<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>

<%
  String sessionName ="";

  // iterator 형식으로 꺼내야 함.
  Enumeration enumCK = session.getAttributeNames();
  
  while(enumCK.hasMoreElements()) { // 원소가 있으면 참
    sessionName = enumCK.nextElement().toString();
  
    System.out.println(sessionName + " / " +session.getAttribute(sessionName));
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>t2_SessionCheck.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>세션값 출력</h2>
  <!-- E90893C2978E26D7C51B118A06F2F11B -->
  <p>세션 고유번호 : <%=session.getId() %></p>
  <p>아이디 : ${sMid}</p>
  <p>닉네임 : ${sNickName }</p>
  <p>성명 : ${sName}</p>
  <hr/>
<%
  long createTime = session.getCreationTime();
  Date createDate = new Date(createTime);
  long lastTime = session.getLastAccessedTime();
  Date lastDate = new Date(lastTime);
  
  long usedTime = lastTime - createTime; // 머문시간
%>
  <p>현재 세션이 생성된 시간은? <%=createDate%></p>  
  <p>현재 세션이 종료된 시간은? <%=lastDate%></p>  
  <p>현재 세션이 머문 시간은? <%=usedTime/(1000 * 60)%>분</p>  
  <p>현재 세션의 유효시간? <%=session.getMaxInactiveInterval()/60%>분</p>  
  <hr/>
  <p><a href="t2_Session.jsp" class="btn btn-success">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>