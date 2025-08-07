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
    
    /* 1. 데이터 수집 */
    String name = request.getParameter("name");
    String ageStr = request.getParameter("age"); // 일단 문자열로 받고 아래에서 처리
    String gender = request.getParameter("gender");
    String[] hobbys = request.getParameterValues("hobby");
    String job = request.getParameter("job");
    String[] mountains = request.getParameterValues("mountain");
    String content = request.getParameter("content");
    String fileName = request.getParameter("fileName");
    
    int age = 0;
    
    /* 2. 유효성 검사(null 처리) 및 예외처리 */
    // null 또는 공백: trim().isEmpty()
    
    // 이름 처리
    if(name == null || name.trim().isEmpty()) {
      System.out.println("성명이 미입력");
      return;
    }
    // 나이 처리
    if(ageStr == null || ageStr.trim().isEmpty()) {
      System.out.println("나이 미입력");
      return;
    }
    try {
      age = Integer.parseInt(ageStr);
      if(age < 1 || age > 150) {
        System.out.println("나이 범위 오류");
        return;
      }
    } catch (NumberFormatException e) { // 숫자가 아닌 값이 입력된 경우
      System.out.println("숫자 아님");
      return;
    }
    // 성별 처리
    if(gender == null) {
      System.out.println("성별 미선택");
      return;
    }
    // 취미 처리
    if(hobbys == null || hobbys.length == 0) {
      System.out.println("취미 미선택");
      return;
    }
    // 직업 처리
    if(job == null || job.trim().isEmpty()) {
      System.out.println("직업 미선택");
      return;
    }
    // 가본산 처리
    if(mountains == null || mountains.length == 0) {
      System.out.println("산 미선택");
      return;
    }
    // 자기소개 처리
    if(content == null || content.trim().isEmpty()) {
      System.out.println("자기소개 미입력");
      return;
    }
    // 파일명 처리
    if(fileName == null || fileName.trim().isEmpty()) {
      System.out.println("파일 미선택");
      return;
    }
    
    /* 3. 최종 처리 */
    // 배열로 넘어온 자료 편집... 예) 등산,낚시,수영 -> 등산/낚시/수영
    // 취미 편집
    String hobby ="";
    for(String h : hobbys) {
      hobby += h + "/";
    }
    hobby = hobby.substring(0, hobby.length()-1); // 마지막 '/' 제거
    
    // 가본산 편집
    String mountain ="";
    for(String m : mountains) {
      mountain += m + "/";
    }
    mountain = mountain.substring(0, mountain.length()-1); // 마지막 '/' 제거
    
    
    // 정상적으로 값이 넘어왔는지 서버에서 체크
    
    System.out.println("성명 : " + name);
    System.out.println("나이 : " + age);
    System.out.println("성별 : " + gender);
    System.out.println("취미 : " + hobby);
    System.out.println("직업 : " + job);
    System.out.println("가본 산 : " + mountain);
    System.out.println("자기소개 : " + content);
    System.out.println("파일명 : " + fileName);
    
    
    /* 4. 전송 */
    // 서버에 정상적으로 처리된 자료(System.out.println() 으로 확인 후) View(JSP) 페이지로 전송시켜 출력
    
    // 데이터 : 기존 실습에서는 view에서 처리하였지만 MVC 패턴에 맞지 않는 것 같아 서블릿에서 처리
    request.setAttribute("name", name);
    request.setAttribute("age", age);
    request.setAttribute("gender", gender);
    request.setAttribute("hobby", hobby);
    request.setAttribute("job", job);
    request.setAttribute("mountain", mountain);
    request.setAttribute("content", content.replace("\n", "<br/>"));
    request.setAttribute("fileName", fileName);
    
    // jsp로 포워딩(t08Ok.jsp)
    request.getRequestDispatcher("/study/0806/t08Ok.jsp").forward(request, response);
  }
}
