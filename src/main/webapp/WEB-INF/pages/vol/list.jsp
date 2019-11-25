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
	
		<h1>Liste des vols</h1>
		<div>
			<a  href="addVol" class="btn btn-link" type="submit" >Ajouter vol</a> 
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>Id</th>
					<th>Date de départ</th>
					<th>Heure départ</th>
					<th>Date d'arrivée</th>
					<th>Heure d'arrivée</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="v" items="${vol}">
					<tr>
						<td>${v.idVol}</td>
						<td><fmt:formatDate value="${v.dateDepart}" pattern="dd/MM/yyyy"/></td>
						<td><fmt:formatDate value="${v.heureDepart}" pattern="HH:mm" type="time"/></td>
						<td><fmt:formatDate value="${v.dateArrivee}" pattern="dd/MM/yyyy"/></td>
						<td><fmt:formatDate value="${v.heureArrivee}" pattern="HH:mm" type="time"/></td>
						<c:url var="edit" value="edit">
							<c:param name="id" value="${v.idVol}"></c:param>
						</c:url>
						<td><a href="${edit}" class="btn btn-primary">Editer</a></td>
						<c:url var="delete" value="delete">
							<c:param name="id" value="${v.idVol}"></c:param>
						</c:url>
						<td><a href="${delete}" class="btn btn-danger">Supprimer</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>