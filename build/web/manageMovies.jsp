<%-- 
    Document   : manageMovies
    Created on : Oct 25, 2024, 10:33:25 AM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="bachnph.Movie.MovieDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Movies</title>
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

        <h1>Manage Movies</h1>
        <button id="showFormButton">Add Movie</button>
        <div id="Form">
            <form action="DispatchServlet">
                <h2>Add Movie</h2>
                <label for="movieTitle">Title:</label>
                <input name="movieTitle" type="text" id="movieTitle" required>

                <label for="movieName">Name:</label>
                <input name="movieName" type="text" id="movieDirector" required>

                <label for="movieGenre">Genre:</label>
                <input name="movieGenre" type="text" id="movieGenre" required>

                <label for="movieDuration">Duration (mins):</label>
                <input name="movieDuration" type="number" id="movieDuration" min="0" required>

                <label for="movieDescription">Description:</label>
                <textarea name="movieSynopsis" id="movieDescription" rows="3"></textarea>

                <lable for="movieImage">Poster:</label>
                    <input name="movieImage" type="String" id="moviePoster" required>
                    <input name="btAction" type="submit" value="Add Movie"/>
            </form>
        </div>
        <script>
            const button = document.getElementById("showFormButton");
            button.addEventListener('click', function () {
                const form = document.getElementById("Form");
                form.style.display = "block";
            })
   
        </script>
        <h2>Movie List</h2>
        <table id="movieTable">
            <thead>                       
                <tr>
                    <th>Title</th>
                    <th>Name</th>
                    <th>Genre</th>
                    <th>Duration</th>
                    <th>Description</th>
                    <th>Poster</th>
                </tr>            
            </thead>
            <tbody>
                <%
                    ArrayList<MovieDTO> movieList = (ArrayList<MovieDTO>) request.getAttribute("movieList");
                    if (movieList != null) {
                        for (MovieDTO moviedto : movieList) {
                %>
                <tr>
                    <td><%= moviedto.getMovieTitle()%></td>
                    <td><%= moviedto.getMovieName()%></td>
                    <td><%= moviedto.getMovieGenre()%></td>
                    <td><%= moviedto.getMovieDuration()%></td>
                    <td><%= moviedto.getMovieSynopsis()%></td>
                    <td><img src="<%= moviedto.getMovieImage()%>" alt="Poster" style="width:50px;height:50px;"></td>


                    <%-- Delete button with from --%>
                    <td>
                        <form action="DispatchServlet" style="display:inline;">
                            <input type="hidden" name="txtMovieID" value="<%= moviedto.getMovieID()%>">
                            <input type="submit" class="delete" name="btAction" value="Delete" />
                            <input type="submit" class="delete" id="Update" name="btAction" value="Update" />
                        </form>
                    </td>
                    <%-- Update button with from --%>


                </tr>
                <%
                    } // End for loop
                } else {
                %>
                <tr>
                    <td colspan="6">No movies available</td>
                </tr>
                <% }%>
            </tbody>
        </table>
                <c:if test="${param.open == 'true'}">>
                    <form id="movie-form" action="DispatchServlet">                
            <c:set var="detail" value="${sessionScope.MOVIE_DETAIL}"/>
            <input type="hidden" name="txtMovieID" value="${detail.movieID}">
            <input type="text" class="form-input" name="txtTitle"  value="${detail.movieTitle}"/>
            <input type="text" class="form-input" name="txtName"value="${detail.movieName}"/>
            <input type="text" class="form-input" name="txtGenre"value="${detail.movieGenre}"/>
            <input type="text" class="form-input" name="txtDuration"value="${detail.movieDuration}"/>
            <input type="text" class="form-input" name="txtSynopsis"value="${detail.movieSynopsis}"/>
            <input type="submit" class="save-button" name="btAction" value="Save"></input>
        </form>
                </c:if>
        
    </body>
</html>
