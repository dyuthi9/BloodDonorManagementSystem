<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
if (!"donor".equals(session.getAttribute("role"))) {
    response.sendRedirect("login.jsp");
    return;
}
    com.model.Donor donor =
        (com.model.Donor) session.getAttribute("donor");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>PULSE | Donor Dashboard</title>

	<link rel="stylesheet" href="style.css?v=2">
	<link rel="stylesheet" href="dashboard.css">

    <link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body class="dashboard-body">

<!-- NAVBAR -->
<header class="navbar dashboard-navbar">

    <a href="index.jsp" class="logo">
        <span class="logo-icon">
            <i class="fa-solid fa-heart-pulse"></i>
        </span>
        PULSE<span class="dot">.</span>
    </a>

    <nav>
        <a href="#profile" class="active"
           onclick="showSection('profile', this)">
            <i class="fa-solid fa-user"></i> My Profile
        </a>

        <a href="#edit"
           onclick="showSection('edit', this)">
            <i class="fa-solid fa-pen-to-square"></i> Edit Profile
        </a>
        
    </nav>

    <a href="LogoutServlet" class="logout-btn">
        <i class="fa-solid fa-right-from-bracket"></i> Logout
    </a>

</header>


<!-- DASHBOARD HEADING -->
<main class="dashboard-container">

    <div class="dashboard-heading">

        <div>
            <span class="dashboard-tag">
                <i class="fa-solid fa-heart-pulse"></i>
                DONOR DASHBOARD
            </span>

            <h1>Welcome, <span><%= donor.getName() %></span>!</h1>

            <p>Manage your donor profile and donation information.</p>
        </div>

        <div class="welcome-icon">
            <i class="fa-solid fa-hand-holding-heart"></i>
        </div>

    </div>


    <!-- PROFILE SECTION -->
    <section id="profile" class="dashboard-section active-section">

        <div class="section-title">
            <div>
                <h2><i class="fa-solid fa-user"></i> My Profile</h2>
                <p>Your registered donor information</p>
            </div>

            <button class="dashboard-btn"
                onclick="showSection('edit', document.querySelectorAll('.dashboard-navbar nav a')[1])">
                <i class="fa-solid fa-pen"></i> Edit Profile
            </button>
        </div>

        <div class="profile-card">

            <div class="profile-header">

                <div class="profile-avatar">
                    <i class="fa-solid fa-user"></i>
                </div>

                <div>
                    <h2><%= donor.getName() %></h2>
                    <p>Registered Blood Donor</p>
                </div>

                <span class="blood-badge">
                    <%= donor.getBloodGroup() %>
                </span>

            </div>

            <div class="profile-grid">

                <div class="profile-item">
                    <label><i class="fa-solid fa-envelope"></i> Email</label>
                    <p><%= donor.getEmail() %></p>
                </div>

                <div class="profile-item">
                    <label><i class="fa-solid fa-phone"></i> Phone</label>
                    <p><%= donor.getPhone() %></p>
                </div>

                <div class="profile-item">
                    <label><i class="fa-solid fa-calendar"></i> Age</label>
                    <p><%= donor.getAge() %> Years</p>
                </div>

                <div class="profile-item">
                    <label><i class="fa-solid fa-venus-mars"></i> Gender</label>
                    <p><%= donor.getGender() %></p>
                </div>

                <div class="profile-item">
                    <label><i class="fa-solid fa-droplet"></i> Blood Group</label>
                    <p><%= donor.getBloodGroup() %></p>
                </div>

                <div class="profile-item">
                    <label><i class="fa-solid fa-location-dot"></i> City</label>
                    <p><%= donor.getCity() %></p>
                </div>

                <div class="profile-item full-profile">
                    <label><i class="fa-solid fa-map"></i> Address</label>
                    <p><%= donor.getAddress() %></p>
                </div>

                <div class="profile-item">
                    <label><i class="fa-solid fa-heart"></i> Availability</label>

                    <p class="availability-text">
                        <%= donor.getAvailable() %>
                    </p>
                </div>

            </div>

        </div>

    </section>


    <!-- EDIT PROFILE SECTION -->
    <section id="edit" class="dashboard-section">

        <div class="section-title">
            <div>
                <h2><i class="fa-solid fa-pen-to-square"></i> Modify Profile</h2>
                <p>Update your personal information</p>
            </div>
        </div>

        <div class="edit-card">

            <form action="UpdateDonorServlet" method="post">

                <div class="edit-grid">

                    <div class="form-group">
                        <label>Full Name</label>
                        <div class="input-box">
                            <i class="fa-solid fa-user"></i>
                            <input type="text" name="name"
                                value="<%= donor.getName() %>" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Email Address</label>
                        <div class="input-box">
                            <i class="fa-solid fa-envelope"></i>
                            <input type="email" name="email"
                                value="<%= donor.getEmail() %>" readonly>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Phone Number</label>
                        <div class="input-box">
                            <i class="fa-solid fa-phone"></i>
                            <input type="text" name="phone"
                                value="<%= donor.getPhone() %>" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Age</label>
                        <div class="input-box">
                            <i class="fa-solid fa-calendar"></i>
                            <input type="number" name="age"
                                min="18" max="65"
                                value="<%= donor.getAge() %>" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Gender</label>
                        <div class="input-box">
                            <i class="fa-solid fa-venus-mars"></i>
                            <select name="gender">
                                <option value="Male"
                                    <%= "Male".equalsIgnoreCase(donor.getGender()) ? "selected" : "" %>>
                                    Male
                                </option>

                                <option value="Female"
                                    <%= "Female".equalsIgnoreCase(donor.getGender()) ? "selected" : "" %>>
                                    Female
                                </option>

                                <option value="Other"
                                    <%= "Other".equalsIgnoreCase(donor.getGender()) ? "selected" : "" %>>
                                    Other
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Blood Group</label>
                        <div class="input-box">
                            <i class="fa-solid fa-droplet"></i>
                            <input type="text" name="bloodGroup"
                                value="<%= donor.getBloodGroup() %>" readonly>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>City</label>
                        <div class="input-box">
                            <i class="fa-solid fa-location-dot"></i>
                            <input type="text" name="city"
                                value="<%= donor.getCity() %>" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Address</label>
                        <div class="input-box">
                            <i class="fa-solid fa-map"></i>
                            <input type="text" name="address"
                                value="<%= donor.getAddress() %>" required>
                        </div>
                    </div>

                    <div class="form-group full-edit">
                        <label>Donation Availability</label>

                        <div class="input-box">
                            <i class="fa-solid fa-heart"></i>

                            <select name="available">
                                <option value="yes"
                                    <%= "yes".equalsIgnoreCase(donor.getAvailable()) ? "selected" : "" %>>
                                    Available
                                </option>

                                <option value="no"
                                    <%= "no".equalsIgnoreCase(donor.getAvailable()) ? "selected" : "" %>>
                                    Not Available
                                </option>
                            </select>
                        </div>
                    </div>

                </div>

                <button type="submit" class="dashboard-btn save-btn">
                    <i class="fa-solid fa-floppy-disk"></i>
                    Save Changes
                </button>

            </form>

        </div>

    </section>


    <!-- DONATION HISTORY SECTION -->
    <section id="history" class="dashboard-section">

        <div class="section-title">
            <div>
                <h2><i class="fa-solid fa-clock-rotate-left"></i> Donation History</h2>
                <p>View your previous blood donation records</p>
            </div>
        </div>

        <div class="history-card">

            <div class="empty-history">

                <div class="history-icon">
                    <i class="fa-solid fa-droplet"></i>
                </div>

                <h3>Donation History</h3>

                <p>Your donation records will appear here.</p>

                <span>Thank you for being a lifesaver!</span>

            </div>

        </div>

    </section>

</main>


<footer>
    <p>© 2026 PULSE Blood Donor Management System. All Rights Reserved.</p>
</footer>


<script>

function showSection(sectionId, clickedLink) {

    document.querySelectorAll('.dashboard-section')
        .forEach(section => {
            section.classList.remove('active-section');
        });

    document.querySelectorAll('.dashboard-navbar nav a')
        .forEach(link => {
            link.classList.remove('active');
        });

    document.getElementById(sectionId)
        .classList.add('active-section');

    if (clickedLink) {
        clickedLink.classList.add('active');
    }

}

</script>

</body>
</html>
