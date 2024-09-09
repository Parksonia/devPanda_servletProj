package dto;

public class EmailCertification {
	
	
	private Long EmailCertificationNum;
	private String id;
	private String email;
	private String certification;
	public Long getEmailCertificationNum() {
		return EmailCertificationNum;
	}
	public void setEmailCertificationNum(Long emailCertificationNum) {
		EmailCertificationNum = emailCertificationNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCertification() {
		return certification;
	}
	public void setCertification(String certification) {
		this.certification = certification;
	}


}
