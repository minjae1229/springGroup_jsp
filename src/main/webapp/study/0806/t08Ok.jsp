<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>t08Ok.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>전송 결과(입력결과 확인)</h2>
  <p>성명: <%= request.getAttribute("name") %></p>
  <p>나이: <%= request.getAttribute("age") %></p>
  <p>성별: <%= request.getAttribute("gender") %></p>
  <p>성별: <%= request.getAttribute("gender") %></p>
  <p>취미: <%= request.getAttribute("hobby") %></p>
  <p>직업: <%= request.getAttribute("job") %></p>
  <p>가본 산: <%= request.getAttribute("mountain") %></p>
  <p>자기소개:</p>
  <div class="border p-3 bg-light">
    <%= request.getAttribute("content") %>
  </div>
  <p>첨부파일명: <%= request.getAttribute("fileName") %></p>

  <p class="mt-4">
    <input type="button" value="돌아가기" onclick="history.back()" class="btn btn-secondary">
  </p>
</div>
<p><br/></p>
</body>
</html>