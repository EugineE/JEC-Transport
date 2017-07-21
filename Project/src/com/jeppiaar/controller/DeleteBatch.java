package com.jeppiaar.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeppiaar.dao.RegisterStudentDAO;


@WebServlet("/DeleteBatch")
public class DeleteBatch extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RegisterStudentDAO registerStudentDAO=new RegisterStudentDAO();
		String batch=request.getParameter("batch");
		Boolean flag=false;
		try {
			 flag=registerStudentDAO.validateBatch(batch);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag){
			try {
				registerStudentDAO.deleteBatch(batch);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("msg","valid");
			request.getRequestDispatcher("Batch.jsp").forward(request, response);
		}
		else{
			request.setAttribute("msg","invalid");
			request.getRequestDispatcher("Batch.jsp").forward(request, response);
			
		}
			
	}

	

}
