package dto;

public class MapperSearchCondition {
	
	
	private String occupation;
	private String period;
	private String education;
	private String employmentType;
	private String stack;
	private String certification;
	private String location;
	private Integer offset;
	
	
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getPeriod() {
		return period;
	}
	public Integer getOffset() {
		return offset;
	}
	public void setOffset(Integer offset) {
		this.offset = offset;
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
	
	
	public static MapperSearchCondition extractMapperSearchCondition(SearchCondition searchCondition) {
		
		MapperSearchCondition mapperSearchCondition = new MapperSearchCondition();
		if(searchCondition.getOccupation()!= null) {
			mapperSearchCondition.setOccupation(StringUtil(searchCondition.getOccupation().split(",")));
		}
		if(searchCondition.getPeriod()!=null) {
			mapperSearchCondition.setPeriod(StringUtil(searchCondition.getPeriod().split(",")));
		}
		if(searchCondition.getEducation()!=null) {
			mapperSearchCondition.setEducation(StringUtil(searchCondition.getEducation().split(",")));
		}
		if(searchCondition.getEmploymentType()!=null) {
			mapperSearchCondition.setEmploymentType(StringUtil(searchCondition.getEmploymentType().split(",")));
		}
		if(searchCondition.getStack()!=null) {
			mapperSearchCondition.setStack(StringUtil(searchCondition.getStack().split(",")));
		}
		if(searchCondition.getLocation()!=null) {
			mapperSearchCondition.setLocation(StringUtil(searchCondition.getLocation().split(",")));
		}
		if(searchCondition.getCertification()!=null) {
			mapperSearchCondition.setCertification(StringUtil(searchCondition.getCertification().split(",")));
		}
		
		mapperSearchCondition.setOffset(0);
		if(searchCondition.getOffset() != null) {
			mapperSearchCondition.setOffset(Integer.parseInt(searchCondition.getOffset()));
		}
		
		
		return mapperSearchCondition;
		
		
	}
	
	
	
	@Override
	public String toString() {
		return "MapperSearchCondition [occupation=" + occupation + ", period=" + period + ", education=" + education
				+ ", employmentType=" + employmentType + ", stack=" + stack + ", certification=" + certification
				+ ", location=" + location + ", offset=" + offset + "]";
	}
	public static String StringUtil(String[] stringArray) {
		
		
		StringBuilder sb = new StringBuilder();
		
		for (int i=0;i<stringArray.length;i++) {
			
			if(i==0) {
				sb.append("%");
				sb.append(stringArray[i]);
				sb.append("%");
			}else {
				
				sb.append(stringArray[i]);
				sb.append("%");
			}
			
			
		}
		
		return sb.toString();
		
	}
	
	
	


}
