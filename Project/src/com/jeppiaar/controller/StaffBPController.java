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

@WebServlet("/StaffBPController")
public class StaffBPController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Staff staff=new Staff();
		RegisterStaff registerStaff=new RegisterStaff();
		String staffId=request.getParameter("staffid");
		String boardingPoint=request.getParameter("boardingPoint");
		Boolean flag=false;
		try {
			flag = registerStaff.validateStaffId(staffId);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		if(flag==false){
			
			staff.setBoardingPoint(boardingPoint);
			staff.setStaffId(staffId);
			try {
				registerStaff.changeBoardingPoint(staff);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("msgStaff","valid");
			request.getRequestDispatcher("BoardingPoint.jsp").forward(request, response);
		}
		else{
			request.setAttribute("msgStaff","invalid");
			request.getRequestDispatcher("BoardingPoint.jsp").forward(request, response);
			
		}
	}

	
}
