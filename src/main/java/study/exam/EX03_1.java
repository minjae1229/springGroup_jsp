package study.exam;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/exam/EX03_1")
public class EX03_1 extends HttpServlet{
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    
    String[] names = request.getParameter("names").split(",");
    String[] korsStr = request.getParameter("kors").split(",");
    String[] engsStr = request.getParameter("engs").split(",");
    String[] matsStr = request.getParameter("mats").split(",");

    int n = names.length;
    int[] total = new int[n];
    double[] avg = new double[n];
    String[] grade = new String[n];
    int[] rank = new int[n];

    for(int i=0; i<n; i++) {
      int k=0, e=0, m=0;
      if(korsStr[i] != null && !korsStr[i].trim().isEmpty()) k = Integer.parseInt(korsStr[i]);
      if(engsStr[i] != null && !engsStr[i].trim().isEmpty()) e = Integer.parseInt(engsStr[i]);
      if(matsStr[i] != null && !matsStr[i].trim().isEmpty()) m = Integer.parseInt(matsStr[i]);
        
        total[i] = k + e + m;
        
        avg[i] = total[i]/3.0;
        
        if(avg[i]>=90) grade[i]="A";
        else if(avg[i]>=80) grade[i]="B";
        else if(avg[i]>=70) grade[i]="C";
        else if(avg[i]>=60) grade[i]="D";
        else grade[i]="F";
    }

    // 순위 계산
    for(int i=0;i<n;i++){
        rank[i]=1;
        for(int j=0;j<n;j++){
            if(total[j]>total[i]) rank[i]++;
        }
    }

    request.setAttribute("names", names);
    request.setAttribute("kors", korsStr);
    request.setAttribute("engs", engsStr);
    request.setAttribute("mats", matsStr);
    request.setAttribute("total", total);
    request.setAttribute("avg", avg);
    request.setAttribute("grade", grade);
    request.setAttribute("rank", rank);

    request.getRequestDispatcher("/study/exam/ex03_1_OK.jsp").forward(request, response);
  }
}
