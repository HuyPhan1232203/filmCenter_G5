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
            /* Reset một số thuộc tính mặc định */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            /* Căn giữa và tạo kiểu cho container chính */
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

            /* Nút "Add Movie" */
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

            /* Form thêm phim */
            #Form {
                display: none; /* Ẩn form ban đầu */
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

            input[type="text"],
            input[type="number"],
            textarea {
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

            /* Bảng danh sách phim */
            #movieTable {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            #movieTable th, #movieTable td {
                padding: 12px;
                border: 1px solid #333;
                text-align: center;
            }

            #movieTable th {
                background-color: #333;
                color: #fff;
                font-size: 16px;
            }

            #movieTable td {
                background-color: #f9f9f9;
                color: #333;
            }

            /* Hình ảnh Poster */
            #movieTable img {
                width: 50px;
                height: 50px;
                border-radius: 5px;
            }

            /* Nút Delete và Update */
            .delete {
                background-color: #333;
                color: #fff;
                border: none;
                padding: 5px 10px;
                border-radius: 6px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .delete:hover {
                background-color: #555;
            }

            /* Form chỉnh sửa phim */
            #movie-form {
                background-color: #f9f9f9;
                padding: 20px;
                border: 1px solid #333;
                border-radius: 10px;
                margin-top: 20px;
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

        <h1>Manage Movies</h1>
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
                    <th>Action</th>
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
        

    </body>
</html>
