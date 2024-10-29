<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up</title>
        <style>
            /* General reset */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            /* Background styling */
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-image: url('https://example.com/movie-background.jpg');
                background-size: cover;
                background-position: center;
                color: #fff;
            }

            /* Sign up container styling */
            .signup-container {
                background: rgba(0, 0, 0, 0.8);
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.5);
                max-width: 350px;
                text-align: center;
            }

            /* Title styling */
            .signup-container h1 {
                margin-bottom: 20px;
                font-size: 24px;
                color: #FFD700; /* Gold color for movie theme */
            }

            /* Form input styling */
            .signup-container input[type="text"],
            .signup-container input[type="email"],
            .signup-container input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #FFD700;
                border-radius: 4px;
                background: #222;
                color: #FFD700;
                font-size: 16px;
            }

            /* Button styling */
            .signup-container input[type="submit"] {
                width: 100%;
                padding: 10px;
                margin-top: 10px;
                background: #FFD700;
                border: none;
                border-radius: 4px;
                color: #000;
                font-weight: bold;
                cursor: pointer;
                font-size: 16px;
            }

            .signup-container input[type="submit"]:hover {
                background: #ffdd44;
            }

            /* Additional link styling */
            .signup-container p {
                margin-top: 15px;
                font-size: 14px;
                color: #ccc;
            }

            .signup-container a {
                color: #FFD700;
                text-decoration: none;
            }

            .signup-container a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>

        <div class="signup-container">
            <h1>Create an Account</h1>
            <form action="DispatchServlet" method="POST">
                <input type="text" name="txtUsername" placeholder="Username" required/>
                <input type="text" name="txtPhone" placeholder="Phone Number" required/>
                <input type="password" name="txtPassword" placeholder="Password" required/>
                <input name="txtRole" value="false" hidden/>
                <input type="submit" name="btAction" value="Sign Up"/>
            </form>
            <p>Already have an account? <a href="login.html">Log In</a></p>
        </div>

    </body>
</html>
