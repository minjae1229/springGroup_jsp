package study2.exam;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study2/exam/LoginJoinOk")
public class LoginJoinOk extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding("utf-8");

    PrintWriter out = response.getWriter();

    // null, 공백 체크
    String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
    String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
    String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
    String name = request.getParameter("name") == null ? "" : request.getParameter("name");
    int age = 0; // 숫자 아닌 값 입력시 0으로 처리
    try {
      age = Integer.parseInt(request.getParameter("age"));
    } catch (Exception e) {
    }
    String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender");
    String address = request.getParameter("address") == null ? "" : request.getParameter("address");

    // VO에 입력 값 세팅
    LoginVO vo = new LoginVO();
    vo.setMid(mid);
    vo.setPwd(pwd);
    vo.setNickName(nickName);
    vo.setName(name);
    vo.setAge(age);
    vo.setGender(gender);
    vo.setAddress(address);

    // DAO 생성
    LoginDAO dao = new LoginDAO();
    try {
      dao.insertMember(vo); // LoginDAO에 INSERT method 추가
      out.println("<script>");
      out.println("alert('회원가입이 완료되었습니다!');");
      out.println("location.href='" + request.getContextPath() + "/study2/exam/Login';");
      out.println("</script>");
    } catch (SQLException e) {
      // MySQL 중복키 에러 code: 1062
      if (e.getErrorCode() == 1062) {
        out.println("<script>");
        out.println("alert('아이디 또는 닉네임이 이미 존재합니다!');");
        out.println("history.back();");
        out.println("</script>");
      } else {
        e.printStackTrace();
        out.println("<script>");
        out.println("alert('회원가입 중 오류가 발생했습니다.');");
        out.println("history.back();");
        out.println("</script>");
      }
    } finally {
      dao.connClose();
    }
  }
}
