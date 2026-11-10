package com.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PulseDAO;
import com.model.Donor;

@WebServlet("/UpdateDonorServlet")
public class UpdateDonorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String role = (session == null) ? null : (String) session.getAttribute("role");

        boolean isAdmin = "admin".equals(role);
        boolean isDonor = "donor".equals(role);

        if (!isAdmin && !isDonor) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            Donor donor = new Donor();

            if (isAdmin) {
                // Admin: values come from the admin edit form
                donor.setDonorId(Integer.parseInt(request.getParameter("donor_id")));
                donor.setEmail(request.getParameter("email"));
                donor.setBloodGroup(request.getParameter("bloodGroup"));
            } else {
                // Donor: identity comes from the session, never from the form
                Donor current = (Donor) session.getAttribute("donor");

                if (current == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }

                donor.setDonorId(current.getDonorId());
                donor.setEmail(current.getEmail());
                donor.setBloodGroup(current.getBloodGroup());
            }

            donor.setName(request.getParameter("name"));
            donor.setPhone(request.getParameter("phone"));
            donor.setAge(Integer.parseInt(request.getParameter("age")));
            donor.setGender(request.getParameter("gender"));
            donor.setCity(request.getParameter("city"));
            donor.setAddress(request.getParameter("address"));
            donor.setAvailable(request.getParameter("available"));

            PulseDAO dao = new PulseDAO();

            boolean updated = dao.updateDonor(donor);
            System.out.println("UPDATE id=" + donor.getDonorId()
            + " email=" + donor.getEmail()
            + " bg=" + donor.getBloodGroup()
            + " gender=" + donor.getGender()
            + " available=" + donor.getAvailable());
            if (updated) {
                dao.commit();

                if (isAdmin) {
                    response.sendRedirect("SearchDonorAdminServlet");
                } else {
                    // Reloads the donor from the DB into the session
                    response.sendRedirect("DonorProfileServlet");
                }

            } else {
                dao.rollback();

                if (isAdmin) {
                    request.setAttribute("error", "Unable to update donor details.");
                    request.setAttribute("donor", donor);
                    request.getRequestDispatcher("edit-donor.jsp")
                           .forward(request, response);
                } else {
                    response.sendRedirect("donor-dashboard.jsp?error=update");
                }
            }

        } catch (NumberFormatException e) {
            response.sendRedirect(isAdmin ? "SearchDonorAdminServlet"
                                          : "donor-dashboard.jsp");
        }
    }
}