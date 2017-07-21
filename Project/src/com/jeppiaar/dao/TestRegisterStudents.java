package com.jeppiaar.dao;

import com.jeppiaar.model.RegisterStudents;

public class TestRegisterStudents {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		RegisterStudents registerStudents=new RegisterStudents();
		RegisterStudentDAO registerStudentDAO=new RegisterStudentDAO();
		registerStudents.setBatch("2014-2018");
		registerStudents.setBoardingPoint("avadi");
		registerStudents.setDepartment("it");
		registerStudents.setName("eugine");
		registerStudents.setRegisterNo("8470448");
		registerStudentDAO.add(registerStudents);
		
	}

}
