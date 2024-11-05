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
       

* {
    margin:0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* Căn giữa và tạo kiểu cho container chính */
.container {
    max-width: 650px;
    margin: 500px auto;
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

/* Khu vực màn hình */
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
    gap: 10px;
    justify-content: center;
}

/* Các ô chỗ ngồi */
.seat {
    width: 50px;
    height: 50px;
    background-color: #e0e0e0;
    color: #333;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 1px solid #333;
    border-radius: 10px;
    cursor: pointer;
    font-size: 18px;        /*chữ form nè*/
    transition: background-color 0.2s;
       display: inline-block;
                width: 50px;
                height: 50px;
                margin: 2px;
                padding: 10px;
                background-color: #d1d1d1;
                cursor: pointer;

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

/* Nút chọn màn hình */
input[type="submit"] {
    padding: 10px 20px;
    font-size: 18px;
    background-color: #333;
    color: #fff;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-top: 10px;
}

input[type="submit"]:hover {
    background-color: #555;
}

/* Nút đặt chỗ */
button {
    padding: 12px 25px;
    font-size: 20px;
    background-color: #333;
    color: #fff;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-top: 20px;
}

button:hover {
    background-color: #555;
}

        </style>
    </head>
    <body>
        <form action="DispatchServlet">
            
        <div class="container">
            <h1>Book Your Film</h1>

            <div class="form-group">
                <label for="showtime">Showtime:</label>
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
                <input name="txtMovieID" value="${sessionScope.MOVIE_DETAIL.movieID}" hidden/>
                <br>
                <input type="submit" class="button" name="btAction" value="Book Now"/>
        </c:if>
    </div>
        </form>

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
