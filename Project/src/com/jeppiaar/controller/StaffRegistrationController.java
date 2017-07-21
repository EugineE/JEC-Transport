package com.jeppiaar.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeppiaar.dao.RegisterStaff;
import com.jeppiaar.model.Staff;


@WebServlet("/StaffRegistrationController")
public class StaffRegistrationController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Staff staff=new Staff();
		RegisterStaff registerStaff=new RegisterStaff();
		String staffId=request.getParameter("staffid");
		String boardingPoint=request.getParameter("boardingPoint");
		String department=request.getParameter("department");
		String name=request.getParameter("name");
		Boolean flag=false,status=false;
		try {
			flag = registerStaff.validateStaffId(staffId);
			status=registerStaff.validateStaffBoardingPoint(boardingPoint);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		if(flag&&status){
			staff.setName(name);
			
			staff.setBoardingPoint(boardingPoint);
			staff.setDepartment(department);
			staff.setStaffId(staffId);
			try {
				registerStaff.add(staff);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("msg","valid");
			request.getRequestDispatcher("StaffRegistration.jsp").forward(request, response);
		}
		else{
			request.setAttribute("msg","invalid");
			request.getRequestDispatcher("StaffRegistration.jsp").forward(request, response);
			
		}
		
	}

	
}
