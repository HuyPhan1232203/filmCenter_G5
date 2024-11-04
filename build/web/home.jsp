<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Movie Center - Home</title>
        <style>
           /* General styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
    color: #333;
    line-height: 1.6;
}

header {
    background-color: #333;
    color: white;
    padding: 20px;
    text-align: center;
}

header h1 {
    margin: 0;
}

header div {
    margin-top: 5px;
}

header p {
    font-size: 16px;
    margin-top: 10px;
}

header form {
    margin-top: 10px;
}

input[type="submit"] {
    background-color: #f04e30;
    color: white;
    border: none;
    padding: 10px 15px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #c03e27;
}

/* Navigation bar */
nav {
    background-color: #444;
    padding: 10px 0;
    text-align: center;
}

nav a {
    color: white;
    text-decoration: none;
    padding: 10px 20px;
    font-size: 16px;
    transition: background-color 0.3s;
}

nav a:hover {
    background-color: #555;
}

/* Container and sections */
.container {
    max-width: 1200px;
    margin: 20px auto;
    padding: 0 15px;
}

.featured {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
}

/* Movie card styles */
.movie-card {
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 10px;
    overflow: hidden;
    text-align: center;
    width: 220px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s;
}

.movie-card:hover {
    transform: translateY(-10px);
}

.movie-card img {
    border-bottom: 1px solid #ddd;
    width: 100%;
    height: auto;
}

.movie-card h3 {
    font-size: 18px;
    margin: 10px 0;
    color: #444;
}

.movie-card p {
    font-size: 14px;
    color: #666;
    margin: 5px 0;
}

.movie-card input[type="submit"] {
    background-color: #007BFF;
    color: white;
    border: none;
    padding: 10px 15px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.movie-card input[type="submit"]:hover {
    background-color: #0056b3;
}


        </style>
    </head>
    <body>
        <header>
            <h1>Welcome to Movie Center</h1>
            <div>Welcome, ${sessionScope.USERNAME}</div>
            <p>Your ultimate source for movies!</p>
            <form action="DispatchServlet" method="POST">
                <input type="submit" value="Logout"/>
            </form>
        </header>

        <nav>
            <a href="home.jsp">Home</a>
            <a href="movie.jsp">Movies</a>
            <a href="categories.jsp">Categories</a>
            <a href="contact.jsp">Contact</a>
        </nav>
        <div class="container">
            <section class="featured">
                <c:set var="movieList" value="${requestScope.movieList}"/>
                <c:if test="${not empty movieList}">
                    <c:forEach var="film" items="${movieList}">
                        <form class="movie-card" action="DispatchServlet" method="POST">
                            <div>
                                <input name="txtMovieID" value=${film.movieID} hidden>
                                <img src="${film.movieImage}" 
                                     width="200px" height="200px"  alt="Movie 1">
                                <h3>${film.movieName}</h3>
                                <p>Genre: ${film.movieGenre}</p>
                                <br>
                                <input type="submit" name="btAction" value="Play"/>
                            </div>
                        </form>
                    </c:forEach>
                </c:if>
            </section>
        </div>
    </body>
</html>
