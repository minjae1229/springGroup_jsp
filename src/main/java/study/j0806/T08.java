package study.j0806;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0806/T08")
public class T08 extends HttpServlet{
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    
    // null 체크 처리
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    String gender = request.getParameter("gender");
    String[] hobbys = request.getParameterValues("hobby");
    String job = request.getParameter("job");
    String[] mountains = request.getParameterValues("mountain");
    String content = request.getParameter("content");
    String fileName = request.getParameter("fileName");
    
    // 정상적으로 값이 넘어왔는지 서버에서 체크
    System.out.println("성명 : " + name);
    System.out.println("나이 : " + age);
    System.out.println("성별 : " + gender);
    
    // 배열로 넘어온 자료 편집... 예) 등산,낚시,수영 -> 등산/낚시/수영
    // 취미 편집
    String hobby ="";
    if(hobbys != null) {
      for(String h : hobbys) {
        hobby += h + "/";
      }
      hobby = hobby.substring(0, hobby.length()-1); // 마지막 '/' 제거
    }
    System.out.println("hobby : " + hobby); // 확인
    
    System.out.println("job : " + job); // 확인
    
    // 가본산 편집
    String mountain ="";
    if(mountain != null) {
      for(String m : mountains) {
        mountain += m + "/";
      }
      mountain = mountain.substring(0, mountain.length()-1); // 마지막 '/' 제거
    }
    System.out.println("mountain : " + mountain); // 확인

    System.out.println("자기소개 : " + content); // 확인
    System.out.println("파일명 : " + fileName); // 확인
    
    // 서버에 정상적으로 처리된 자료(System.out.println() 으로 확인 후) View(JSP) 페이지로 전송시켜 출력
    content = content.replace("\n", "<br/>");
  }
}
