<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>liste des aeroports</title>
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
		<h1>liste des aeroports</h1>
		<div>
			<a href="addAeroport" class="btn btn-link">ajouter aeroport</a>
		</div>

		<table class=" table table-bordered table-striped">
			<thead>
				<tr>
					<th>id</th>
					<th>nom</th>

					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="a" items="${aeroports}">
					<tr>
						<td>${a.idAeroport}</td>
						<td>${a.nomAeroport}</td>



						<c:url var="edit" value="edit">
							<c:param name="idAeroport" value="${a.idAeroport}"></c:param>
						</c:url>

						<td><a href="${edit}" class="btn btn-outline-primary">modifier</a>
						</td>

						<c:url var="delete" value="delete">
							<c:param name="idAeroport" value="${a.idAeroport}"></c:param>
						</c:url>
						<td><a href="${delete}" class="btn btn-outline-danger">supprimer</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>