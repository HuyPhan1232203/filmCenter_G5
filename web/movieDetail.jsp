<%-- 
    Document   : movieDetail
    Created on : Nov 1, 2024, 11:29:09 AM
    Author     : hien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .detail{
                padding: 50px;
            }
            .synopsis{
                background-color: #ccc;
                padding: 20px;
               
            }
            body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
    color: #333;
}

.detail {
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    align-items: center;
    display: flex;
    flex-direction: column;
    width: 100%;
}

.detail img {
    width:300px;
    border-radius: 8px;
    margin-bottom: 20px;
}

h1 {
    font-size: 2em;
    margin-bottom: 10px;
    color: #2c3e50;
}

.detail div {
    margin-bottom: 8px;
    font-size: 1em;
    line-height: 1.6;
}

.synopsis {
    background-color: #ececec;
    padding: 15px;
    border-left: 4px solid #3498db;
    border-radius: 4px;
    font-style: italic;
}
body, html {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    margin: 0;
}

body {
    flex: 1;
}

.footer {
    margin-top: auto;
}

@media (max-width: 600px) {
    .detail {
        padding: 15px;
    }

    h1 {
        font-size: 1.5em;
    }
}
.Button {
    background-color: #aaa;
    color: #fff;
    padding: 12px 25px;
    border: 1px solid #ccc;
    border-radius: 10px;
    cursor: pointer;
    font-size: 1em;
    transition: background-color 0.3s, color 0.3s;
}

.Button:hover {
    background-color: #ccc;
    color: #000;
}

.footer {
    background-color: #2c3e50;
    color: #fff;
    text-align: center;
    padding: 20px 0;
    position: relative;
    bottom: 0;
    width: 100%;
}

.footer-content {
    max-width: 800px;
    margin: 0 auto;
}

.footer p {
    margin: 0;
    font-size: 0.9em;
}

.social-icons {
    margin-top: 10px;
}

.social-icons a {
    color: #fff;
    text-decoration: none;
    margin: 0 10px;
    font-size: 0.9em;
    transition: color 0.3s;
}

.social-icons a:hover {
    color: #3498db;
}


        </style>
    </head>
    <body>
        <c:set var="movieDetail" value="${sessionScope.MOVIE_DETAIL}" />
        <c:if test="${not empty movieDetail}">
            <form action="DispatchServlet">
                 <div class="detail">
                <img src="${movieDetail.movieImage}">
                <h1>${movieDetail.movieName}</h1>
                <div>Duration: ${movieDetail.movieDuration}</div>
                <div>${movieDetail.movieTitle}</div>
                <div>Genre: ${movieDetail.movieGenre}</div>
                <div class="synopsis">${movieDetail.movieSynopsis}</div>
                <input value="Buy ticket" name="btAction" type="submit" class="Button"/>
            </div>
            </form>
        </c:if>
    </body>
    <footer class="footer">
    <div class="footer-content">
        <p>&copy; 2024 MovieDetail. All rights reserved.</p>
        <div class="social-icons">
            <a href="https://facebook.com" target="_blank">Facebook</a> |
            <a href="https://twitter.com" target="_blank">Twitter</a> |
            <a href="https://instagram.com" target="_blank">Instagram</a>
        </div>
    </div>
</footer>

</html>
