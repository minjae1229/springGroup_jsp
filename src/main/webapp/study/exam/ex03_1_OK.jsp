<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ex03_1_OK.jsp</title>
  <jsp:include page="/include/bs5.jsp" />
</head>
<body>
<div class="container mt-4 text-center">
  <h2 class="mb-4">성적 결과</h2>

<%
    String[] names = (String[]) request.getAttribute("names");
    String[] korsStr = (String[]) request.getAttribute("kors");
    String[] engsStr = (String[]) request.getAttribute("engs");
    String[] matsStr = (String[]) request.getAttribute("mats");
    int[] total = (int[]) request.getAttribute("total");
    double[] avg = (double[]) request.getAttribute("avg");
    String[] grade = (String[]) request.getAttribute("grade");
    int[] rank = (int[]) request.getAttribute("rank");

    if(names != null && names.length > 0){
        int n = names.length;

        // 순위 기준 인덱스 정렬
        Integer[] idx = new Integer[n];
        for(int i=0;i<n;i++) idx[i]=i;
        java.util.Arrays.sort(idx, (a,b) -> rank[a]-rank[b]);
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
        for(int i=0;i<n;i++){
            int j = idx[i];
%>
      <tr>
        <td><%= rank[j] %></td>
        <td><%= names[j] %></td>
        <td><%= korsStr[j] %></td>
        <td><%= engsStr[j] %></td>
        <td><%= matsStr[j] %></td>
        <td><%= total[j] %></td>
        <td><%= String.format("%.2f", avg[j]) %></td>
        <td><%= grade[j] %></td>
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
