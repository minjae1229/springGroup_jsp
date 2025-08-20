<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="study.exam.EX03VO"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ex03_2_OK.jsp</title>
  <jsp:include page="/include/bs5.jsp" />
</head>
<body>
<div class="container mt-4 text-center">
  <h2 class="mb-4">성적 결과</h2>

<%
    List<EX03VO> students = (List<EX03VO>) request.getAttribute("students");
    if(students != null && !students.isEmpty()){
%>

  <table class="table table-striped table-bordered table-hover">
    <thead class="table-dark">
      <tr>
        <th>순위</th>
        <th>이름</th>
        <th>국어</th>
        <th>영어</th>
        <th>수학</th>
        <th>총점</th>
        <th>평균</th>
        <th>학점</th>
      </tr>
    </thead>
    <tbody>
<%
        for(EX03VO s : students){
%>
      <tr>
        <td><%= s.getRank() %></td>
        <td><%= s.getName() %></td>
        <td><%= s.getKor() %></td>
        <td><%= s.getEng() %></td>
        <td><%= s.getMat() %></td>
        <td><%= s.getTotal() %></td>
        <td><%= String.format("%.2f", s.getAvg()) %></td>
        <td><%= s.getGrade() %></td>
      </tr>
<%
        }
%>
    </tbody>
  </table>
<%
    } else {
%>
  <p>출력할 성적이 없습니다.</p>
<%
    }
%>

  <div class="mt-3">
    <input type="button" value="돌아가기" onclick="history.back()" class="btn btn-secondary"/>
  </div>

</div>
</body>
</html>
