package study2.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study2/filter/T1OK")
public class T1OK extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8"); // 콘솔에서 한글 출력
    response.setContentType("text/html; charset=utf-8"); // 브라우저에 한글 출력
    
    String content = request.getParameter("content") == null ? "" : request.getParameter("content");
    String introduce = request.getParameter("introduce") == null ? "" : request.getParameter("introduce");
    
    System.out.println("이곳은 /study2/filter/T1OK 서블릿입니다.");
    System.out.println("content : " +content);
    System.out.println("introduce : " +introduce);
    
    PrintWriter out = response.getWriter();
    out.println("이곳은 T10OK 컨트롤러 입니다.");
    
    request.setAttribute("message", "T10OK 컨트롤러에서 보냅니다.");
    
    String viewPage = "/WEB-INF/study2/filter/t1_filterRes.jsp";
    RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
    dispatcher.forward(request, response);
  }
}
