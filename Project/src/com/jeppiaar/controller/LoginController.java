package com.jeppiaar.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jeppiaar.util.ConnectionUtil;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName=request.getParameter("username");
		String password=request.getParameter("password");
		String logout=request.getParameter("logout");
		String batch[]={"2013-2017","2014-2018","2015-2019"};
		String firstYear[]={"2016-2018"};
		String pgCourses[]={"2016-2018","2015-2019"};
		
		if(userName.equalsIgnoreCase("TRANSPORT")&&password.equalsIgnoreCase("JECTRANSPORT")){
			HttpSession session=request.getSession();
			session.setAttribute("userName", userName);
			
			response.sendRedirect("index.jsp");
			}
		else if(userName.equalsIgnoreCase("S&H")&&password.equalsIgnoreCase("JECS&H")){
			HttpSession session=request.getSession();
			session.setAttribute("userName", "S&H");
			session.setAttribute("batch", firstYear);
			response.sendRedirect("Attendence.jsp");
			}
		else if(userName.equalsIgnoreCase("AERO")&&password.equalsIgnoreCase("JECAERO")){
			HttpSession session=request.getSession();
			session.setAttribute("userName", "AERO");
			session.setAttribute("batch", batch);
			response.sendRedirect("Attendence.jsp");
			}
		else if(userName.equalsIgnoreCase("BIO")&&password.equalsIgnoreCase("JECBIO")){
			HttpSession session=request.getSession();
			session.setAttribute("userName", "BIO-TECH");
			session.setAttribute("batch", batch);
			response.sendRedirect("Attendence.jsp");
			}
		else if(userName.equalsIgnoreCase("CIVIL")&&password.equalsIgnoreCase("JECCIVIL")){
			HttpSession session=request.getSession();
			session.setAttribute("userName", "CIVIL");
			session.setAttribute("batch", batch);
			response.sendRedirect("Attendence.jsp");
			}
		else if(userName.equalsIgnoreCase("CSE")&&password.equalsIgnoreCase("JECCSE")){
			HttpSession session=request.getSession();
			session.setAttribute("userName", "CSE");
			session.setAttribute("batch", batch);
			response.sendRedirect("Attendence.jsp");
			}
		else if(userName.equalsIgnoreCase("ECE")&&password.equalsIgnoreCase("JECECE")){
			HttpSession session=request.getSession();
			session.setAttribute("userName", "ECE");
			session.setAttribute("batch", batch);
			response.sendRedirect("Attendence.jsp");
			}
		else if(userName.equalsIgnoreCase("EEE")&&password.equalsIgnoreCase("JECEEE")){
			HttpSession session=request.getSession();
			session.setAttribute("userName", "EEE");
			session.setAttribute("batch", batch);
			response.sendRedirect("Attendence.jsp");
			}
		else if(userName.equalsIgnoreCase("E&I")&&password.equalsIgnoreCase("JECE&I")){
			HttpSession session=request.getSession();
			session.setAttribute("userName", "E&I");
			session.setAttribute("batch", batch);
			response.sendRedirect("Attendence.jsp");
			}
		else if(userName.equalsIgnoreCase("MECH")&&password.equalsIgnoreCase("JECMECH")){
			HttpSession session=request.getSession();
			session.setAttribute("userName", "MECH");
			session.setAttribute("batch", batch);
			response.sendRedirect("Attendence.jsp");
			}
		else if(userName.equalsIgnoreCase("IT")&&password.equalsIgnoreCase("JECIT")){
			HttpSession session=request.getSession();
			session.setAttribute("userName", "IT");
			session.setAttribute("batch", batch);
			response.sendRedirect("Attendence.jsp");
			}
		else if(userName.equalsIgnoreCase("ME")&&password.equalsIgnoreCase("JECME")){
			HttpSession session=request.getSession();
			session.setAttribute("userName", "ME");
			session.setAttribute("batch", pgCourses);
			response.sendRedirect("Attendence.jsp");
			}
		else if(userName.equalsIgnoreCase("MBA")&&password.equalsIgnoreCase("JECMBA")){
			HttpSession session=request.getSession();
			session.setAttribute("userName", "MBA");
			session.setAttribute("batch", pgCourses);
			response.sendRedirect("Attendence.jsp");
			}
		else if(userName.equalsIgnoreCase("LIBRARY")&&password.equalsIgnoreCase("JECLIBRARY")){
			HttpSession session=request.getSession();
			session.setAttribute("userName", "LIBRARY");
			response.sendRedirect("Attendence.jsp");
			}
		else if(logout!=null&&logout.equalsIgnoreCase("logout")){
			HttpSession session=request.getSession();
			session.removeAttribute("userName");
			session.invalidate();
		}
		else{
			request.setAttribute("msg", "Invalid UserName or Password");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	}

}
