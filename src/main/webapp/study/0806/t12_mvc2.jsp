<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>t12_mvc2.jsp</title>
  <script>
  	'use strict';
  	function fCheck() {
  	  const form = document.myform;
  	  
  	  const name = form.name.value.trim();
  	  const age = form.age.value.trim();
  	  // const gender = form.gender.value;
  	  const hobbys = form.querySelectorAll('input[name="hobby"]:checked');
  	  const job = form.job.value;
  	  const mountains = form.mountain.selectedOptions;
  	  const content = form.content.value.trim();
  	  const file = form.fileName.value;
  	  
  	  // 1. 성명 체크
			if(name === ""){
			  alert("성명을 입력하세요.");
			  form.name.focus();
			  return;
			}
			// 2. 나이 체크
			if(age === ""){
			  alert("나이를 입력하세요.");
			  form.age.focus();
			  return;
			}
			const ageNum = Number(age);
			if(isNaN(ageNum) || ageNum < 1 || ageNum > 150){
			  alert("나이를 1~150 사이의 숫자로 입력하세요.");
			  form.age.focus();
			  return;
			}
			// 3. 성별 체크
			if(!form.gender[0].checked && !form.gender[1].checked){
			  alert("성별을 선택하세요.");
			  return;
			}
			// 4. 취미 체크
			if(hobbys.length === 0){
			  alert("취미를 1개 이상 선택하세요."); // 1개 이상은 선택하자.
			  return;
			}
			// 5. 직업 체크
			if(job === ""){
			  alert("직업을 선택하세요.");
			  form.job.focus();
			  return;
			}
			// 6.가본산 체크
			if(mountains.length === 0){
			  alert("가본 산을 1개 이상 선택하세요.");
			  return;
			}
			// 7. 자기소개 체크
			if(content === ""){
			  alert("자기소개를 입력하세요.");
			  form.content.focus();
			  return;
			}
			// 8. 첨부파일 체크
			if(file === "") {
			  alert("첨부파일을 선택하세요.");
			  return;
			}
			
			// 모든 조건 통과 시 submit
			form.submit();
  	} //end of fCheck()
  </script>
</head>

<body>
<p><br/></p>
<div class="container">
  <h2>값 전송 연습</h2>
  <form name="myform" method="post" action="<%=request.getContextPath()%>/j0806/T12">
    <div class="mb-3">성명
      <input type="text" name="name" value="홍길동" class="form-control mb-3" autofocus required />
    </div>
    <div class="mb-3">나이
      <input type="number" name="age" value="20" class="form-control mb-3" />
    </div>
    <div class="mb-3">성별 &nbsp;&nbsp;
      <input type="radio" name="gender" value="남자" class="me-1" />남자 &nbsp;
      <input type="radio" name="gender" value="여자" class="me-1" checked />여자
    </div>
    <div class="mb-3"> 취미 &nbsp;&nbsp;
      <input type="checkbox" name="hobby" value="등산" class="me-1" />등산 &nbsp;
      <input type="checkbox" name="hobby" value="낚시" class="me-1" />낚시 &nbsp;
      <input type="checkbox" name="hobby" value="바둑" class="me-1" />바둑 &nbsp;
      <input type="checkbox" name="hobby" value="수영" class="me-1" />수영 &nbsp;
      <input type="checkbox" name="hobby" value="배드민턴" class="me-1" />배드민턴 &nbsp;
      <input type="checkbox" name="hobby" value="바이크" class="me-1" />바이크
      <div class="mb-3">직업
      <select name="job" class="form-control">
        <option value="">선택</option>
        <option>회사원</option>
        <option>공무원</option>
        <option>군인</option>
        <option>의사</option>
        <option>자영업</option>
        <option>가사</option>
      </select>
    </div>
    <div class="mb-3">가본산
      <select name="mountain" size="5" multiple class="form-control">
        <option>백두산</option>
        <option>한라산</option>
        <option>태백산</option>
        <option>소백산</option>
        <option>금강산</option>
        <option>우암산</option>
        <option>속리산</option>
        <option>대둔산</option>
      </select>
    </div>
    <div class="mb-3">자기소개
      <textarea rows="6" name="content" class="form-control"></textarea>
    </div>
    <div class="mb-3">첨부파일
      <input type="file" name="fileName" class="form-controL border"/>
    </div>
    </div>
    <div class="row">
      <!-- <div class="col"><input type="submit" value="전송(submit)" class="btn btn-success"/></div> -->
      <div class="col"><input type="button" value="전송(button)" onclick="fCheck()" class="btn btn-success"/></div>
      <div class="col text-end"><input type="reset" value="다시입력" class="btn btn-warning"/></div>
    </div>
  </form>
</div>
<p><br/></p>
</body>
</html>