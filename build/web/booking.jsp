<%-- 
    Document   : filmBooking
    Created on : Nov 1, 2024, 2:45:00 PM
    Author     : hien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Film Booking Page</title>
        <style>
            .container {
                width: 80%;
                margin: 0 auto;
                font-family: Arial, sans-serif;
            }
            .screen {
                text-align: center;
                background-color: #eee;
                padding: 10px;
                margin-bottom: 20px;
            }
            .seat {
                display: inline-block;
                width: 30px;
                height: 30px;
                margin: 5px;
                background-color: #d1d1d1;
                cursor: pointer;
            }
            .seat.selected {
                background-color: #6c757d;
                color: white;
            }
            .seat.occupied {
                background-color: #ff4d4d;
                cursor: not-allowed;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                margin-bottom: 5px;
            }
            select, button {
                padding: 10px;
                width: 100%;
                box-sizing: border-box;
            }
            button {
                background-color: #007bff;
                color: white;
                border: none;
                cursor: pointer;
            }
            button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Book Your Film</h1>
            
            <div class="form-group">
                <label for="showtime">Showtime:</label>
                <select id="showtime" name="showtime">
                    <option value="10:00 AM">10:00 AM</option>
                    <option value="1:00 PM">1:00 PM</option>
                    <option value="4:00 PM">4:00 PM</option>
                    <option value="7:00 PM">7:00 PM</option>
                    <option value="9:00 PM">9:00 PM</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="screen">Screen (Room):</label>
                <select id="screen" name="screen">
                    <option value="Screen 1">Screen 1</option>
                    <option value="Screen 2">Screen 2</option>
                    <option value="Screen 3">Screen 3</option>
                    <option value="Screen 4">Screen 4</option>
                </select>
            </div>

            <div class="screen">Screen (Front)</div>

            <div class="seats">
                <%-- Loop through seats using a for loop --%>
                <% for(int i = 1; i <= 50; i++) { %>
                    <div class="seat" id="seat<%=i%>"><%=i%></div>
                <% } %>
            </div>

            <button type="button" onclick="bookSeats()">Book Now</button>
        </div>

        <script>
            document.querySelectorAll('.seat').forEach(seat => {
                seat.addEventListener('click', function() {
                    if (!this.classList.contains('occupied')) {
                        this.classList.toggle('selected');
                    }
                });
            });

            function bookSeats() {
                let selectedSeats = [];
                document.querySelectorAll('.seat.selected').forEach(seat => {
                    selectedSeats.push(seat.textContent);
                });
                alert('You have booked seats: ' + selectedSeats.join(', '));
            }
        </script>
    </body>
</html>
