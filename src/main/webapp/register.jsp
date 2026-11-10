<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PULSE | Donor Registration</title>

<link rel="stylesheet" href="style.css?v=2">
    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap"
    rel="stylesheet">
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

    <main class="register-container">

        <div class="register-card">

            <div class="auth-icon">
                <i class="fas fa-user-plus"></i>
            </div>

            <h1>Become a Donor</h1>

            <p class="auth-subtitle">
                Join PULSE and become someone's lifesaver.
            </p>

            <form action="registerServlet" method="post">

                <div class="register-grid">
<% if(request.getAttribute("status") != null){ %>
            		<h1 style="text-align: center;"><%=request.getAttribute("status")%> </h1>
            <%} %>
                    <div class="form-group">
                        <label>Full Name</label>

                        <div class="input-box">
                            <i class="fas fa-user"></i>

                            <input type="text"
                            name="name"
                            placeholder="Enter your full name"
                            required>
                        </div>
                    </div>

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
                        <label>Phone Number</label>

                        <div class="input-box">
                            <i class="fas fa-phone"></i>

                            <input type="tel"
                            name="phone"
                            placeholder="10-digit mobile number"
                            pattern="[0-9]{10}"
                            maxlength="10"
                            required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Age</label>

                        <div class="input-box">
                            <i class="fas fa-calendar"></i>

                            <input type="number"
                            name="age"
                            placeholder="Enter your age"
                            min="18"
                            max="65"
                            required>
                        </div>
                    </div>
<div class="form-group">
    <label>Gender</label>

    <div class="input-box">
        <i class="fas fa-venus-mars"></i>

        <select name="gender" required>
            <option value="">Select Gender</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
            <option value="other">Other</option>
        </select>
    </div>
</div>
                    <div class="form-group">
                        <label>Blood Group</label>

                        <div class="input-box">
                            <i class="fas fa-droplet"></i>

                            <select name="bloodGroup" required>
                                <option value="">Select Blood Group</option>
                                <option value="A+">A+</option>
                                <option value="A-">A-</option>
                                <option value="B+">B+</option>
                                <option value="B-">B-</option>
                                <option value="O+">O+</option>
                                <option value="O-">O-</option>
                                <option value="AB+">AB+</option>
                                <option value="AB-">AB-</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>City</label>

                        <div class="input-box">
                            <i class="fas fa-location-dot"></i>

                            <input type="text"
                            name="city"
                            placeholder="Enter your city"
                            required>
                        </div>
                    </div>

                    <div class="form-group full-width">
                        <label>Address</label>

                        <div class="input-box">
                            <i class="fas fa-map-marker-alt"></i>

                            <input type="text"
                            name="address"
                            placeholder="Enter your complete address"
                            required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Password</label>

                        <div class="input-box">
                            <i class="fas fa-lock"></i>

                            <input type="password"
                            name="password"
                            placeholder="Create password"
                            minlength="6"
                            required>
                        </div>
                    </div>


                </div>

                <div class="availability">
                    <input type="checkbox"
                    name="available"
                    value="yes">

                    <label>
                        I am interested in donating blood when needed.
                    </label>
                </div>

                <button type="submit" class="auth-button">
                    Create Account
                    <i class="fas fa-arrow-right"></i>
                </button>

            </form>

            <p class="auth-footer">
                Already have an account?
                <a href="login.jsp">Login Here</a>
            </p>

        </div>

    </main>

</body>
</html>
