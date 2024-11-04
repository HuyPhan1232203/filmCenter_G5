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
            /* Reset một số thuộc tính mặc định */
       *    {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            /* Căn giữa và tạo kiểu cho container chính */
            .container {
                max-width: 900px;
                margin: 50px auto;
                padding: 30px;
                background-color: #ffffff;
                border: 1px solid #333;
                border-radius: 10px;
                text-align: center;
                color: #333;
            }

            /* Tiêu đề chính */
            .container h1 {
                font-size: 32px;
                margin-bottom: 30px;
                color: #000;
            }

            /* Kiểu cho các nhóm form */
            .form-group {
                margin-bottom: 20px;
                text-align: left;
            }

/* Các nhãn và select trong form */
            .form-group label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
                font-size: 18px;
                color: #555;
            }

            .form-group select {
                width: 100%;
                padding: 12px;
                font-size: 18px;
                border: 1px solid #333;
                border-radius: 6px;
                background-color: #f9f9f9;
                color: #333;
            }

            /* Vị trí của khu vực màn hình */
            .screen {
                    background-color: #333;
                    color: #fff;
                    padding: 15px;
                    font-size: 20px;
                    margin: 30px 0;
                    border-radius: 6px;
            }

            /* Khu vực chỗ ngồi */
            .seats {
                display: flex;
                flex-wrap: wrap;
                gap: 15px;
                justify-content: center;
            }

            /* Các ô chỗ ngồi */
            .seat {
            width: 40px;
            height: 40px;
            background-color: #e0e0e0;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #333;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.2s;
                    }

            /* Chỗ ngồi được chọn */
            .seat.selected {
                background-color: #333;
                color: #fff;
            }

            /* Chỗ ngồi đã đặt */
            .seat.occupied {
                background-color: #777;
                color: #fff;
                cursor: not-allowed;
            }

            /* Nút đặt chỗ */
            button {
                padding: 12px 25px  ;
                font-size: 20px;
                background-color: #333;
                color: #fff;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            button:hover {
               background-color: #555;
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
            <br>
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
