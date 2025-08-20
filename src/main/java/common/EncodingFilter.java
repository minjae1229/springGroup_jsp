package common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

//@WebFilter("/study2/filter/T1NO")
@WebFilter("/*")
public class EncodingFilter implements Filter {

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    
    //한글처리
    request.setCharacterEncoding("utf-8"); // 콘솔에서 한글 출력
    response.setContentType("text/html; charset=utf-8"); // 브라우저에 한글 출력
    
    chain.doFilter(request, response);
    
    
  }

}
