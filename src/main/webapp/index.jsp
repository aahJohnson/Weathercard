<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Controller.weatherServlet"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<% String cityCookie = weatherServlet.getCityCookie(request, response); %>
<% String cloudCookie = weatherServlet.getCloudCookie(request, response); %>
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.83.1">
<meta charset="UTF-8">

<title>Weathercard</title>

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
			<h1>Search the world</h1>
			<form action="<%= request.getContextPath() %>/weatherServlet" method="get">
				<div class="input-group mb-3">
  					<div class="input-group-prepend">
    					<span class="input-group-text" id="inputGroup-sizing-default">City:</span>
    				</div>
    				<input type="text" name="city" placeholder="Tokyo" class="form-control"/><br/>
    			</div>
    			
    			<div class="input-group mb-3">
  					<div class="input-group-prepend">
    					<span class="input-group-text" id="inputGroup-sizing-default">Country code:</span>
    				</div>
    				<input type="text" name="country" placeholder="JP" maxlength="2" class="form-control"/><br/>
    			</div>
    			<span>${errorMessage}</span><br>
    			<button type="submit" class="btn btn-lg btn-secondary fw-bold border-white bg-white">Discover</button>
    		</form><br>
    		
    		<c:if test="${cookie.cloudCookie.getValue() != null}">
    		
    		<h3>Latest search result:</h3>
    		<p>The weather in ${cookie.cityCookie.getValue()} is currently: ${cookie.cloudCookie.getValue()}</p>
			</c:if>
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