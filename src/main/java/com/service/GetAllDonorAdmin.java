
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

@WebServlet("/SearchDonorAdminServlet")
public class GetAllDonorAdmin extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Check admin login
        if (!"admin".equals(
                request.getSession().getAttribute("role"))) {

            response.sendRedirect("admin-login.jsp");
            return;
        }

        PulseDAO dao = new PulseDAO();

        String bloodGroup = request.getParameter("bloodGroup");
        String city = request.getParameter("city");
        List<Donor> donorList = dao.searchDonors(bloodGroup, city);
        request.setAttribute("donors", donorList);


        request.setAttribute("count", donorList.size());

        request.getRequestDispatcher("admin-search-donors.jsp").forward(request, response);
    }
}
