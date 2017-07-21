package com.jeppiaar.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeppiaar.dao.Report;
import com.jeppiaar.model.Maintenenece;
import com.jeppiaar.model.Vechile;


@WebServlet("/ReportController")
public class ReportController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reportType=request.getParameter("reportType");
		String vechileNo=request.getParameter("vechileNo");
		String vechileType=request.getParameter("vechileType");
		Report report=new Report();
		List<Vechile> list= new ArrayList<Vechile>(); 
		List<Maintenenece> list1=new ArrayList<Maintenenece>();
		DateFormat format= new SimpleDateFormat("dd/MM/yyyy");
		Date start = null;
		Date end= null;
		try {
			start = format.parse(request.getParameter("start"));
			end = format.parse(request.getParameter("end"));
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(reportType.equals("FUEL")){
			
			if(request.getParameter("vechileNo")!=""){
				Vechile vechile=new Vechile();
				vechile.setVechileNo(vechileNo);
				vechile.setStart(start);
				vechile.setEnd(end);
				try {
					
					list=report.fuelReportByNo(vechile);
					RequestDispatcher dispatcher=request.getRequestDispatcher("fuelReport.jsp");
					request.setAttribute("list", list);
					dispatcher.forward(request, response);
				} catch (ClassNotFoundException | SQLException e) {
					
					e.printStackTrace();
				}
			}
			else {
				Vechile vechile=new Vechile();
				vechile.setVechileType(vechileType);
				vechile.setStart(start);
				vechile.setEnd(end);
				try {
					if(vechileType.equalsIgnoreCase("ALL")){
						list=report.fuelReportAll(vechile);
					}
					else{
						list=report.fuelReportByType(vechile);
					}
						
					
					RequestDispatcher dispatcher=request.getRequestDispatcher("fuelReport.jsp");
					request.setAttribute("list", list);
					dispatcher.forward(request, response);
				} catch (ClassNotFoundException | SQLException e) {
					
					e.printStackTrace();
				}
			}
		} else if(reportType.equals("MAINTENACE")){
			if(vechileNo!=""){
				Vechile vechile=new Vechile();
				vechile.setVechileNo(vechileNo);
				vechile.setStart(start);
				vechile.setEnd(end);
				try {
					list1=report.maintenanceReportByNo(vechile);
					RequestDispatcher dispatcher=request.getRequestDispatcher("maintenanceReport.jsp");
					request.setAttribute("list", list1);
					dispatcher.forward(request, response);
				} catch (ClassNotFoundException | SQLException e) {
					
					e.printStackTrace();
				}
			}
			else{
				
				Vechile vechile=new Vechile();
				vechile.setVechileType(vechileType);
				vechile.setStart(start);
				vechile.setEnd(end);
				try {if(vechileType.equalsIgnoreCase("ALL")){
					list1=report.maintenanceReportAll(vechile);
				}
				else{
					list1=report.maintenanceReportByType(vechile);
				}
					
					RequestDispatcher dispatcher=request.getRequestDispatcher("maintenanceReport.jsp");
					request.setAttribute("list", list1);
					dispatcher.forward(request, response);
				} catch (ClassNotFoundException | SQLException e) {
					
					e.printStackTrace();
				}
			}
		}else if(reportType.equals("PAYMENTS")){
			if(vechileNo!=""){
				Vechile vechile=new Vechile();
				vechile.setVechileNo(vechileNo);
				vechile.setStart(start);
				vechile.setEnd(end);
				RequestDispatcher dispatcher=request.getRequestDispatcher("paymentReport.jsp");
				request.setAttribute("vechileNo",vechile );
				dispatcher.forward(request, response);
			}
			else{
				
				Vechile vechile=new Vechile();
				vechile.setVechileType(vechileType);
				vechile.setStart(start);
				vechile.setEnd(end);
				RequestDispatcher dispatcher=request.getRequestDispatcher("paymentReport.jsp");
				if(vechileType.equalsIgnoreCase("ALL")){
					
					request.setAttribute("all", vechile);
				}
				else{
					
					request.setAttribute("vechileType", vechile);
				}
					
					
					
					dispatcher.forward(request, response);
				
			}
		}
	}

	

}
