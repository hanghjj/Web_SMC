package vo;

public class Review {
	private int code=0;
	private String name;
	private int grade;
	private String text;
	private String reviewer;
	public String getReviewer() {
		return reviewer;
	}
	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}
	public Review(String name, int grade, String text,String reviewer) {this.name = name; this.grade=grade; this.text = text; this.reviewer = reviewer;}
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