
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.model.Donor" %>

<%
    // Allow only logged-in admins
    if (!"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    List<Donor> donors =
        (List<Donor>) request.getAttribute("donors");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>PULSE | Search Donors</title>

    <link rel="stylesheet" href="admin.css">

    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body class="admin-body">

    <!-- ADMIN NAVBAR -->
    <header class="admin-navbar">

        <a href="admin-home.jsp" class="logo">
            <span class="logo-icon">
                <i class="fas fa-heartbeat"></i>
            </span>
            PULSE<span class="dot">.</span>
        </a>

        <nav>
            <a href="AdminDashboardServlet" >
                <i class="fas fa-home"></i> Dashboard
            </a>

            <a href="SearchDonorAdminServlet" class="active">
                <i class="fas fa-users"></i> Donors
            </a>

        <!--      <a href="blood-request.jsp">
                <i class="fas fa-droplet"></i> Requests
            </a>-->
        </nav>

        <a href="LogoutServlet?role=admin" class="admin-logout">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>

    </header>


    <!-- SEARCH SECTION -->
    <main class="donor-search">

        <div class="search-heading">
            <span class="admin-tag">
                <i class="fas fa-shield-heart"></i> ADMIN PANEL
            </span>

            <h1>Search <span>Donors</span></h1>

            <p>Find registered blood donors using blood group and city.</p>
        </div>


        <!-- SEARCH FORM -->
        <section class="search-box">

            <form action="SearchDonorAdminServlet" method="get">

                <div class="search-field">
                    <label for="bloodGroup">Blood Group</label>

                    <select name="bloodGroup" id="bloodGroup">
                        <option value="">All Blood Groups</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                    </select>
                </div>

                <div class="search-field">
                    <label for="city">City</label>

                    <input type="text"
                        name="city"
                        id="city"
                        placeholder="Enter city name">
                </div>

                <button type="submit" class="search-button">
                    <i class="fas fa-search"></i> Search Donors
                </button>

            </form>

        </section>


        <!-- DONOR RESULTS -->
        <section class="donor-results">

            <div class="results-heading">
                <div>
                    <h2>Donor Details</h2>
                    <p>Registered donors in PULSE</p>
                </div>

                <span class="results-count">
                    <%= donors == null ? 0 : donors.size() %> Donors
                </span>
            </div>


            <div class="donor-list">

                <% if (donors != null && !donors.isEmpty()) { %>

                    <% for (Donor donor : donors) { %>

                        <div class="donor-card">

                            <div class="donor-blood">
                                <%= donor.getBloodGroup() %>
                            </div>

                            <div class="donor-details">

                                <h3><%= donor.getName() %></h3>

                                <p>
                                    <i class="fas fa-phone"></i>
                                    <%= donor.getPhone() %>
                                </p>

                                <p>
                                    <i class="fas fa-envelope"></i>
                                    <%= donor.getEmail() %>
                                </p>

                                <p>
                                    <i class="fas fa-location-dot"></i>
                                    <%= donor.getCity() %>
                                </p>

                                <span class="available-status">
                                    <%= donor.getAvailable() %>
                                </span>

                            </div>
							<div class="donor-actions">
							
							    <!-- EDIT BUTTON -->
							    <a href="EditDonorServlet?donor_id=<%= donor.getDonorId() %>"
							       class="edit-btn">
							        <i class="fas fa-edit"></i> Edit
							    </a>
							
							    <!-- DELETE BUTTON -->
							    <form action="DeleteDonorServlet" method="post"
							          onsubmit="return confirm('Are you sure you want to delete this donor?');">
							
							        <input type="hidden" name="donor_id"
							               value="<%= donor.getDonorId() %>">
							
							        <button type="submit" class="delete-btn">
							            <i class="fas fa-trash"></i> Delete
							        </button>
							
							    </form>
							
							</div>
                        </div>

                    <% } %>

                <% } else { %>

                    <div class="no-donors">
                        <i class="fas fa-users"></i>
                        <h3>No Donors Found</h3>
                        <p>Try searching with another blood group or city.</p>
                    </div>

                <% } %>

            </div>

        </section>

    </main>

</body>
</html>