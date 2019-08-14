package Order;

import java.sql.Timestamp;

public class OrderDTO {
	int foodNum;
	String id;
	int orderNum;
	int orderCount;
	int csNum;
	Timestamp orderDate;
	
	public OrderDTO() {}

	public OrderDTO(int foodNum, String id, int orderNum, int orderCount, int csNum, Timestamp orderDate) {
		this.foodNum = foodNum;
		this.id = id;
		this.orderNum = orderNum;
		this.orderCount = orderCount;
		this.csNum = csNum;
		this.orderDate = orderDate;
	}

	public int getFoodNum() {
		return foodNum;
	}

	public void setFoodNum(int foodNum) {
		this.foodNum = foodNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getCsNum() {
		return csNum;
	}

	public void setCsNum(int csNum) {
		this.csNum = csNum;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	
}
