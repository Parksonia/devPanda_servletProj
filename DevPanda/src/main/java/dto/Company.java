package dto;

public class Company {
	private String id;
	private String companyName;
	private String email;
	private String password;
	private String address;
	private String companyNum;
	private String status;
	private String companyImage;

	public Company() {

	}

	public Company(String id, String companyName, String email, String password, String address, String companyNum,
			String status, String companyImage) {

		this.id = id;
		this.companyName = companyName;
		this.email = email;
		this.password = password;
		this.address = address;
		this.companyNum = companyNum;
		this.status = status;
		this.companyImage = companyImage;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCompanyNum() {
		return companyNum;
	}

	public void setCompanyNum(String companyNum) {
		this.companyNum = companyNum;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCompanyImage() {
		return companyImage;
	}

	public void setCompanyImage(String companyImage) {
		this.companyImage = companyImage;
	}

}
