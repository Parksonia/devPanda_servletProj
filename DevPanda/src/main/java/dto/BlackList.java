package dto;

public class BlackList {
	
	private Integer blackNum;	//autoIncrement
	private String declPerson;
	private String declCom;
	private Integer transactionNum;
	private Integer bidNum;
	private String blackPerson;
	private String blackCom;
	private String title;
	private String content;
	private String reportDate;
	private String roleType;
	public Integer getBlackNum() {
		return blackNum;
	}
	public void setBlackNum(Integer blackNum) {
		this.blackNum = blackNum;
	}
	public String getDeclPerson() {
		return declPerson;
	}
	public void setDeclPerson(String declPerson) {
		this.declPerson = declPerson;
	}
	public String getDeclCom() {
		return declCom;
	}
	public void setDeclCom(String declCom) {
		this.declCom = declCom;
	}
	public Integer getTransactionNum() {
		return transactionNum;
	}
	public void setTransactionNum(Integer transactionNum) {
		this.transactionNum = transactionNum;
	}
	public Integer getBidNum() {
		return bidNum;
	}
	public void setBidNum(Integer bidNum) {
		this.bidNum = bidNum;
	}
	public String getBlackPerson() {
		return blackPerson;
	}
	public void setBlackPerson(String blackPerson) {
		this.blackPerson = blackPerson;
	}
	public String getBlackCom() {
		return blackCom;
	}
	public void setBlackCom(String blackCom) {
		this.blackCom = blackCom;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	public String getRoleType() {
		return roleType;
	}
	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}
	
	public BlackList() {
		super();
	}
	public BlackList(Integer blackNum, String declPerson, String declCom, Integer transactionNum, Integer bidNum,
			String blackPerson, String blackCom, String title, String content, String reportDate, String roleType) {
		super();
		this.blackNum = blackNum;
		this.declPerson = declPerson;
		this.declCom = declCom;
		this.transactionNum = transactionNum;
		this.bidNum = bidNum;
		this.blackPerson = blackPerson;
		this.blackCom = blackCom;
		this.title = title;
		this.content = content;
		this.reportDate = reportDate;
		this.roleType = roleType;
	}
	@Override
	public String toString() {
		return "BlackList [blackNum=" + blackNum + ", declPerson=" + declPerson + ", declCom=" + declCom
				+ ", transactionNum=" + transactionNum + ", bidNum=" + bidNum + ", blackPerson=" + blackPerson
				+ ", blackCom=" + blackCom + ", title=" + title + ", content=" + content + ", reportDate=" + reportDate
				+ ", roleType=" + roleType + "]";
	}

}
