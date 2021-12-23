package vo;

public class Review {
	private int code=0;
	private String name;
	private int grade;
	private String text;
	public Review(String name, int grade, String text) {this.name = name; this.grade=grade; this.text = text;}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
}