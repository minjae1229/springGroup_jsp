<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--  
  콤보상자와 리스트박스에 그림을 추가시켜준후, 그림을 선택하면 하단에 선택된 그림을 표시하시오.
  단, 리스트박스의 그림은 여러장을 선택하여 출력시켜줄수 있도록 처리한다.
--%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>ex01_image.jsp</title>
  <style>
    img {
      width: 100px;
      margin: 5px;
      border: 1px solid #aaa;
    }
    #listResult {
      display: flex;
      flex-wrap: wrap;
      margin-top: 10px;
    }
  </style>
</head>
<body>
<p><br/></p>
<div class="container">

  <h3>콤보박스 (단일 선택)</h3>
  <select class="form-select" id="combo" onchange="showSelected()">
    <option value="">-- 이미지 선택 --</option>
    <% for (int i = 1; i <= 7; i++) { %>
      <option data-src="<%=request.getContextPath()%>/images/<%=i%>.jpg">이미지 <%=i%></option>
    <% } %>
  </select>

  <div id="comboResult" class="mt-3"></div>

  <hr>

  <h3>리스트박스 (다중 선택)</h3>
  <select class="form-select" id="list" multiple size="7" onchange="showSelected()">
    <% for (int i = 1; i <= 7; i++) { %>
      <option data-src="<%=request.getContextPath()%>/images/<%=i%>.jpg">이미지 <%=i%></option>
    <% } %>
  </select>

  <div id="listResult" class="mt-3 d-flex flex-wrap"></div>

</div>
<p><br/></p>

<script>
  function showSelected() {
    const combo = document.getElementById("combo");
    const list = document.getElementById("list");
    const comboResult = document.getElementById("comboResult");
    const listResult = document.getElementById("listResult");

    // 초기화
    comboResult.innerHTML = "";
    listResult.innerHTML = "";

    // 콤보박스 선택 이미지 출력
    const selectedComboOption = combo.options[combo.selectedIndex];
    if (selectedComboOption && selectedComboOption.dataset.src) {
      const img = document.createElement("img");
      img.src = selectedComboOption.dataset.src;
      comboResult.appendChild(img);
    }

    // 리스트박스 다중 선택 이미지 출력
    for (let i = 0; i < list.options.length; i++) {
      const opt = list.options[i];
      if (opt.selected && opt.dataset.src) {
        const img = document.createElement("img");
        img.src = opt.dataset.src;
        listResult.appendChild(img);
      }
    }
  }
</script>
</body>
</html>
