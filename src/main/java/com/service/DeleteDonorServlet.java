
package com.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.PulseDAO;

@WebServlet("/DeleteDonorServlet")
public class DeleteDonorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
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

            boolean deleted = dao.deleteDonor(donorId);

            if (deleted) {
                dao.commit();
                response.sendRedirect("SearchDonorAdminServlet");
            } else {
               dao.rollback();
                response.sendRedirect("SearchDonorAdminServlet?error=delete");
            }

        } catch (NumberFormatException e) {
            response.sendRedirect("SearchDonorAdminServlet");
        }
    }
}
