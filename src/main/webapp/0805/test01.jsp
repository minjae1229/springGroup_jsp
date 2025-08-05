<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>test01.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>JSP 기본문법</h2>
  <!--  이곳은 HTML 주석입니다. -->
  <%-- 이곳은 JSP 주석입니다. --%>
  <%--
    <%@ 디렉티브(directive) %>
    
    <% 스크립틀렛(scriptlet) : jsp 문서안에 서플릿코드 사용시 %>
    
    <%= 표현식(expression) : 변수값을 출력할때 사용 %>
    
    <%! 선언문(declaration) %> : 변수, 함수 선언
    
  --%>
  <%!
    public int hap(int su) {
      int hap = 0;
      for(int i=1; i<=su; i++){
        hap += i;
      }
      return hap;
    }
  %>
  <%
    int tot = 0;
    for(int i=1; i<=100; i++){
      tot += i;
    }
    //out.println("1~100 까지의 합은 : " +tot);
  %>
  1~100까지의 합은 <%=tot %> 입니다.
  <br>
  <%
    int res = hap(20);
    out.println("<font color='red'><b>1~20까지의 합은 : " +res+"</b></font>");
    res = hap(100);
    out.println("<p style='font-size:20pt'; font-weight:bold>1~20까지의 합은 : " +res+"</p>");
    /* 스파게티 코드 (이것저것 섞여있음...) */
    out.println("<p><input type='button' value='전송' onclick='alert(\"안녕하세요!\")' class='btn btn-success' /></p>");
    System.out.println("결과 : " +res);
    
  %>
</div>
<p><br/></p>
</body>
</html>