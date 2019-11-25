<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des clients</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>Liste des clients</h1>
		<table class="table">
			<div>
				<a href="addClientEI" class="btn btn-link">ajout client EI</a> <a
					href="addClientMoral" class="btn btn-link">ajout client Moral</a> <a
					href="addClientPhysique" class="btn btn-link">ajout client
					Physique</a>
			</div>
			<thead>
				<tr>
					<th>Type</th>
					<th>Id</th>
					<th>Nom</th>
					<th>Téléphone</th>
					<th>Fax</th>
					<th>Email</th>
					<th>Adresse</th>
					<th>Code postal</th>
					<th>Ville</th>
					<th>Pays</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${clients}">
					<tr>
						<td>${c.getClass().simpleName}</td>
						<td>${c.id}</td>
						<td>${c.nom}</td>
						<td>${c.numeroTel}</td>
						<td>${c.numeroFax}</td>
						<td>${c.email}</td>
						<td>${c.adresse.adresse}</td>
						<td>${c.adresse.codePostal}</td>
						<td>${c.adresse.ville}</td>
						<td>${c.adresse.pays}</td>
						<c:url var="edit" value="edit">
							<c:param name="id" value="${c.id}"></c:param>
						</c:url>
						<c:url var="delete" value="delete">
							<c:param name="id" value="${c.id}"></c:param>
						</c:url>
						<td><a href="${edit}" class="btn btn-outline-primary">editer</a></td>
						<td><a href="${delete}" class="btn btn-outline-danger">supprimer</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>