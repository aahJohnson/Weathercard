<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.weatherBean"%>
<% weatherBean wBean = (weatherBean) request.getAttribute("wBean"); %>
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.83.1">
<meta charset="UTF-8">

<title>Weathercard</title>

<!-- Background -->
<style>
body {
	background-image: url('images/tokyoSkyline.jpg');
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
	
#Home {
	background: none;
	border: none;
	padding: 0;
	cursor: pointer;
}
</style>

<link rel="icon" type="image/png" href="images/browserIcon.png"/>
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/cover/">

<!-- Bootstrap core CSS -->
<link href="bootstrap-files/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-files/cover/cover.css" rel="stylesheet">

</head>

<body class="d-flex h-100 text-center text-white bg-dark">

	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
		<header class="mb-auto">
			<div>
				<h3 class="float-md-start mb-0">Weathercard</h3>
				<nav class="nav nav-masthead justify-content-center float-md-end">
					<form action="<%= request.getContextPath() %>/indexRedirect" method="get">
						<button class="nav-link active" aria-current="page" id="Home" type="submit">Home</button>
					</form>
				</nav>
			</div>
		</header>

		<main class="px-3">
			<h1 style="text-transform: capitalize;"><% out.print(wBean.getCityName()); %></h1>
			<p>
			<%
			out.print("The weather in " + wBean.getCityName() + " is currently: " + wBean.getCloudPattern());
			%>
			</p>
		</main>

		<footer class="mt-auto text-white-50">
			<p>
				Made by <a
					href="https://github.com/aahJohnson" class="text-white">Adam Johnson</a>.
			</p>
		</footer>
	</div>
</body>
</html>