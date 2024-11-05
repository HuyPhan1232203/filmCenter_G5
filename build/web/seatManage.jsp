<%@page import="hauln.Seat.SeatDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seat Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            color: #333;
        }
        .container {
            width: 60%;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        button {
            padding: 10px 15px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #555;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #333;
            color: #fff;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Manage Seats</h1>
    <button id="showFormButton">Add Seat</button>
    <!-- Form to Add or Update Seat -->
    <div id="seatForm" style="display: none; margin-top: 20px;">
        <div class="form-group">
        <form action="DispatchServlet">
        <h2 id="formTitle">Add Seat</h2>
        
            <label for="screenID">Screen ID</label>
            <input type="text" name="screenID" id="screenID" placeholder="Enter seat number" required>    
          
            <label for="seatNumber">Seat Number</label>
            <input type="text" name="seatNumber" id="seatNumber" placeholder="Enter seat number" required>
             
            <label for="isAvailable">Status</label>
            <input type="text" name="isAvailable" id="isAvailable" placeholder="Enter status (e.g., available, booked)" required>
             
            <label for="seatType">Seat Type</label>
            <input type="text"  name="seatType"  id="seatType" placeholder="Enter Standard or VIP" required>            
        
            <label for="price">Price</label>
            <input type="number"  name="price"  id="price" placeholder="Enter New Price" required>
   
            <button onclick="saveSeat()">Save</button>
            <button onclick="hideForm()">Cancel</button>
        </form>
            </div>
       
        </div>
    
  <script>
            const button = document.getElementById("showFormButton");
            button.addEventListener('click', function () {
                const form = document.getElementById("seatForm");
                form.style.display = "block";
            })

        </script>
 
    <h2>Seat List</h2>
    <c:set var="List" value="${requestScope.seatList}"/>
    <c:if test="${not empty List}">
        <table>  
            <tr>
                <td>Seat ID</td>
                <td>Screen ID</td>
                <td>Seat Number</td>
                <td>Status</td>
                <td>Seat Type</td>
                <td>Price</td>
            </tr>      
        <c:forEach var="seat" items="${List}">        
                <tr>
                    <td>${seat.seatID}</td>
                    <td>${seat.screenID}</td>                                  
                    <td>${seat.seatNumber}</td>
                    <td>${seat.seatType}</td>
                    <td>${seat.isAvailable}</td>
                    <td>${seat.price}</td>
                </tr>
              
        </c:forEach>
    </table>
    </c:if>

 </body>
</html>
