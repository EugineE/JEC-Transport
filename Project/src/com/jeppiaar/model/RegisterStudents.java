package com.jeppiaar.model;

public class RegisterStudents {
	private String name;
	private String  registerNo;
	private String department;
	private String batch;
	private String boardingPoint;
	public String getName() {
		return name;
	}
	
	public String getDepartment() {
		return department;
	}
	public String getBatch() {
		return batch;
	}
	public String getBoardingPoint() {
		return boardingPoint;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getRegisterNo() {
		return registerNo;
	}

	public void setRegisterNo(String registerNo) {
		this.registerNo = registerNo;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
	public void setBatch(String batch) {
		this.batch = batch;
	}
	public void setBoardingPoint(String boardingPoint) {
		this.boardingPoint = boardingPoint;
	}
	

}
