package com.jeppiaar.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.annotation.Generated;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.jeppiaar.dao.RegisterStudentDAO;
import com.jeppiaar.model.RegisterStudents;




@WebServlet("/RegisterController")

public class RegisterController extends HttpServlet  {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RegisterStudentDAO registerStudentDAO=new RegisterStudentDAO();
		RegisterStudents registerStudents=new RegisterStudents();
		String batch=request.getParameter("batch");
		String boardingPoint=request.getParameter("boardingPoint");
		String department=request.getParameter("department");
		String name=request.getParameter("name");
		String registerNo=request.getParameter("registerNo");
		Boolean flag=false,status=false;
		try {
			flag = registerStudentDAO.registerNoValidate(registerNo);
			status=registerStudentDAO.boardingPointValidate(boardingPoint);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		if(flag&&status){
			registerStudents.setName(name);
			registerStudents.setBatch(batch);
			registerStudents.setBoardingPoint(boardingPoint);
			registerStudents.setDepartment(department);
			registerStudents.setRegisterNo(registerNo);
			try {
				registerStudentDAO.add(registerStudents);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("msg","valid");
			request.getRequestDispatcher("Registration.jsp").forward(request, response);
		}
		else{
			request.setAttribute("msg","invalid");
			request.getRequestDispatcher("Registration.jsp").forward(request, response);
			
		}
		

		
		}


}
