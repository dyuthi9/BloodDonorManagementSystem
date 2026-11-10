
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.model.Donor" %>

<%
    if (!"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    Donor donor = (Donor) request.getAttribute("donor");

    if (donor == null) {
        response.sendRedirect("SearchDonorAdminServlet");
        return;
    }

    String available = donor.getAvailable();
%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>PULSE | Edit Donor</title>

    <link rel="stylesheet" href="admin.css">

    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>

<body class="auth-body">

    <!-- NAVBAR -->
    <header class="auth-navbar">

        <a href="admin-home.jsp" class="logo">
            <span class="logo-icon">
                <i class="fas fa-heartbeat"></i>
            </span>
            PULSE<span class="dot">.</span>
        </a>

        <a href="SearchDonorAdminServlet" class="back-home">
            <i class="fas fa-arrow-left"></i> Back to Donors
        </a>

    </header>


    <!-- EDIT DONOR FORM -->
    <main class="auth-container">

        <div class="auth-card">

            <div class="auth-icon">
                <i class="fas fa-user-edit"></i>
            </div>

            <h2>Edit Donor Details</h2>

            <p class="auth-subtitle">
                Update the registered donor information
            </p>

            <% if (request.getAttribute("error") != null) { %>
                <p class="auth-message">
                    <%= request.getAttribute("error") %>
                </p>
            <% } %>

            <form action="UpdateDonorServlet" method="post">

                <input type="hidden" name="donor_id"
                       value="<%= donor.getDonorId() %>">


                <!-- NAME -->
                <div class="form-group">
                    <label>Full Name</label>

                    <input type="text" name="name"
                        value="<%= donor.getName() %>"
                        required>
                </div>


                <!-- EMAIL -->
                <div class="form-group">
                    <label>Email Address</label>

                    <input type="email" name="email"
                        value="<%= donor.getEmail() %>"
                        required>
                </div>


                <!-- PHONE -->
                <div class="form-group">
                    <label>Phone Number</label>

                    <input type="tel" name="phone"
                        value="<%= donor.getPhone() %>"
                        required>
                </div>


                <!-- AGE -->
                <div class="form-group">
                    <label>Age</label>

                    <input type="number" name="age"
                        value="<%= donor.getAge() %>"
                        min="18" max="65" required>
                </div>


                <!-- GENDER -->
                <div class="form-group">
                    <label>Gender</label>

                    <select name="gender" required>

                        <option value="male"
                            <%= "male".equalsIgnoreCase(donor.getGender()) ? "selected" : "" %>>
                            Male
                        </option>

                        <option value="female"
                            <%= "female".equalsIgnoreCase(donor.getGender()) ? "selected" : "" %>>
                            Female
                        </option>

                        <option value="other"
                            <%= "other".equalsIgnoreCase(donor.getGender()) ? "selected" : "" %>>
                            Other
                        </option>

                    </select>
                </div>


                <!-- BLOOD GROUP -->
                <div class="form-group">
                    <label>Blood Group</label>

                    <select name="bloodGroup" required>

                        <option value="A+"
                            <%= "A+".equals(donor.getBloodGroup()) ? "selected" : "" %>>A+</option>

                        <option value="A-"
                            <%= "A-".equals(donor.getBloodGroup()) ? "selected" : "" %>>A-</option>

                        <option value="B+"
                            <%= "B+".equals(donor.getBloodGroup()) ? "selected" : "" %>>B+</option>

                        <option value="B-"
                            <%= "B-".equals(donor.getBloodGroup()) ? "selected" : "" %>>B-</option>

                        <option value="AB+"
                            <%= "AB+".equals(donor.getBloodGroup()) ? "selected" : "" %>>AB+</option>

                        <option value="AB-"
                            <%= "AB-".equals(donor.getBloodGroup()) ? "selected" : "" %>>AB-</option>

                        <option value="O+"
                            <%= "O+".equals(donor.getBloodGroup()) ? "selected" : "" %>>O+</option>

                        <option value="O-"
                            <%= "O-".equals(donor.getBloodGroup()) ? "selected" : "" %>>O-</option>

                    </select>
                </div>


                <!-- CITY -->
                <div class="form-group">
                    <label>City</label>

                    <input type="text" name="city"
                        value="<%= donor.getCity() %>"
                        required>
                </div>


                <!-- ADDRESS -->
                <div class="form-group">
                    <label>Address</label>

                    <textarea name="address" rows="3"
                        required><%= donor.getAddress() %></textarea>
                </div>


                <!-- AVAILABILITY -->
                <div class="form-group">
                    <label>Donation Availability</label>

                    <select name="available" required>

                        <option value="yes"
                            <%= "yes".equalsIgnoreCase(available) ? "selected" : "" %>>
                            Available
                        </option>

                        <option value="no"
                            <%= "no".equalsIgnoreCase(available) ? "selected" : "" %>>
                            Unavailable
                        </option>

                    </select>
                </div>


                <!-- BUTTONS -->
                <button type="submit" class="auth-button">
                    <i class="fas fa-save"></i> Update Donor
                </button>

                <a href="SearchDonorAdminServlet"
                   class="cancel-edit">
                    Cancel
                </a>

            </form>

        </div>

    </main>

</body>
</html>
