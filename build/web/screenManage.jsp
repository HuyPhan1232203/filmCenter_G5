<%-- 
    Document   : manageMovies
    Created on : Oct 25, 2024, 10:33:25 AM
    Author     : Admin
--%>

<%@page import="huypn.Screen.ScreenDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Screen</title>
        <style>
           /* Reset cơ bản */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* Căn giữa nội dung chính */
body {
    max-width: 900px;
    margin: 20px auto;
    padding: 20px;
    background-color: #ffffff;
    color: #333;
}

/* Tiêu đề trang */
h1, h2 {
    text-align: center;
    color: #000;
    margin-bottom: 20px;
}

/* Nút "Add Screen" */
#showFormButton {
    display: block;
    width: 150px;
    margin: 10px auto 20px;
    padding: 10px;
    background-color: #333;
    color: #fff;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

#showFormButton:hover {
    background-color: #555;
}

/* Form thêm màn hình */
#Form {
    display: none;
    background-color: #f9f9f9;
    padding: 20px;
    border: 1px solid #333;
    border-radius: 10px;
    margin: 0 auto 20px;
    max-width: 500px;
}

#Form h2 {
    text-align: center;
    color: #333;
}

label {
    display: block;
    font-size: 16px;
    color: #555;
    margin-top: 10px;
}

input[type="text"] {
    width: 100%;
    padding: 8px;
    margin-top: 5px;
    font-size: 14px;
    border: 1px solid #333;
    border-radius: 6px;
    background-color: #ffffff;
    color: #333;
}

input[type="submit"] {
    width: 100%;
    padding: 10px;
    margin-top: 15px;
    background-color: #333;
    color: #fff;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #555;
}

/* Bảng danh sách màn hình */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table th, table td {
    padding: 12px;
    border: 1px solid #333;
    text-align: center;
}

table th {
    background-color: #333;
    color: #fff;
    font-size: 16px;
}

table td {
    background-color: #f9f9f9;
    color: #333;
}

/* Form chỉnh sửa màn hình */
#movie-form {
    background-color: #f9f9f9;
    padding: 20px;
    border: 1px solid #333;
    border-radius: 10px;
    margin-top: 20px;
    max-width: 500px;
    margin: 0 auto;
}

.form-input {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    font-size: 14px;
    border: 1px solid #333;
    border-radius: 6px;
    background-color: #ffffff;
    color: #333;
}

.save-button {
    width: 100%;
    padding: 10px;
    margin-top: 15px;
    background-color: #333;
    color: #fff;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.save-button:hover {
    background-color: #555;
}

        </style>

    </head>
    <body>

        <h1>Manage Screen</h1>
        <button id="showFormButton">Add Screen</button>
        <div id="Form">
            <form action="DispatchServlet">
                <h2>Add Screen</h2>
                <label for="screenNumber">Number:</label>
                <input name="screenNumber" type="text" id="movieTitle" required>

                <label for="totalSeat">Total Seats:</label>
                <input name="totalSeat" type="text" id="movieDirector" required>
                <input name="btAction" type="submit" value="Add Screen"/>
            </form>
        </div>
        <script>
            const button = document.getElementById("showFormButton");
            button.addEventListener('click', function () {
                const form = document.getElementById("Form");
                form.style.display = "block";
            })

        </script>
        <h2>Screen List</h2>
        <c:set var="List" value="${requestScope.SCREEN_LIST}"/>
        <c:if test="${not empty List}">
            <table>
                <tr>
                    <th>Screen ID</th>
                    <th>Screen Number</th>
                    <th>Total Seats</th>
                    <th>Action</th>
                    <th>SEAT</th>
                </tr>
                <c:forEach var="screen" items="${List}">
                    <tr>
                        <td>${screen.screenID}</td>
                        <td>${screen.screenNumber}</td>
                        <td>${screen.totalSeat}</td>
                        <td><form action="ShowDetailForUpdateScreenServlet">
                                <input name="btAction" value="Update" type="submit"/>
                                <input name="screenID" value="${screen.screenID}" hidden/>
                            </form></td>
                            <td><form action="DispatchServlet" method="POST">
                               <input name="btAction" value="Manage Seat" type="submit"/>
                               </form>
                            </td>    
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <c:if test="${param.open == 'true'}">
                <form id="movie-form" action="UpdateScreenServlet">                
                <c:set var="detail" value="${sessionScope.SCREEN_DETAIL}"/>
                <input type="hidden" name="txtScreenID" value="${detail.screenID}">
                <input type="text" class="form-input" name="screenNumber"  value="${detail.screenNumber}"/>
                <input type="text" class="form-input" name="totalSeat"value="${detail.totalSeat}"/>
                <input type="submit" class="save-button" name="btAction" value="Save"></input>
            </form>
        </c:if>

    </body>
</html>
