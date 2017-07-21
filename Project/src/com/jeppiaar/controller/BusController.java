package com.jeppiaar.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeppiaar.dao.Route;


@WebServlet("/BusController")
public class BusController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String studentdepartment[]=null,batch[]=null,staffDepartment[]=null;
		Route route=new Route();
		ArrayList<String> bus=new ArrayList<String>();
		String previous[]=null;
		String pre=request.getParameter("previous");
		if(pre!=null){
		previous=pre.split(",");
		}
		String No[]=request.getParameterValues("busNo");
		
		for(String temp:No)
			bus.add(temp);
		if(previous!=null)
		for(String temp:previous)
			bus.add(temp);
		String student=request.getParameter("studentdepartment");
		String staff=request.getParameter("staffDepartment");
		String bat=request.getParameter("batch");
		String attendence=request.getParameter("attendence");
		
		//combining combine route
		String combine=request.getParameter("combine");
		System.out.println(combine);
		if(combine!=null){
		try {
			route.combingRoutes(combine, No);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
			
		}
		else{
			//combine route
			try {
				route.combine(No);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
			
		//System.out.println(student);
		if(student!=null){
		studentdepartment=student.split(",");
		batch=bat.split(",");
		}
		if(staff!=null)
		staffDepartment=staff.split(",");
		request.setAttribute("attendence", attendence);
		request.setAttribute("studentdepartment", studentdepartment);
		request.setAttribute("staffDepartment", staffDepartment);
		request.setAttribute("batch", batch);
		String busNo[]=bus.toArray(new String[0]);
		request.setAttribute("msg",busNo);	
		request.getRequestDispatcher("BusRoute.jsp").forward(request, response);
	}

	
}
