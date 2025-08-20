<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--
  성적자료를 입력받아(html form tag) -> 추가 버튼을 누르면 하면 한 줄씩 출력, 내용은 배열에 저장.
  받은 데이터를 servlet으로 이동 후 view에서 출력.
  java script 배열을 이용해서 배열명을 서버로 넘겨서 처리 후 출력.
  view) 총점, 평균, 학점, 순위 를 구해서 출력하시오.
  (동적폼을 만들어서 여러개 입력받을수 있도록 처리)
 --%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>ex03_vos1.jsp</title>
  <script>
    'use strict';
    let names = [], kors = [], engs= [], mats = [];
    let lineCount = 1;
    
    // 입력 체크
    function fCheck() {
      const form = document.myform;
      
      const name = form.name.value.trim();
      const kor = form.kor.value.trim();
      const eng = form.eng.value.trim();
      const mat = form.mat.value.trim();
      
      if(name === "") {
        alert("이름을 입력하세요.");
        form.name.focus();
        return;
      }
      
      if(kor === "") {
        alert("국어점수를 입력하세요.");
        form.kor.focus();
        return;
      }
      const korNum = Number(kor);
      if(isNaN(korNum) || korNum < 0 || korNum > 100) {
        alert("국어점수가 올바르지 않습니다.");
        form.kor.focus();
        return;
      }
      
      if(eng === "") {
        alert("영어점수를 입력하세요.");
        form.eng.focus();
        return;
      }
      const engNum = Number(eng);
      if(isNaN(engNum) || engNum < 0 || engNum > 100) {
        alert("영어점수가 올바르지 않습니다.");
        form.eng.focus();
        return;
      }
      
      if(mat === "") {
        alert("수학점수를 입력하세요.");
        form.mat.focus();
        return;
      }
      const matNum = Number(mat);
      if(isNaN(matNum) || matNum < 0 || matNum > 100) {
        alert("수학점수가 올바르지 않습니다.");
        form.mat.focus();
        return;
      }
      
      names.push(name); kors.push(kor); engs.push(eng); mats.push(mat);
      document.getElementById("names").value = names.join(",");
      document.getElementById("kors").value = kors.join(",");
      document.getElementById("engs").value = engs.join(",");
      document.getElementById("mats").value = mats.join(",");
      
      // demo 출력
      const demo = document.getElementById("demo");
 			demo.innerHTML += "<div class='border p-2 mb-2 rounded' style='background-color:#f8f9fa;'>" +
 		  (lineCount++) + ". 이름: " + name + " &nbsp;&nbsp;&nbsp; 국어: " + kor + "점, 영어: " + eng + "점, 수학: " + mat +
 		  "점</div>";
      
      // 입력폼 초기화
      form.reset();
      form.name.focus();
    } // fCheck() end
    
    // 한 줄 삭제
    function deleteLine() {
      const demo = document.getElementById("demo");
      if(demo.lastChild) {
        demo.removeChild(demo.lastChild);
        
        // 배열에서도 마지막 데이터 제거
        names.pop();
        kors.pop();
        engs.pop();
        mats.pop();

        // lineCount 감소
        lineCount--;
        
        // 히든 input 값 갱신
        document.getElementById("names").value = names.join(",");
        document.getElementById("kors").value = kors.join(",");
        document.getElementById("engs").value = engs.join(",");
        document.getElementById("mats").value = mats.join(",");
      } else {
        alert("삭제할 라인이 없습니다.");
      }
    }
    function resetForm() {
      document.myform.reset();      // 입력 필드 초기화
      names = []; kors = []; engs = []; mats = [];
      lineCount = 1;
      document.getElementById("demo").innerHTML = "";
      document.getElementById("names").value = "";
      document.getElementById("kors").value = "";
      document.getElementById("engs").value = "";
      document.getElementById("mats").value = "";
    }
    
  </script>
</head>
<body>
<div class="container mt-4">
  <h2>성적 입력</h2>
  <form name="myform" method="post" action="<%=request.getContextPath()%>/exam/EX03_1">
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
    
    <input type="hidden" name="names" id="names">
    <input type="hidden" name="kors" id="kors">
    <input type="hidden" name="engs" id="engs">
    <input type="hidden" name="mats" id="mats">
    
    <div class="mb-3 d-flex gap-2">
      <input type="button" value="추가" onclick="fCheck()" class="btn btn-success flex-fill"/>
      <input type="button" value="한줄 지우기" onclick="deleteLine()" class="btn btn-danger flex-fill"/>
      <input type="button" value="다시입력" onclick="resetForm()" class="btn btn-warning flex-fill"/>
      <input type="button" value="전송" onclick="document.myform.submit()" class="btn btn-primary flex-fill"/>
    </div>
  </form>
  <div id="demo" class="border mt-3"></div>
</div>
</body>
</html>