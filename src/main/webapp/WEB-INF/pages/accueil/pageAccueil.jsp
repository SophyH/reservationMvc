<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des vols</title>
<link rel="stylesheet"
	href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
	
		<h1>Page d'accueil</h1>
		
		<img src="../images/airfrance.jpg" class="rounded" alt="Cinque Terre" width="350">
		
		<div>
			<a  href="listeClient" class="btn btn-link" type="submit" >Aller à la liste des clients</a> 
			<a  href="listeVol" class="btn btn-link" type="submit" >Aller à la liste des vols</a> 
			<a  href="listePassager" class="btn btn-link" type="submit" >Aller à la liste des passagers</a> 
			<a  href="listeReservation" class="btn btn-link" type="submit" >Aller à la liste des reservations</a> 
		</div>
	
	</div>
</body>
</html>