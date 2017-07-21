package com.jeppiaar.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
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
import com.jeppiaar.util.ConnectionUtil;


@WebServlet("/FuelController")
public class FuelController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no=request.getParameter("vechileNo");
		String type=request.getParameter("vechileType");
		String km=request.getParameter("Km");
		String liter=request.getParameter("Liter");
		String amount=request.getParameter("Amount");
		DateFormat format= new SimpleDateFormat("dd/MM/yyyy");
		Date date = null;
		String vechileType=null;
		try {
			date = format.parse(request.getParameter("date"));
			String sql="select vechile_type from vechile_detials where vechile_no='"+no+"' ;";
			Connection connection=ConnectionUtil.getconnection();
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery(sql);
			while(resultSet.next()){
				vechileType=resultSet.getString("vechile_type");
				
			}
				Vechile vechile=new Vechile();
				vechile.setVechileNo(no);
				vechile.setVechileType(vechileType);
				vechile.setKiloMeter(Integer.parseInt(km));
				vechile.setLiter(Integer.parseInt(liter));
				vechile.setFuelAmount(Integer.parseInt(amount));
				vechile.setFuelDate(date);
				VechileDao dao=new VechileDao();
				dao.fuel(vechile);
				request.setAttribute("msg", "valid");
				request.getRequestDispatcher("fuel.jsp").forward(request, response);
	
			
		} catch (Exception e) {
			request.setAttribute("msg", "invalid");
			request.getRequestDispatcher("fuel.jsp").forward(request, response);
			e.printStackTrace();
		}
			
	}

}
