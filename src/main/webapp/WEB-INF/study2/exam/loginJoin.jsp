<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/include/bs5.jsp" />
<title>loginjoin.jsp</title>
<!-- 프론트 체크 원래 해야함. fCheck()  -->
<!-- 일단은 프론트 체크 하지 않고 바로 넘겼음  -->

</head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>회원가입 페이지</h2>
    <form method="post" action="${ctp}/study2/exam/LoginJoinOk">
      <table class="table table-bordered text-center">
        <tr>
          <th>아이디</th>
          <td><input type="text" name="mid" required class="form-control"/></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="pwd" required class="form-control"/></td>
        </tr>
        <tr>
          <th>닉네임</th>
          <td><input type="text" name="nickName" required class="form-control"/></td>
        </tr>
        <tr>
          <th>이름</th>
          <td><input type="text" name="name" required class="form-control"/></td>
        </tr>
        <tr>
          <th>나이</th>
          <td><input type="number" name="age" class="form-control"/></td>
        </tr>
        <tr>
          <th>성별</th>
          <td>
            <select name="gender" class="form-control">
              <option value="남자">남자</option>
              <option value="여자">여자</option>
            </select>
          </td>
        </tr>
        <tr>
          <th>주소</th>
          <td><input type="text" name="address" class="form-control" /></td>
        </tr>
        <tr>
          <td colspan="2" class="text-center">
            <input type="submit" value="회원가입" class="btn btn-success" />
            <input type="reset" value="다시작성" class="btn btn-warning" />
          </td>
        </tr>
      </table>
    </form>
  </div>
  <p><br/></p>
</body>
</html>