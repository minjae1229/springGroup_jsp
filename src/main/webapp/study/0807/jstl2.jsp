<%@page import="study.j0806.T12VO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  String str = "Welcome to My Homepage!!!";
  pageContext.setAttribute("str", str);
  
  String[] hobbys = {"등산","낚시","수영","독서","바둑","승마","바이크","수집","영화감상"};
  pageContext.setAttribute("hobbys", hobbys);
  
  ArrayList<T12VO> vos = new ArrayList<T12VO>();
  
  T12VO vo = null;
  
  vo = new T12VO();
  vo.setName("홍길동");
  vo.setAge(25);
  vo.setGender("남자");
  vo.setJob("학생");
  vo.setAddress("서울");
  vos.add(vo);
  
  //request.setAttribute("vo", vo);
  pageContext.setAttribute("vo", vo);
  
  vo = new T12VO();
  vo.setName("김말숙");
  vo.setAge(33);
  vo.setGender("여자");
  vo.setJob("회사원");
  vo.setAddress("청주");
  vos.add(vo);
  vo = new T12VO();
  vo.setName("이기자");
  vo.setAge(30);
  vo.setGender("남자");
  vo.setJob("공무원");
  vo.setAddress("제주");
  vos.add(vo);
  
  vo = new T12VO();
  vo.setName("소나무");
  vo.setAge(53);
  vo.setGender("여자");
  vo.setJob("군인");
  vo.setAddress("인천");
  vos.add(vo);
  
  vo = new T12VO();
  vo.setName("고인돌");
  vo.setAge(13);
  vo.setGender("남자");
  vo.setJob("학생");
  vo.setAddress("청주");
  vos.add(vo);
  
  pageContext.setAttribute("vos", vos);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>jstl2.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>JSTL Function</h2>
  <pre>
    function라이브러리 : $ { fn:함수명()}
  </pre>
  <div>
    str 변수값? ${str}<br/>
    1.str 길이? <%=str.length() %> / ${fn:length(str)}<br/>
    2.vos 길이? <%=vos.size()%> / ${fn:length(vos)}<br/>
    3.대문자? <%=str.toUpperCase()%> / ${fn:toUpperCase(str)}<br/>
    4.소문자? <%=str.toLowerCase()%> / ${fn:toLowerCase(str)}<br/>
    5-1.문자열추출 <%=str.substring(0,5) %> / ${fn:substring(str, 0, 5)}<br/>
    5-2.문자열추출 <%=str.substring(5) %> / ${fn:substring(str, 5, -1)}<br/>
    6-1.문자열검색 <%=str.indexOf("o") %> / ${fn:indexOf(str,'o')}<br/>
    6-2.문자열검색 <%=str.lastIndexOf("o") %> / 없음<br/>
    6-3.str에서 'o'문자의 모든 위치 탐색<br/>
    <c:set var="cnt" value="0"/>
    <c:forEach var="i" begin="0" end="${fn:length(str)-1}">
      <c:if test="${fn:substring(str,i,i+1) == 'o'}">
        <c:set var="cnt" value="${cnt+1}"/>
        ${i}번째 값은? ${fn:substring(str, i, i+1)}<br/>
      </c:if>
    </c:forEach>
    'o' 문자는 ${cnt}번 들어있습니다.<br/>
    
    6-4 'o' 문자는 뒤에서 몇번째 일까요?<br/>
    6-5 'o' 문자를 찾고 그 다음부터 출력 ${fn:substringAfter(str,'o')}<br/>
    6-5 'o' 문자를 찾고 그 앞을 출력 ${fn:substringBefore(str,'o')}<br/>
    
    7.문자열분리(split())
    <c:set var="positions" value="${fn:split(str,'o')}"/>
    <c:forEach var="p" items="${positions}" varStatus="st">
      ${st.count} : ${p}<br/>
    </c:forEach>
    
    7-1. str 내부 'o'의 개수는? ${fn:length(positions)-1 }<br/>
    
    8.치환 replace() : 'o' 문자를 'O'로 변경?
    <%=str.replace('o', 'O') %> / ${fn:replace(str,'o','O')}<br/>
    
    9-1.문자열포함유무 contains() 'my' 포함 유무? &{fn:contains(str, 'My')}<br/>
    9-1.문자열포함유무 contains() 'my' 포함 유무? &{fn:contains(str, 'my')}<br/>
    
    
    
    
  </div>
  
</div>
<p><br/></p>
</body>
</html>