<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PULSE | Login</title>

<link rel="stylesheet" href="style.css?v=2">
    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap"
    rel="stylesheet">
</head>

<body class="auth-body">
<% if (request.getAttribute("status") != null) { %>
    <p style="color:#ed0925; font-size:13px; margin-bottom:15px;">
        <%= request.getAttribute("status") %>
    </p>
<% } %>
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

        <div class="auth-card">

            <div class="auth-icon">
                <i class="fas fa-heartbeat"></i>
            </div>

            <h1>Welcome Back!</h1>

            <p class="auth-subtitle">
                Login to your PULSE account
            </p>

            <form action="loginServlet" method="get">

                <div class="form-group">
                    <label>Email Address</label>

                    <div class="input-box">
                        <i class="fas fa-envelope"></i>

                        <input type="email"
                        name="email"
                        placeholder="Enter your email"
                        required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Password</label>

                    <div class="input-box">
                        <i class="fas fa-lock"></i>

                        <input type="password"
                        name="password"
                        placeholder="Enter your password"
                        required>
                    </div>
                </div>

                <button type="submit" class="auth-button">
                    Login <i class="fas fa-arrow-right"></i>
                </button>

            </form>

            <p class="auth-footer">
                Don't have an account?
                <a href="register.jsp">Register Now</a>
            </p>

            <div class="auth-divider">
                <span>OR</span>
            </div>

            <a href="index.jsp" class="home-link">
                <i class="fas fa-house"></i> Continue to Home
            </a>

        </div>

        <div class="auth-message">
            <h2>Every Drop Counts.</h2>
            <p>
                Your one donation can give someone another chance
                at life. Be a hero. Be a donor.
            </p>
            <span>❤️ Donate Blood. Save Lives.</span>
        </div>

    </main>
  

</body>
</html>
    