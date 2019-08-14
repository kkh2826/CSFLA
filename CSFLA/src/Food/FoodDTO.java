package Food;

public class FoodDTO {
	int foodNum;
	String foodName;
	String foodDescription;
	String foodImage;
	String foodVideo;
	String brandName;
	int foodCalory;
	int foodPrice;
	int foodCount;
	int orderCount;
	int orderPlace;
	
	public FoodDTO() {}
	public FoodDTO(int foodNum, String foodName, String foodDescription, String foodImage, String foodVideo, String brandName, int foodCalory, int foodPrice, int foodCount, int orderCount, int orderPlace) {
		this.foodNum = foodNum;
		this.foodName = foodName;
		this.foodDescription = foodDescription;
		this.foodImage = foodImage;
		this.foodVideo = foodVideo;
		this.brandName = brandName;
		this.foodCalory = foodCalory;
		this.foodPrice = foodPrice;
		this.foodCount = foodCount;
		this.orderCount = orderCount;
		this.orderPlace = orderPlace;
	}

	public int getFoodNum() {
		return foodNum;
	}

	public void setFoodNum(int foodNum) {
		this.foodNum = foodNum;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getFoodDescription() {
		return foodDescription;
	}

	public void setFoodDescription(String foodDescription) {
		this.foodDescription = foodDescription;
	}

	public String getFoodImage() {
		return foodImage;
	}

	public void setFoodImage(String foodImage) {
		this.foodImage = foodImage;
	}

	public String getFoodVideo() {
		return foodVideo;
	}

	public void setFoodVideo(String foodVideo) {
		this.foodVideo = foodVideo;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public int getFoodCalory() {
		return foodCalory;
	}
	public void setFoodCalory(int foodCalory) {
		this.foodCalory = foodCalory;
	}
	public int getFoodPrice() {
		return foodPrice;
	}
	public void setFoodPrice(int foodPrice) {
		this.foodPrice = foodPrice;
	}
	public int getFoodCount() {
		return foodCount;
	}
	public void setFoodCount(int foodCount) {
		this.foodCount = foodCount;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getOrderPlace() {
		return orderPlace;
	}
	public void setOrderPlace(int orderPlace) {
		this.orderPlace = orderPlace;
	}
	
	
}
