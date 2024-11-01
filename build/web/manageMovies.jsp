<%-- 
    Document   : manageMovies
    Created on : Oct 25, 2024, 10:33:25 AM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
        </style>
    </head>
    <body>

        <h1>Manage Movies</h1>

        <!-- Form to Add Movie -->
        <form id="addMovieForm" action="DispatchServlet">
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
        <!-- Movie List -->
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
                        <form action="DispatchServlet" method="POST" style="display:inline;">
                            <input type="hidden" name="movieID" value="<%= moviedto.getMovieID()%>">
                            <input type="hidden" name="btAction" value="Delete">
                            <button type="submit" class="delete">Delete</button>
                        </form>
                    </td>

                    
                    
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




    </body>
</html>>
