<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des passagers</title>
<link rel="stylesheet"
	href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h1>Liste des passagers</h1>
		<div>
			<a href="addPassager" class="btn btn-link">Ajouter un passager</a>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>id du passager</th>
					<th>nom passager</th>
					<th>prénom passager</th>
					<th>adresse passager</th>
					<th>code postal passager</th>
					<th>ville passager</th>
					<th>pays passager</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="p" items="${passager}">
					<tr>
						<td>${p.idPassager}</td>
						<td>${p.nomPassager}</td>
						<td>${p.prenomPassager}</td>
						<td>${p.adressePassager.adresse}</td>
						<td>${p.adressePassager.codePostal}</td>
						<td>${p.adressePassager.ville}</td>
						<td>${p.adressePassager.pays}</td>
						<c:url var="edit" value="edit">
							<c:param name="id" value="${p.idPassager}"></c:param>
						</c:url>
						<td><a href="${edit}" class="btn btn-primary">editer</a></td>
						<c:url var="delete" value="delete">
							<c:param name="id" value="${p.idPassager}"></c:param>
						</c:url>
						<td><a href="${delete}" class="btn btn-danger">supprimer</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>