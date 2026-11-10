
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

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Check admin session
        if (!"admin".equals(request.getSession().getAttribute("role"))) {
            response.sendRedirect("admin-login.jsp");
            return;
        }

        PulseDAO dao = new PulseDAO();

        // Fetch all donors
        List<Donor> donors = dao.fetchAllData();

        int totalCount = donors.size();
        int availableCount = 0;
        int unavailableCount = 0;

        // Calculate donor counts
        for (Donor donor : donors) {

            if ("yes".equalsIgnoreCase(donor.getAvailable())) {
                availableCount++;
            } else {
                unavailableCount++;
            }
        }

        // Send counts to JSP
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("availableCount", availableCount);
        request.setAttribute("unavailableCount", unavailableCount);

        request.getRequestDispatcher("admin-home.jsp")
               .forward(request, response);
    }
    
    

        protected void doGet(HttpServletRequest request,
                             HttpServletResponse response)
                throws ServletException, IOException {


            // Check admin session
            if (!"admin".equals(request.getSession().getAttribute("role"))) {
                response.sendRedirect("admin-login.jsp");
                return;
            }

            PulseDAO dao = new PulseDAO();

            // Fetch all donors
            List<Donor> donors = dao.fetchAllData();

            int totalCount = donors.size();
            int availableCount = 0;
            int unavailableCount = 0;

            // Calculate donor counts
            for (Donor donor : donors) {

                if ("yes".equalsIgnoreCase(donor.getAvailable())) {
                    availableCount++;
                } else {
                    unavailableCount++;
                }
            }

            // Send counts to JSP
            request.setAttribute("totalCount", totalCount);
            request.setAttribute("availableCount", availableCount);
            request.setAttribute("unavailableCount", unavailableCount);

            request.getRequestDispatcher("admin-home.jsp")
                   .forward(request, response);
    }
}
