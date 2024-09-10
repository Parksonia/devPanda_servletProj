package dto;

public class IdEmailJsonObject {
	private String id;
	private String email;
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
	@Override
	public String toString() {
		return "MailSendJsonObject [id=" + id + ", email=" + email + "]";
	}

}
