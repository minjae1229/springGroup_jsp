package study.exam;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/exam/EX03_2")
public class EX03_2 extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");

    String[] names = request.getParameter("names").split(",");
    String[] korsStr = request.getParameter("kors").split(",");
    String[] engsStr = request.getParameter("engs").split(",");
    String[] matsStr = request.getParameter("mats").split(",");

    int n = names.length;
    List<EX03VO> students = new ArrayList<>();

    // VO 객체 생성 및 계산
    for (int i = 0; i < n; i++) {
      EX03VO s = new EX03VO();
      s.setName(names[i]);
      s.setKor(parseScore(korsStr[i]));
      s.setEng(parseScore(engsStr[i]));
      s.setMat(parseScore(matsStr[i]));

      // 총점, 평균, 학점 계산
      int total = s.getKor() + s.getEng() + s.getMat();
      s.setTotal(total);
      double avg = total / 3.0;
      s.setAvg(avg);

      if (avg >= 90)
        s.setGrade("A");
      else if (avg >= 80)
        s.setGrade("B");
      else if (avg >= 70)
        s.setGrade("C");
      else if (avg >= 60)
        s.setGrade("D");
      else
        s.setGrade("F");

      students.add(s);
    }

    // 순위 계산
    for (int i = 0; i < n; i++) {
      students.get(i).setRank(1);
      for (int j = 0; j < n; j++) {
        if (students.get(j).getTotal() > students.get(i).getTotal()) {
          students.get(i).setRank(students.get(i).getRank() + 1);
        }
      }
    }

    // JSP로 VO 리스트 전달
    request.setAttribute("students", students);
    request.getRequestDispatcher("/study/exam/ex03_2_OK.jsp").forward(request, response);
  }

// 점수 변환용
  private int parseScore(String str) {
    if (str != null && !str.trim().isEmpty()) {
      return Integer.parseInt(str.trim());
    } else
      return 0;
  }
}
