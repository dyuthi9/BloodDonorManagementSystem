
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (!"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("admin-login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>PULSE | Admin Dashboard</title>
    <link rel="stylesheet" href="admin.css">

    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body class="admin-body">

    <!-- NAVBAR -->
    <header class="admin-navbar">

        <a href="admin-home.jsp" class="logo">
            <span class="logo-icon">
                <i class="fas fa-heartbeat"></i>
            </span>
            PULSE<span class="dot">.</span>
        </a>

        <nav>
            <a href="AdminDashboardServlet" class="active">
                <i class="fas fa-home"></i> Dashboard
            </a>

            <a href="SearchDonorAdminServlet">
                <i class="fas fa-users"></i> Donors
            </a>
        </nav>

        <a href="LogoutServlet?role=admin" class="admin-logout">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>

    </header>


    <!-- MAIN DASHBOARD -->
    <main class="admin-dashboard">

        <!-- WELCOME SECTION -->
        <section class="admin-welcome">

            <div>
                <span class="admin-tag">
                    <i class="fas fa-shield-heart"></i>
                    ADMIN PANEL
                </span>

                <h1>Welcome, Admin!</h1>

                <p>
                    Manage blood donors, monitor availability
                    and help save lives through PULSE.
                </p>
            </div>

            <div class="welcome-icon">
                <i class="fas fa-user-shield"></i>
            </div>

        </section>


<!-- STATISTICS -->
<section class="admin-stats">

    <!-- TOTAL DONORS -->
    <div class="stat-card">
        <div class="stat-icon red">
            <i class="fas fa-users"></i>
        </div>
        <div>
            <p>Total Donors</p>
            <h2>${totalCount}</h2>
            <small>Registered donors</small>
        </div>
    </div>

    <!-- AVAILABLE DONORS -->
    <div class="stat-card">
        <div class="stat-icon green">
            <i class="fas fa-heart-circle-check"></i>
        </div>
        <div>
            <p>Available Donors</p>
            <h2>${availableCount}</h2>
            <small>Ready to donate</small>
        </div>
    </div>

    <!-- UNAVAILABLE DONORS -->
    <div class="stat-card">
        <div class="stat-icon orange">
            <i class="fas fa-user-clock"></i>
        </div>
        <div>
            <p>Unavailable Donors</p>
            <h2>${unavailableCount}</h2>
            <small>Currently unavailable</small>
        </div>
    </div>

</section>


          


        <!-- MANAGEMENT SECTION -->
        <section class="management-section">

            <div class="section-heading">
                <h2>Management</h2>
                <p>Manage your blood donor system</p>
            </div>

            <div class="management-grid">

                <!-- VIEW DONORS -->
                <a href="SearchDonorAdminServlet"
                    class="management-card">

                    <div class="management-icon">
                        <i class="fas fa-users"></i>
                    </div>

                    <h3>View All Donors</h3>

                    <p>
                        View registered donors and their
                        personal and blood group details.
                    </p>

                    <span>
                        View Donors
                        <i class="fas fa-arrow-right"></i>
                    </span>

                </a>


                <!-- SEARCH DONORS -->
                <a href="SearchDonorAdminServlet"
                    class="management-card">

                    <div class="management-icon">
                        <i class="fas fa-magnifying-glass"></i>
                    </div>

                    <h3>Search Donors</h3>

                    <p>
                        Find donors based on blood group
                        and city.
                    </p>

                    <span>
                        Search Now
                        <i class="fas fa-arrow-right"></i>
                    </span>

                </a>


               

            </div>

        </section>


        <!-- FOOTER -->
        <footer class="admin-footer">

            <p>
                Every Drop Counts. Every Donor Matters.
                <span>❤️</span>
            </p>

            <small>
                © 2026 PULSE Blood Donor Management System
            </small>

        </footer>

    </main>

</body>
</html>
