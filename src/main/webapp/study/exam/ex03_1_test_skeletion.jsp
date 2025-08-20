<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ex3-1 test</title>
  <jsp:include page="/include/bs5.jsp" />
  <script>
    'use strict';
    
  </script>
</head>
<body>
<div class="container mt-4">
  <h2>성적 입력</h2>
  <form name="myform" action="#" method="post">
    <div class="mb-3">이름
      <input type="text" name="name" class="form-control" autofocus required />
    </div>
    <div class="mb-3">국어점수
      <input type="number" name="kor" class="form-control" required />
    </div>
    <div class="mb-3">영어점수
      <input type="number" name="eng" class="form-control" required />
    </div>
    <div class="mb-3">수학점수
      <input type="number" name="mat" class="form-control" required />
    </div>
    <div class="mb-3 d-flex gap-2">
      <input type="button" value="추가" onclick="fCheck()" class="btn btn-success flex-fill"/>
      <input type="reset" value="다시입력" class="btn btn-warning flex-fill"/>
      <input type="button" value="한줄 지우기" onclick="deleteLine()" class="btn btn-danger flex-fill"/>
    </div>
  </form>
  <div id="demo"></div>
</div>
</body>
</html>
