package com.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        String role = request.getParameter("role");

        if (session != null) {

            if ("admin".equals(role)) {
                session.removeAttribute("adminName");
                response.sendRedirect("admin-login.jsp");

            } else {
                session.removeAttribute("donorName");
                response.sendRedirect("login.jsp");
            }

        } else {
            response.sendRedirect("index.jsp");
        }
    }
}