<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
  String[] cards ={"국민","BC","LG","현대","삼성","농협","BC"};
  pageContext.setAttribute("cards", cards);
  
  String[][] members ={
      {"홍길동","25","서울"},
      {"김말숙","33","청주"},
      {"이기자","19","제주"},
      {"강감찬","55","광주"},
      {"김연아","19","서울"}
  };
  pageContext.setAttribute("members", members);
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>ex02.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
   <h3>1. 구구단 5단</h3>
  <c:forEach var="i" begin="1" end="9">
    5 X ${i} = ${5*i} <br>
  </c:forEach>
  <hr/>

  <h3>2. 구구단 3~5단</h3>
  <c:forEach var="dan" begin="3" end="5">
    <b>${dan}단</b><br>
    <c:forEach var="i" begin="1" end="9">
      ${dan} X ${i} = ${dan*i} <br>
    </c:forEach>
    <br>
  </c:forEach>
  <hr/>

  <h3>3. member 배열('서울' 빨간색 ) </h3>
  <table border="1">
    <c:forEach var="m" items="${members}" varStatus="st">
      <tr>
      <td>
        ${m[0]} / ${m[1]} /
        <span style="color:${m[2].contains('서울') ? 'red' : 'black'}">
          ${m[2]}
        </span>
      </td>
      </tr>
    </c:forEach>
  </table>
  <hr/>
  
  <h3>4. member 배열('25세 미만' 굵은 파란색) </h3>
  <table border="1">  
    <c:forEach var="m" items="${members}">
      <tr>
        <td>${m[0]} / </td>
        <td style="${m[1] < 25 ? 'font-weight:bold; color:blue;' : ''}">
          ${m[1]}
        </td>
        <td> / ${m[2]}</td>
      </tr>
    </c:forEach>
  </table>
  <hr/>
  
  <h3>5.카드목록</h3>
  <pre>
    (첫 카드 배경색: 노랑색 / 마지막 카드 배경색: 파란색)
  </pre>
  <c:forEach var="card" items="${cards}" varStatus="st">
    <span style="
      background-color:
      ${st.first ? 'yellow' : (st.last ? 'skyblue' : 'white')};
      padding:5px;">
      ${card} &nbsp;
    </span>
  </c:forEach>
  <hr/>
  
  <h3>6.카드목록</h3>
  <pre>
    (첫 카드 배경색: 노랑색 / 마지막 카드 배경색: 파란색)<br/>
    (국민카드 글자색: 파란색 / 삼성카드 글자색: 빨간색)
  </pre>
  <c:forEach var="card" items="${cards}" varStatus="st">
    <span style="
      background-color:
        ${st.first ? 'yellow' : (st.last ? 'skyblue' : 'white')};
      color:
        ${card eq '국민' ? 'blue' : (card eq '삼성' ? 'red' : 'black')};
      padding:5px;">
      ${card} &nbsp;
    </span>
  </c:forEach>
</div>
<p><br/></p>
</body>
</html>