package study.exam;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/exam/EX04")
public class EX04 extends HttpServlet{
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String saveId = request.getParameter("saveId");
    
    // 입력값 체크
    if(id == null || id.trim().isEmpty()) {
      System.out.println("id 미입력");
      return;
    }
    if(pwd == null || pwd.trim().isEmpty()) {
      System.out.println("pwd 미입력");
      return;
    }
    
    // 쿠키 처리
    Cookie cookie = new Cookie("savedId", "");
    if(saveId != null && saveId.equals("on")) {
      cookie.setValue(id);
      cookie.setMaxAge(7*24*60*60); // 7일
    }else {
      cookie.setMaxAge(0); // 삭제
    }
    cookie.setPath("/"); // 모든 경로에서 접근 가능
    response.addCookie(cookie);
    
    response.sendRedirect(request.getContextPath() + "/study/exam/ex04_OK.jsp?id=" + id);
//    request.setAttribute("id", id);
//    request.setAttribute("pwd", pwd);
//    
//    request.getRequestDispatcher("/study/exam/ex04_OK.jsp").forward(request, response);
  }
}
