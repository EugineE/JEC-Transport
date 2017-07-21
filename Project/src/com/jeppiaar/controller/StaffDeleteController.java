package com.jeppiaar.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeppiaar.dao.RegisterStaff;


@WebServlet("/StaffDeleteController")
public class StaffDeleteController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RegisterStaff registerStaff=new RegisterStaff();
		String staffId=request.getParameter("staffId");
		Boolean flag=false;
		try {
			flag = registerStaff.validateStaffId(staffId);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		if(flag==false){
			
			try {
				registerStaff.deleteStaff(staffId);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("msgStaff","valid");
			request.getRequestDispatcher("Delete.jsp").forward(request, response);
		}
		else{
			request.setAttribute("msgStaff","invalid");
			request.getRequestDispatcher("Delete.jsp").forward(request, response);
			
		}
	}

	

}
