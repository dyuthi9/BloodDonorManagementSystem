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

@WebServlet("/DonorProfileServlet")
public class DonorProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check whether donor is logged in
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String email = (String) session.getAttribute("email");

        PulseDAO dao = new PulseDAO();

        // Retrieve donor details from database
        Donor donor = dao.getDonorById(email);
        System.out.println("donor found = " + (donor != null));

        if (donor != null) {
            session.setAttribute("donor", donor);

            response.sendRedirect("donor-dashboard.jsp");
        } else {
            session.invalidate();
            response.sendRedirect("login.jsp");
        }
    }
}