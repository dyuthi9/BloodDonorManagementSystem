
package com.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.PulseDAO;
import com.model.Donor;

@WebServlet("/SearchDonorServlet")
public class GetAllDonor extends HttpServlet {

		protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
	
	
		PulseDAO dao = new PulseDAO();
		
		String bloodGroup = request.getParameter("bloodGroup");
		String city = request.getParameter("city");
		List<Donor> donorList = dao.searchDonors(bloodGroup, city);
		request.setAttribute("donors", donorList);
		
		
		request.setAttribute("count", donorList.size());
		request.getRequestDispatcher("search-donor.jsp").forward(request, response);
	}
}
