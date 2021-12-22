package vo;

public class Chicken {
	private String code;
	private String name;
	private int price;
	public Chicken(String b, int c){this.name = b; this.price = c;}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
