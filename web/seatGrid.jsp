    <%-- 
    Document   : seatGrid
    Created on : Oct 29, 2024, 1:54:21 PM
    Author     : Admin
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Seat Selection</title>
    <style>
        .seat-grid {
            display: grid;
            grid-template-columns: repeat(10, 50px);
            gap: 10px;
            margin: 20px auto;
            justify-content: center;
        }
        .seat {
            width: 50px;
            height: 50px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .seat.taken {
            background-color: #d9534f;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <h1 style="text-align:center">Select a Seat</h1>
    <form action="SeatSelectionServlet" method="POST">
        <div class="seat-grid">
            <!-- Generate a 10x10 seating grid -->
            <!-- Each button will submit a seat's position (row, column) -->
            <% for (int row = 1; row <= 10; row++) { %>
                <% for (int col = 1; col <= 10; col++) { %>
                    <button type="submit" class="seat" name="seat" value="<%= row %>,<%= col %>">
                        <%= row %>,<%= col %>
                    </button>
                <% } %>
            <% } %>
        </div>
    </form>
</body>
</html>
 