package com.jeppiaar.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeppiaar.dao.VechileDao;
import com.jeppiaar.model.Vechile;


@WebServlet("/VechileDetialsController")
public class VechileDetialsController extends HttpServlet {
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String vechileNo=request.getParameter("vechileNo");
		String vechileType=request.getParameter("vechileType");
		String fcAmount=request.getParameter("FcAmount");
		String insureneceAmount=request.getParameter("insurenceAmount");
		String roadtaxAmount=request.getParameter("roadtaxAmount");
		String permitAmount=request.getParameter("permitAmount");
		DateFormat format= new SimpleDateFormat("dd/MM/yyyy");
		Date fcDate = null,insurenceDate=null,permitDate=null,roadtaxDate=null;
		Boolean flag=false;
		VechileDao vechileDao=new VechileDao();
		
		try {
			flag=vechileDao.validateNo(vechileNo);
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			fcDate = format.parse(request.getParameter("FcDate"));
			insurenceDate = format.parse(request.getParameter("insurenceDate"));
			permitDate = format.parse(request.getParameter("permitDate"));
			roadtaxDate = format.parse(request.getParameter("roadtaxDate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		if(flag){
		Vechile vechile=new Vechile();
		vechile.setVechileNo(vechileNo);
		vechile.setVechileType(vechileType);
		vechile.setFcAmount(fcAmount);
		vechile.setFcDate(fcDate);
		vechile.setRoadtaxDate(roadtaxDate);
		vechile.setPermitDate(permitDate);
		vechile.setInsurenceDate(insurenceDate);
		vechile.setPermitAmount(permitAmount);
		vechile.setRoadtaxAmount(roadtaxAmount);
		vechile.setInsureneceAmount(insureneceAmount);
		
		try {
			vechileDao.add(vechile);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("msg", "valid");
		request.getRequestDispatcher("VechileDetials.jsp").forward(request, response);
		}
		else{
			request.setAttribute("msg", "invalid");
			request.getRequestDispatcher("VechileDetials.jsp").forward(request, response);
		}
		}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
