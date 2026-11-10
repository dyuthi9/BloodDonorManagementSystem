package com.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PulseDAO;


@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
PulseDAO dao =new PulseDAO(); 
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String admin="admin";
		RequestDispatcher dispatcher=null;
		HttpSession session =request.getSession(true);
		if(email.equals("admin@gmail.com") && password.equals("123456")) {
			session.setAttribute("adminEmail", email);
			session.setAttribute("role",admin);
			dispatcher=request.getRequestDispatcher("AdminDashboardServlet");
			dispatcher.forward(request, response);
		}else {
			request.setAttribute("status", "Invalid Login Credentials..");
			dispatcher=request.getRequestDispatcher("admin-login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
