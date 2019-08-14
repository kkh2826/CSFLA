package Require;

import java.sql.Timestamp;

public class RequireDTO {
	int requireNum;
	String requireTitle;
	String id;
	Timestamp requireDate;
	String requireContent;
	
	
	public int getRequireNum() {
		return requireNum;
	}
	public void setRequireNum(int requireNum) {
		this.requireNum = requireNum;
	}
	public String getRequireTitle() {
		return requireTitle;
	}
	public void setRequireTitle(String requireTitle) {
		this.requireTitle = requireTitle;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getRequireDate() {
		return requireDate;
	}
	public void setRequireDate(Timestamp requireDate) {
		this.requireDate = requireDate;
	}
	public String getRequireContent() {
		return requireContent;
	}
	public void setRequireContent(String requireContent) {
		this.requireContent = requireContent;
	}


	
	
}
