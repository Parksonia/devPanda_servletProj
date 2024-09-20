package dto;

public class SearchCondition {
	
	private String occupation;
	private String period;
	private String education;
	private String employmentType;
	private String stack;
	private String certification;
	private String location;
	private String offset;
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	@Override
	public String toString() {
		return "SearchCondition [occupation=" + occupation + ", period=" + period + ", education=" + education
				+ ", employmentType=" + employmentType + ", stack=" + stack + ", certification=" + certification
				+ ", location=" + location + ", offset=" + offset + "]";
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getEmploymentType() {
		return employmentType;
	}
	public void setEmploymentType(String employmentType) {
		this.employmentType = employmentType;
	}
	public String getStack() {
		return stack;
	}
	public void setStack(String stack) {
		this.stack = stack;
	}
	public String getCertification() {
		return certification;
	}
	public void setCertification(String certification) {
		this.certification = certification;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getOffset() {
		return offset;
	}
	public void setOffset(String offset) {
		this.offset = offset;
	}
	
	
	

}
