<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie" %>
<%
  String savedId ="";
  Cookie[] cookies = request.getCookies();
  if(cookies != null) {
    for(Cookie c : cookies) {
      if("savedId".equals(c.getName())) {
        savedId = c.getValue();
        break;
      }
    }
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>ex04.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container mt-4">
  <h2>로그인</h2>
  <form name="myform" method="post" action="<%= request.getContextPath() %>/exam/EX04">
    <label>아이디: </label>
    <input type="text" name="id" value="<%= savedId %>" autocomplete="off"/><br/>
    <label>비밀번호: </label>
    <input type="password" name="pwd"/><br/>
    <input type="checkbox" name="saveId" <%= !savedId.isEmpty() ? "checked" : "" %>/> 아이디 저장<br/>
    <input type="submit" value="로그인"/>
  </form>
  <%
    String msg = request.getParameter("msg");
    if(msg != null){
      out.println("<p style='color:red;'>"+msg+"</p>");
    }
  %>
  
</div>
<p><br/></p>
</body>
</html>