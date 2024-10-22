<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Movie Center - Home</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            header {
                background-color: #333;
                color: white;
                padding: 15px;
                text-align: center;
                display: fixed;
            }
            nav {
                display: flex;
                justify-content: center;
                background-color: #444;
                padding: 10px;
            }
            nav a {
                color: white;
                margin: 0 15px;
                text-decoration: none;
            }
            .container {
                margin: 20px;
            }
            .featured {
                display: flex;
                justify-content: space-around;
                margin-bottom: 20px;
            }
            .movie-card {
                background-color: white;
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 15px;
                width: 30%;
                text-align: center;
            }
            .movie-card img {
                max-width: 100%;
                border-radius: 5px;
            }
            footer {
                background-color: #333;
                color: white;
                text-align: center;
                padding: 20px;
                /*position: absolute;*/
                bottom: 0;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>Welcome to Movie Center</h1>
            <p>Your ultimate source for movies!</p>
        </header>
        
        <nav>
            <a href="home.jsp">Home</a>
            <a href="movie.jsp">Movies</a>
            <a href="categories.jsp">Categories</a>
            <a href="contact.jsp">Contact</a>
        </nav>

        <div class="container">
            <section class="featured">
                <div class="movie-card">
                    <img src="images/film1.jpg.jpeg" 
                         width="200px" height="200px"  alt="Movie 1">
                    <h3>Movie Title 1</h3>
                    <p>Genre: Action</p>
                </div>
                <div class="movie-card">
                    <img src="images/film1.jpg.jpeg" 
                         width="200px" height="200px"  alt="Movie 2">
                    <h3>Movie Title 2</h3>
                    <p>Genre: Drama</p>
                </div>
                <div class="movie-card">
                    <img src="images/film1.jpg.jpeg" 
                         width="200px" height="200px"  alt="Movie 3">
                    <h3>Movie Title 3</h3>
                    <p>Genre: Comedy</p>
                </div>
            </section>
<!--
            <section>
                <h2>Popular Categories</h2>
                <ul>
                    <li><a href="category.jsp?genre=action">Action</a></li>
                    <li><a href="category.jsp?genre=drama">Drama</a></li>
                    <li><a href="category.jsp?genre=comedy">Comedy</a></li>
                    <li><a href="category.jsp?genre=thriller">Thriller</a></li>
                </ul>
            </section>-->
        </div>

        <footer>
            <p>&copy; 2024 Movie Center. All rights reserved.</p>
        </footer>
    </body>
</html>
