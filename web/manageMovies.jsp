<%-- 
    Document   : manageMovies
    Created on : Oct 25, 2024, 10:33:25 AM
    Author     : Admin
--%>

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
    <form id="addMovieForm" onsubmit="addMovie(event)">
        <h2>Add Movie</h2>
        <label for="movieTitle">Title:</label>
        <input type="text" id="movieTitle" required>

        <label for="movieDirector">Director:</label>
        <input type="text" id="movieDirector" required>

        <label for="movieGenre">Genre:</label>
        <input type="text" id="movieGenre" required>

        <label for="movieDuration">Duration (mins):</label>
        <input type="number" id="movieDuration" min="0" required>

        <label for="movieDescription">Description:</label>
        <textarea id="movieDescription" rows="3"></textarea>
        
        <lable for="moviePoster">Poster:</label>
        <input type="String" id="moviePoster" required>
        

        <button type="submit">Add Movie</button>
    </form>

    <!-- Movie List -->
    <h2>Movie List</h2>
    <table id="movieTable">
        <thead>
            <tr>
                <th>Title</th>
                <th>Director</th>
                <th>Genre</th>
                <th>Duration</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <!-- Dynamic Movie Rows -->
        </tbody>
    </table>
</body>
</html>>
