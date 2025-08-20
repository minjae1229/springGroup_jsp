package study.exam;

public class EX03VO {
  private String name;
  private int kor;
  private int eng;
  private int mat;
  private int total;
  private double avg;
  private String grade;
  private int rank;
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public int getKor() {
    return kor;
  }
  public void setKor(int kor) {
    this.kor = kor;
  }
  public int getEng() {
    return eng;
  }
  public void setEng(int eng) {
    this.eng = eng;
  }
  public int getMat() {
    return mat;
  }
  public void setMat(int mat) {
    this.mat = mat;
  }
  public int getTotal() {
    return total;
  }
  public void setTotal(int total) {
    this.total = total;
  }
  public double getAvg() {
    return avg;
  }
  public void setAvg(double avg) {
    this.avg = avg;
  }
  public String getGrade() {
    return grade;
  }
  public void setGrade(String grade) {
    this.grade = grade;
  }
  public int getRank() {
    return rank;
  }
  public void setRank(int rank) {
    this.rank = rank;
  }
  @Override
  public String toString() {
    return "EX03VO [name=" + name + ", kor=" + kor + ", eng=" + eng + ", mat=" + mat + ", total=" + total + ", avg="
        + avg + ", grade=" + grade + ", rank=" + rank + "]";
  }
}
