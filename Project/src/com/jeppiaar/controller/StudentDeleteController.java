package com.jeppiaar.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeppiaar.dao.RegisterStudentDAO;


@WebServlet("/StudentDeleteController")
public class StudentDeleteController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RegisterStudentDAO registerStudentDAO=new RegisterStudentDAO();
		String registerNo=request.getParameter("registerNo");
		Boolean flag=false;
		try {
			flag = registerStudentDAO.registerNoValidate(registerNo);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		if(flag==false){
			
			try {
				registerStudentDAO.deleteStudent(registerNo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("msg","valid");
			request.getRequestDispatcher("Delete.jsp").forward(request, response);
		}
		else{
			request.setAttribute("msg","invalid");
			request.getRequestDispatcher("Delete.jsp").forward(request, response);
			
		}
	}

	
}
