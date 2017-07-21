package com.jeppiaar.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeppiaar.dao.Route;


@WebServlet("/AddRouteController")
public class AddRouteController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	String busNO=request.getParameter("BusNo");
	String boardingPoint=request.getParameter("boardingPoint");
	Route route=new Route();
	try {
		route.addRoute(busNO, boardingPoint);
		request.setAttribute("msg","valid");
		request.getRequestDispatcher("AddRoute.jsp").forward(request, response);
	} 
	catch (ClassNotFoundException | SQLException e) {
		request.setAttribute("msg","invalid");
		request.getRequestDispatcher("AddRoute.jsp").forward(request, response);
	}
		
	
	}

	

}
