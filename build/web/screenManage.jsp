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
            body {
                font-family: Arial, sans-serif;
                max-width: 800px;
                margin: 0 auto;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            table, th, td {
                border: 1px solid #ddd;
                padding: 8px;
            }
            th {
                background-color: #f2f2f2;
                text-align: center;
            }
            td {
                text-align: center;
            }
            form {
                display: flex;
                flex-direction: column;
                gap: 10px;
                margin: 20px 0;
            }
            label {
                font-weight: bold;
            }
            input[type="text"], input[type="number"], textarea {
                padding: 8px;
                width: 100%;
            }
            button {
                padding: 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
            }
            button.delete {
                background-color: #d9534f;
            }
            button.update {
                background-color: #5bc0de;
            }
            button:hover {
                opacity: 0.9;
            }
            #Form{
                display: none
            }
            /* Styles for the movie form */
            #movie-form {
                width: 300px; /* Set a width for the form */
                margin: 20px auto; /* Center the form horizontally */
                padding: 20px; /* Add padding inside the form */
                border: 1px solid #ccc; /* Light gray border */
                border-radius: 8px; /* Rounded corners */
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
                background-color: #f9f9f9; /* Light background color */
            }

            /* Styles for the input fields */
            .form-input {
                width: 100%; /* Make the input fields full width */
                padding: 10px; /* Add padding inside the fields */
                margin: 10px 0; /* Space between fields */
                border: 1px solid #ddd; /* Light border for input fields */
                border-radius: 4px; /* Slightly rounded corners */
                box-sizing: border-box; /* Include padding and border in width */
                transition: border-color 0.3s, box-shadow 0.3s; /* Smooth transition for focus */
            }

            /* Input fields on focus */
            .form-input:focus {
                border-color: #007bff; /* Change border color on focus */
                outline: none; /* Remove default outline */
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Subtle shadow on focus */
            }

            /* Optional: Add some hover effect */
            .form-input:hover {
                border-color: #007bff; /* Change border color on hover */
            }

            /* Responsive design */
            @media (max-width: 480px) {
                .movie-form {
                    width: 90%; /* Full width on smaller screens */
                }
            }

            .save-button {
                width: 100%; /* Full width for the button */
                padding: 10px; /* Padding inside the button */
                margin-top: 10px; /* Space above the button */
                border: none; /* Remove default border */
                border-radius: 4px; /* Slightly rounded corners */
                background-color: #007bff; /* Bootstrap primary color */
                color: white; /* White text color */
                font-size: 16px; /* Increase font size */
                cursor: pointer; /* Change cursor to pointer on hover */
                transition: background-color 0.3s, box-shadow 0.3s; /* Smooth transition for hover effects */
            }

            /* Button hover effect */
            .save-button:hover {
                background-color: #0056b3; /* Darker shade on hover */
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow on hover */
            }

            /* Button focus effect */
            .save-button:focus {
                outline: none; /* Remove default outline */
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Subtle shadow on focus */
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
