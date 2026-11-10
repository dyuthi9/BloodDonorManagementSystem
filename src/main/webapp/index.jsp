<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PULSE | Blood Donor Management</title>
<link rel="stylesheet" href="style.css?v=2">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>

    <!-- Navigation Bar -->
    <header class="navbar">

        <a href="index.jsp" class="logo">
            <span class="logo-icon"><i class="fas fa-heartbeat"></i></span>
            PULSE<span class="dot">.</span>
        </a>

        <nav>
            <a href="index.jsp" class="active">
                <i class="fas fa-house"></i> Home
            </a>

            <a href="SearchDonorServlet">
                <i class="fas fa-magnifying-glass"></i> Search Donors
            </a>

          

            <a href="admin-login.jsp">
                <i class="fas fa-briefcase-medical"></i> Admin
            </a>
        </nav>

        <a href="login.jsp" class="profile">
            <i class="fas fa-user"></i>
        </a>

    </header>


    <!-- Hero Section -->
    <main class="hero">

        <!-- Left Content -->
        <section class="hero-content">

            <div class="tag">
                <span></span>
                EMERGENCY NETWORK
            </div>

            <h1>
                Be the Reason<br>
                <span>A Heart Keeps</span><br>
                Beating.
            </h1>

            <p>
                PULSE connects you with verified blood donors in real-time.
                A simple act of kindness can gift someone a lifetime.
            </p>

            <div class="hero-buttons">

                <a href="register.jsp" class="primary-btn">
                    <i class="far fa-heart"></i>
                    Join as Donor
                </a>

                <a href="SearchDonorServlet" class="secondary-btn">
                    <i class="fas fa-magnifying-glass"></i>
                    Find Donors
                    <i class="fas fa-arrow-right"></i>
                </a>

            </div>

            
        </section>


        <!-- Right Illustration -->
        <section class="hero-image">

            <div class="verified-badge">
                <div class="verified-icon">
                    <i class="fas fa-shield-heart"></i>
                </div>

                <div>
                    <strong>100% Verified</strong>
                    <small>DONOR PROFILES</small>
                </div>
            </div>

            <div class="illustration">

                <svg viewBox="0 0 400 380"
                     xmlns="http://www.w3.org/2000/svg">

                    <!-- Heart -->
                    <path d="M275 75
                    C275 35 335 30 345 80
                    C355 30 415 35 415 90
                    C415 145 345 195 345 195
                    C345 195 275 145 275 75Z"
                    fill="none"
                    stroke="#fff"
                    stroke-width="7"/>

                    <!-- Blood Bag -->
                    <path d="M90 120 L165 120
                    Q175 120 175 132
                    L175 230 Q175 242 165 242
                    L90 242 Q80 242 80 230
                    L80 132 Q80 120 90 120Z"
                    fill="none"
                    stroke="#fff"
                    stroke-width="6"/>

                    <!-- Bag lines -->
                    <path d="M92 140 H162
                    M92 160 H162
                    M92 180 H162
                    M92 200 H162
                    M92 220 H162"
                    stroke="#fff"
                    stroke-width="4"/>

                    <!-- Tube -->
                    <path d="M128 242
                    L128 275
                    C128 300 165 300 190 300
                    C215 300 225 275 225 255"
                    fill="none"
                    stroke="#fff"
                    stroke-width="6"
                    stroke-linecap="round"/>

                    <!-- Heartbeat -->
                    <path d="M190 255
                    L210 255 L220 235
                    L235 280 L250 245
                    L260 255 L280 255"
                    fill="none"
                    stroke="#fff"
                    stroke-width="5"
                    stroke-linejoin="round"/>

                </svg>

            </div>

        </section>

    </main>


    <!-- Bottom message -->
    <footer>
        <p>Every drop counts. Every donor matters. <span>❤️</span></p>
    </footer>

</body>
</html>
