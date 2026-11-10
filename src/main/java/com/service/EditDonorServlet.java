
package com.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.PulseDAO;
import com.model.Donor;

@WebServlet("/EditDonorServlet")
public class EditDonorServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        if (!"admin".equals(request.getSession().getAttribute("role"))) {
            response.sendRedirect("admin-login.jsp");
            return;
        }

        try {
            int donorId = Integer.parseInt(
                request.getParameter("donor_id")
            );

            PulseDAO dao = new PulseDAO();

            Donor donor = dao.getDonorById(donorId);

            if (donor == null) {
                response.sendRedirect("SearchDonorAdminServlet");
                return;
            }

            request.setAttribute("donor", donor);

            request.getRequestDispatcher("edit-donor.jsp")
                   .forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("SearchDonorAdminServlet");
        }
    }
}
