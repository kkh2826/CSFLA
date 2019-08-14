package Gradient;

public class GradientDTO {
	int gradientNum;
	String gradientName;
	String gradientCategory;
	String brandName;
	int gradientPrice;
	int gradientCalory;
	String gradientImage;
	
	public GradientDTO() {}
	public GradientDTO(int gradientNum, String gradientName, String gradientCategory, String brandName, int gradientPrice, int gradientCalory, String gradientImage) {
		this.gradientNum = gradientNum;
		this.gradientName = gradientName;
		this.gradientCategory = gradientCategory;
		this.brandName = brandName;
		this.gradientPrice = gradientPrice;
		this.gradientCalory = gradientCalory;
		this.gradientImage = gradientImage;
	}
	
	public int getGradientNum() {
		return gradientNum;
	}
	public void setGradientNum(int gradientNum) {
		this.gradientNum = gradientNum;
	}
	public String getGradientName() {
		return gradientName;
	}
	public void setGradientName(String gradientName) {
		this.gradientName = gradientName;
	}
	public String getGradientCategory() {
		return gradientCategory;
	}
	public void setGradientCategory(String gradientCategory) {
		this.gradientCategory = gradientCategory;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public int getGradientPrice() {
		return gradientPrice;
	}
	public void setGradientPrice(int gradientPrice) {
		this.gradientPrice = gradientPrice;
	}
	public int getGradientCalory() {
		return gradientCalory;
	}
	public void setGradientCalory(int gradientCalory) {
		this.gradientCalory = gradientCalory;
	}
	public String getGradientImage() {
		return gradientImage;
	}
	public void setGradientImage(String gradientImage) {
		this.gradientImage = gradientImage;
	}
	
	
	
}
