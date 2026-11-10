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


@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PulseDAO dao =new PulseDAO(); 
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		RequestDispatcher dispatcher=null;
		HttpSession session =request.getSession(true);
		String donor="donor";

		boolean status =dao.checkLogin(email,password);
			
		if(status) {
			session.setAttribute("email", email);
			session.setAttribute("role",donor);
			System.out.println("checkLogin status = " + status + " for " + email);
			dispatcher=request.getRequestDispatcher("DonorProfileServlet");
			dispatcher.forward(request, response);
		}else {
			request.setAttribute("status", "Invalid Login Credentials..");
			System.out.println("invalid credentials");
			dispatcher=request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		
	}
		
}
