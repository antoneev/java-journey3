<!-- Antone J. Evans Jr. -->
<!-- CSCI 3381 -->
<!-- Full stack development project for tennis predictor based on the weather. -->
<!-- Third Page - Results Page -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- The title of the page -->
<title>Result Page</title>
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
		<!-- The banner of the page -->
		<img src="wordsW-trans.png" alt="Cinque Terre" width="270" height="70">
	</header>

	<section>
		<nav>
			<ul>
				<!-- Produces yes/no/maybe prediction -->
				<%
					String predict = (String) request.getAttribute("servletResponse");
				%>
				<%=predict%>

				<br>

				<!-- Prints out all days from data file -->
				<%
					String allDays = (String) request.getAttribute("servletResponse1");
				%>
				<textarea rows="10" cols="30">
				<%=allDays%>
				</textarea>
				<br>
				<!-- Takes the user back to the secondPage if pressed -->
				<button onclick="location.href = '/project3/predictionPage.jsp';"
					id="myButton" class="float-left submit-button">Predict
					Again!</button>

			</ul>
		</nav>

		<article>
			<center>
				<!-- Produces the twitter feed -->
				<a width="500" height="350" class="twitter-timeline"
					href="https://twitter.com/Tennis?ref_src=twsrc%5Etfw">Tweets by
					Tennis</a>
				<script async src="https://platform.twitter.com/widgets.js"
					charset="utf-8"></script>
		</article>
		</center>
	</section>

	<!-- Prints out the footer -->
	<footer id="copyright" class="clear">
		<p class="fl_left">
			Copyright &copy; 2019 - <a href="/project3/index.html" title="Login">Login
				Page</a>. All Rights Reserved
		</p>
	</footer>

</body>
</html>
