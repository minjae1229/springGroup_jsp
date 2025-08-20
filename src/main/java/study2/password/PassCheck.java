package study2.password;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study2/password/PassCheck")
public class PassCheck extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
    int flag = (request.getParameter("flag")==null || request.getParameter("flag").equals("")) ? 0 : Integer.parseInt(request.getParameter("flag"));
    
    System.out.println("=========================");
    System.out.println("원본 pwd : " + pwd);
    
    if(flag == 1) {
      // 16진수 소금키를 통한 암호화
      int saltKey = 0x1234ABCD; // 임시로 하드코딩
      int encPwd, decPwd;
      
      // xor 연산시 이진수로 자동 형변환
      encPwd = Integer.parseInt(pwd) ^ saltKey;
      System.out.println("암호화된 encPwd : " + encPwd);
      
      decPwd = encPwd ^ saltKey;
      System.out.println("복호화된 decPwd : " + decPwd);
    }
    else if(flag == 2) {
      // 16진수 소금키를 랜덤으로 설정
      int saltKey = (int)(Math.random()*99999-10001+1)+10001; // 5자리수
      int encPwd, decPwd;
      
      // xor 연산시 이진수로 자동 형변환
      encPwd = Integer.parseInt(pwd) ^ saltKey;
      System.out.println("암호화된 encPwd : " + encPwd);
      
      // 복호화된 키를 DB에 저장한다.
      System.out.println("DB저장 pwd : " +saltKey+""+encPwd);
      
      decPwd = encPwd ^ saltKey;
      System.out.println("복호화된 decPwd : " + decPwd);
      
    }
    
    
    
    String viewPage = "/WEB-INF/study2/password/passForm.jsp";
    RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
    dispatcher.forward(request, response);
  }
}
