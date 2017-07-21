package com.jeppiaar.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeppiaar.dao.RegisterStudentDAO;
import com.jeppiaar.model.RegisterStudents;


@WebServlet("/StudentBPController")
public class StudentBPController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RegisterStudentDAO registerStudentDAO=new RegisterStudentDAO();
		RegisterStudents registerStudents=new RegisterStudents();
		String boardingPoint=request.getParameter("boardingPoint");
		String registerNo=request.getParameter("registerNo");
		Boolean flag=false;
		try {
			flag = registerStudentDAO.registerNoValidate(registerNo);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}	
		if(flag==false){
			registerStudents.setBoardingPoint(boardingPoint);
			registerStudents.setRegisterNo(registerNo);
			try {
				registerStudentDAO.changeBoardingPoint(registerStudents);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("msg","valid");
			request.getRequestDispatcher("BoardingPoint.jsp").forward(request, response);
		}
		else{
			request.setAttribute("msg","invalid");
			request.getRequestDispatcher("BoardingPoints.jsp").forward(request, response);
		}
	
	}

	

}
