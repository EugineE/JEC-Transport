package com.jeppiaar.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeppiaar.dao.RegisterStaff;
import com.jeppiaar.dao.RegisterStudentDAO;
import com.jeppiaar.util.ConnectionUtil;

			
@WebServlet("/StatusController")
public class StatusController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String studentcondition="",staffcondition="";
		String department=request.getParameter("department");
		
		String Reg[]=request.getParameterValues("status");
		String Id[]=request.getParameterValues("staffStatus");
		RegisterStudentDAO registerStudentDAO=new RegisterStudentDAO();
		RegisterStaff registerStaff=new RegisterStaff();
		try {
			registerStudentDAO.status(department);
			registerStaff.status(department);
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if(Reg!=null){
			for(int i=Reg.length-1;i>=0;i--)
			{
				if(i==0)
					studentcondition+=" registerno='"+Reg[i]+"'";
				else
					studentcondition+=" registerno='"+Reg[i]+"' OR";

			}}
			if(Id!=null){
			for(int i=Id.length-1;i>=0;i--)
			{
				if(i==0)
					staffcondition+=" staffid='"+Id[i]+"'";
				else
					staffcondition+=" staffid='"+Id[i]+"' OR";

			}}
			Boolean flagStudent=false,flagStaff=false;
			try {
				if(Id!=null)
				flagStaff=registerStaff.updatestatus(staffcondition);
				if(Reg!=null)
				flagStudent = registerStudentDAO.updatestatus(studentcondition);
				
				registerStudentDAO.attendence(department);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			request.setAttribute("msg", "Upadate sucessfully");
			request.getRequestDispatcher("AttendenceUpdate.jsp").forward(request, response);
			
	}

	

}
