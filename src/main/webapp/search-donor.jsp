<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.List,com.model.Donor" %>
<%

    List<Donor> donors =
        (List<Donor>) request.getAttribute("donors");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Search Donors | PULSE</title>

<link rel="stylesheet" href="style.css?v=2">
    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>

    <!-- Navbar -->
    <header class="navbar">

        <a href="index.jsp" class="logo">
            <i class="fa-solid fa-heart-pulse logo-icon"></i>
            PULSE<span class="dot">.</span>
        </a>

        <nav class="nav-links">
            <a href="index.jsp">Home</a>
            <a href="SearchDonorServlet" class="active">Search Donors</a>
            <a href="admin-login.jsp">Admin</a>
        </nav>

        <a href="login.jsp" class="profile-icon">
            <i class="fa-solid fa-user"></i>
        </a>

    </header>

<!-- SEARCH SECTION -->
    <main class="donor-search">

        <div class="search-heading">
            <h1>Search <span>Donors</span></h1>

            <p>Find registered blood donors using blood group and city.</p>
        </div>


        <!-- SEARCH FORM -->
        <section class="search-box">

            <form action="SearchDonorServlet" method="get">

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
                                    <i class="fas fa-location-dot"></i>
                                    <%= donor.getCity() %>
                                </p>

                                <span class="available-status">
                                    <%= donor.getAvailable() %>
                                </span>

                            </div>							
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


    <!-- Footer -->
    <footer>
        <p>© 2026 PULSE. Every Drop Counts. Every Donor Matters.</p>
    </footer>

</body>
</html>
