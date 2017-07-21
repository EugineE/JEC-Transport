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
import com.jeppiaar.model.Maintenenece;


@WebServlet("/MaintenanceContoller")
public class MaintenanceContoller extends HttpServlet {
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String vechileNo=request.getParameter("vechileNo");
			String vechileType=request.getParameter("vechileType");
			String amount=request.getParameter("Amount");
			String reason=request.getParameter("Reason");
			DateFormat format= new SimpleDateFormat("dd/MM/yyyy");
			Date date = null;
			try {
				date = format.parse(request.getParameter("Date"));
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			Maintenenece maintenenece=new Maintenenece();
			VechileDao vechileDao=new VechileDao();
			maintenenece.setVechileNo(vechileNo);
			maintenenece.setVechileType(vechileType);
			maintenenece.setReason(reason);
			maintenenece.setDate(date);
			maintenenece.setAmount(amount);
			try {
				vechileDao.maintain(maintenenece);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("msg", "valid");
			request.getRequestDispatcher("VechileMaintenance.jsp").forward(request, response);
	}

	
}
