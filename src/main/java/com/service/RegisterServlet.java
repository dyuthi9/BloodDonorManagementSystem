package com.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.PulseDAO;
import com.model.Donor;


@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PulseDAO dao=new PulseDAO();
		
		Donor donor = new Donor();
		
		donor.setName(request.getParameter("name"));
		donor.setEmail(request.getParameter("email"));
		donor.setPhone(request.getParameter("phone"));
		donor.setAge(Integer.parseInt(request.getParameter("age")));
		donor.setGender(request.getParameter("gender"));
		donor.setBloodGroup(request.getParameter("bloodGroup"));
		donor.setCity(request.getParameter("city"));
		donor.setAddress(request.getParameter("address"));
		donor.setPassword(request.getParameter("password"));
        String available = request.getParameter("available") != null? "yes" : "no";
        donor.setAvailable(available);
		boolean status = dao.registerUser(donor);
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("register.jsp");
		
		if(status) {
			dao.commit();
			request.setAttribute("status", "Registered Successfully..");
			dispatcher.forward(request, response);
		}else {
			dao.rollback();
			request.setAttribute("status", "Error in Registering the Donor..");
			dispatcher.forward(request, response);
		}

		
		
	}

}
