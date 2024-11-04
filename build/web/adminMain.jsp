<%-- 
    Document   : adminMain
    Created on : Oct 25, 2024, 10:20:00 AM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cinema Admin Dashboard</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            header {
                background-color: #333;
                color: white;
                padding: 10px 20px;
                text-align: center;
            }
            .container {
                margin: 20px;
            }
            .card {
                background-color: white;
                padding: 20px;
                margin-bottom: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }
            .card h2 {
                margin-top: 0;
            }
            .card p {
                font-size: 16px;
                color: #555;
            }
            .dashboard-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                gap: 20px;
            }
            footer {
                background-color: #333;
                color: white;
                text-align: center;
                padding: 10px 0;
                position: fixed;
                bottom: 0;
                width: 100%;
            }
            .navbar {
                padding: 10px;
                background-color: #222;
                text-align: center;
            }
            .navbar a {
                color: white;
                text-decoration: none;
                margin: 0 15px;
                font-size: 18px;
            }
            .navbar a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <!-- Header Section -->
        <header>
            <h1>Welcome to the Cinema Admin Dashboard</h1>
        </header>

        <!-- Navigation Bar -->
        <div class="navbar">
            <a href="manageMovies.jsp">Manage Movies</a>
            <a href="viewBookings.jsp">View Bookings</a>
            <a href="cinemaStats.jsp">Cinema Stats</a>
            <a href="logout.jsp">Logout</a>
        </div>

        <!-- Main Content Section -->
        <div class="container">
            <!-- Dashboard Cards -->
            <div class="dashboard-grid">
                <!-- Manage Movies -->
                <form action="DispatchServlet" method="POST">
                    <div class="card">
                        <h2>Manage Movies</h2>
                        <p>View and manage the list of current movies. Add, edit or remove movies that are showing in the cinema.</p>
                        <input type="submit" name="btAction" value="Go to Manage Movie"></input>
                    </div>

                    <!-- View Bookings -->
                    <div class="card">
                        <h2>Manage Screen</h2>
                        <p>Check the current bookings made by users. See the status and details of bookings.</p>
                        <input type="submit" name="btAction" value="Go to Manage Screen"></input>

                    </div>

                    <!-- Cinema Statistics -->
                    <div class="card">
                        <h2>Cinema Statistics</h2>
                        <p>View statistics such as total revenue, total bookings, and the most popular movies.</p>
                        <a href="cinemaStats.jsp">View Statistics</a>
                    </div>

                    <!-- Admin Info -->
                    <div class="card">
                        <h2>Admin Information</h2>
                        <p>Check your admin details or change your account settings.</p>
                        <a href="adminInfo.jsp">Go to Admin Information</a>
                    </div>
                </form>
            </div>
        </div>

        <!-- Footer Section -->
        <footer>
            <p>&copy; 2024 Cinema Admin Panel. All Rights Reserved.</p>
        </footer>
    </body>
</html>

