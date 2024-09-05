package dto;

public class Person {
	
	private String id;
	private String nickName;
	private String email;
	private String password;
	private String address;
	private String sex;
	private String age;
	private String personImage;
	private String status;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPersonImage() {
		return personImage;
	}
	public void setPersonImage(String personImage) {
		this.personImage = personImage;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Person(String id, String nickName, String email, String password, String address, String sex, String age,
			String personImage, String status) {
		super();
		this.id = id;
		this.nickName = nickName;
		this.email = email;
		this.password = password;
		this.address = address;
		this.sex = sex;
		this.age = age;
		this.personImage = personImage;
		this.status = status;
	}
	public Person() {
		super();
	}
	@Override
	public String toString() {
		return "Person [id=" + id + ", nickName=" + nickName + ", email=" + email + ", password=" + password
				+ ", address=" + address + ", sex=" + sex + ", age=" + age + ", personImage=" + personImage
				+ ", status=" + status + "]";
	}
	
	

}
