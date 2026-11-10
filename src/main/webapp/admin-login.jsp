
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>PULSE | Admin Login</title>

    <link rel="stylesheet" href="admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body class="auth-body">

    <header class="auth-navbar">
        <a href="index.jsp" class="logo">
            <span class="logo-icon">
                <i class="fas fa-heartbeat"></i>
            </span>
            PULSE<span class="dot">.</span>
        </a>

        <a href="index.jsp" class="back-home">
            <i class="fas fa-arrow-left"></i> Back to Home
        </a>
    </header>

    <main class="auth-container">

        <!-- Admin Login Form -->
        <section class="auth-card">

            <div class="auth-icon">
                <i class="fas fa-user-shield"></i>
            </div>

            <h1>Admin Login</h1>

            <p class="auth-subtitle">
                Welcome back! Login to manage PULSE.
            </p>

            <form action="AdminLoginServlet" method="post">

                <div class="form-group">
                    <label>Admin Email</label>

                    <div class="input-box">
                        <i class="fas fa-envelope"></i>

                        <input type="email"
                               name="email"
                               placeholder="Enter admin email"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Password</label>

                    <div class="input-box">
                        <i class="fas fa-lock"></i>

                        <input type="password"
                               name="password"
                               placeholder="Enter password"
                               required>
                    </div>
                </div>

                <button type="submit" class="auth-button">
                    Login as Admin
                    <i class="fas fa-arrow-right"></i>
                </button>

            </form>

            <div class="auth-footer">
                <a href="index.jsp">
                    <i class="fas fa-home"></i> Return to Homepage
                </a>
            </div>

        </section>

        <!-- Right Side -->
        <section class="auth-message">

            <i class="fas fa-shield-heart"
               style="font-size:55px; margin-bottom:25px;"></i>

            <h2>Manage. Monitor. Save Lives.</h2>

            <p>
                Welcome to the PULSE Admin Portal.
                Manage registered donors, monitor availability,
                and help connect people with life-saving blood donations.
            </p>

            <span>
                <i class="fas fa-heartbeat"></i>
                Every Drop Counts. Every Donor Matters.
            </span>

        </section>

    </main>

</body>
</html>
