<!-- Antone J. Evans Jr. -->
<!-- CSCI 3381 -->
<!-- Full stack development project for tennis predictor based on the weather. -->
<!-- Second Page - User Input Page -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- The title of the page -->
<title>Predictor Page</title>
<!-- The icon of the page -->
<link rel="icon" href="icon.png">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- The CSS of the page -->
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
	background-color: #666;
	padding: 30px;
	text-align: center;
	font-size: 35px;
	color: white;
}

/* Create two columns/boxes that floats next to each other */
nav {
	float: left;
	width: 30%;
	height: 400px; /* only for demonstration, should be removed */
	background: #ccc;
	padding: 20px;
}

/* Style the list inside the menu */
nav ul {
	list-style-type: none;
	padding: 0;
}

article {
	float: left;
	padding: 20px;
	width: 70%;
	background-color: #f1f1f1;
	height: 400px; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section:after {
	content: "";
	display: table;
	clear: both;
}

/* Style the footer */
footer {
	background-color: #777;
	padding: 10px;
	text-align: center;
	color: white;
}

/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media ( max-width : 600px) {
	nav, article {
		width: 100%;
		height: auto;
	}
}
</style>
</head>
<body>


	<header>
		<!-- Page Banner -->
		<img src="wordsW-trans.png" alt="Cinque Terre" width="270" height="70">
	</header>

	<section>
		<nav>
			<ul>
				<!-- Connects the jsp to the Servlet -->
				<form action="/project3/weatherServlet" method="get">
					<!-- Produces the user input fields with default values -->
					<font color="black">Temperature:</font> <input type="number"
						name="temp" min="0" max="100" value="85"> <br> <br>
					<font color="black">Humidity:</font> <input type="number"
						name="hum" min="0" max="100" value="85"> <br> <br>
					<font color="black">Outlook:</font> <select name="outlook">
						<option value="overcast">Overcast</option>
						<option value="rainy">Rainy</option>
						<option value="sunny">Sunny</option>
					</select> <br> <br> <font color="black">Windy? </font> <input
						type="checkbox" name="windy" value="windy"> <br> <br>
					<!-- Redriects the user to thirdPage -->
					<input type="submit" name="predict" value="Predict">
					<!-- This resets the values to the default values -->
					<input type="reset">
				</form>
			</ul>
		</nav>

		<article>
			<center>
				<!-- This produces the youtube video -->
				<iframe width="500" height="350"
					src="https://www.youtube.com/embed/H7FGuJcOQBM" frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
		</article>
		</center>
	</section>

	<!-- Produces the copyright footer -->
	<footer id="copyright" class="clear">
		<p class="fl_left">
			Copyright &copy; 2019 - <a href="/project3/index.html" title="Login">Login
				Page</a>. All Rights Reserved
		</p>
	</footer>

</body>
</html>
