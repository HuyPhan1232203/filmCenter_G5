<%-- 
    Document   : filmBooking
    Created on : Nov 1, 2024, 2:45:00 PM
    Author     : hien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Film Booking Page</title>
        <style>
            .container {
                width: 30%;
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
            select, .button {
                padding: 10px;
                width: 100%;
                box-sizing: border-box;
            }
            .button {
                background-color: #007bff;
                color: white;
                border: none;
                cursor: pointer;
            }
            .button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Book Your Film</h1>

            <div class="form-group">
                <label for="showtime">Showtime:</label>
                <form action="DispatchServlet">
                    <c:set var="List" value="${requestScope.LIST_SHOWTIME}"/>
                    <c:if test="${not empty List}">
                        <select id="showtime" name="showtime">
                            <c:forEach var="time" items="${List}">
                                <option value="${time.dateTime}">${time.dateTime}</option>
                            </c:forEach>
                        </select>
                    </c:if>

            </div>
            <c:set var="ScreenList" value="${requestScope.SCREEN_LIST}"/>
            <div class="form-group">
                <label for="screen">Screen (Room):</label>
                <select id="screen" name="screen">
                    <c:forEach var="screen" items="${ScreenList}">
                        <option value="${screen.screenNumber}">Screen ${screen.screenNumber}</option>
                    </c:forEach>
                </select>
                <input name="txtMovieID" value="${sessionScope.MOVIE_DETAIL.movieID}" hidden/>
                <input type="submit" name="btAction" value="Choose"/>
            </div>
            <c:set var="List" value="${requestScope.LIST_SEAT}"/>
            <c:if test="${not empty List}">
                <div class="screen">Screen (Front)</div>


                <c:forEach var="seat" items="${List}">
                    <div class="seat" id="seat${seat.seatNumber}">${seat.seatNumber}</div>
                </c:forEach>

                <input name="txtUserID" value="${sessionScope.USER.userID}" hidden/>
                <input type="submit" class="button" name="btAction" value="Book Now"/>
            </form>
        </c:if>
    </div>

    <script>
        document.querySelectorAll('.seat').forEach(seat => {
            seat.addEventListener('click', function () {
                if (!this.classList.contains('occupied')) {
                    this.classList.toggle('selected');
                }
            });
        });

    </script>
</body>
</html>
