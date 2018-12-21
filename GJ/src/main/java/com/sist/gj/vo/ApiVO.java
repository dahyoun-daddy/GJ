package com.sist.gj.vo;

public class ApiVO {
	private String jobType; //고용형태
	private String name;  //기업이름
	private String jobCategory;  //구인업무
	private String experienceLevel;  //요구경력
	private String requiredEducationLevel;  //요구학력
	private String salary;  //연봉
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJobCategory() {
		return jobCategory;
	}
	public void setJobCategory(String jobCategory) {
		this.jobCategory = jobCategory;
	}
	public String getExperienceLevel() {
		return experienceLevel;
	}
	public void setExperienceLevel(String experienceLevel) {
		this.experienceLevel = experienceLevel;
	}
	public String getRequiredEducationLevel() {
		return requiredEducationLevel;
	}
	public void setRequiredEducationLevel(String requiredEducationLevel) {
		this.requiredEducationLevel = requiredEducationLevel;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	@Override
	public String toString() {
		return "ApiVO [jobType=" + jobType + ", name=" + name + ", jobCategory=" + jobCategory + ", experienceLevel="
				+ experienceLevel + ", requiredEducationLevel=" + requiredEducationLevel + ", salary=" + salary + "]";
	}
	public ApiVO(String jobType, String name, String jobCategory, String experienceLevel, String requiredEducationLevel,
			String salary) {
		super();
		this.jobType = jobType;
		this.name = name;
		this.jobCategory = jobCategory;
		this.experienceLevel = experienceLevel;
		this.requiredEducationLevel = requiredEducationLevel;
		this.salary = salary;
	}
	
	
	public ApiVO() {}
}
