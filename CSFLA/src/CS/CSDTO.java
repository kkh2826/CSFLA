package CS;

public class CSDTO {
	int csNum;
	String csBrand;
	String csOwner;
	String csEmail;
	String csPhone;
	String csLocation;
	
	public CSDTO() {}

	public CSDTO(int csNum, String csBrand, String csOwner, String csEmail, String csPhone, String csLocation) {
		super();
		this.csNum = csNum;
		this.csBrand = csBrand;
		this.csOwner = csOwner;
		this.csEmail = csEmail;
		this.csPhone = csPhone;
		this.csLocation = csLocation;
	}

	public int getCsNum() {
		return csNum;
	}

	public void setCsNum(int csNum) {
		this.csNum = csNum;
	}

	public String getCsBrand() {
		return csBrand;
	}

	public void setCsBrand(String csBrand) {
		this.csBrand = csBrand;
	}

	public String getCsOwner() {
		return csOwner;
	}

	public void setCsOwner(String csOwner) {
		this.csOwner = csOwner;
	}

	public String getCsEmail() {
		return csEmail;
	}

	public void setCsEmail(String csEmail) {
		this.csEmail = csEmail;
	}

	public String getCsPhone() {
		return csPhone;
	}

	public void setCsPhone(String csPhone) {
		this.csPhone = csPhone;
	}

	public String getCsLocation() {
		return csLocation;
	}

	public void setCsLocation(String csLocation) {
		this.csLocation = csLocation;
	}
	
}
