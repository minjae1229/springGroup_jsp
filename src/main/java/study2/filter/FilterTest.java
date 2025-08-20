package study2.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterTest implements Filter {

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    //한글처리
    request.setCharacterEncoding("utf-8"); // 콘솔에서 한글 출력
    response.setContentType("text/html; charset=utf-8"); // 브라우저에 한글 출력
    
    System.out.println("1. 필터 수행 전입니다.");
    
    chain.doFilter(request, response);
    
    System.out.println("2. 필터 수행 후입니다.");
  }

}
