<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>liste des reservations</title>
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
		<h1>liste des reservations</h1>
		<div>
			<a href="addReservation" class="btn btn-link">ajouter reservation</a>
		</div>

		<table class=" table table-bordered table-striped">
			<thead>
				<tr>
					<th>id</th>
					<th>numero</th>
					<th>date</th>
					<th>nomPassager</th>
					<th>prenomPasager</th>
					<th>id Vol </th>
				
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="r" items="${reservations}">
					<tr>
						<td>${r.idReservation}</td>
						<td>${r.numeroReservation}</td>
						<td><fmt:formatDate value="${r.dateReservation}"
								pattern="dd/MM/yyyy" /></td>
						<td>${r.passager.nomPassager}</td>
						<td>${r.passager.prenomPassager}</td>
						 <td>${r.vols.idVol}</td>


						<c:url var="edit" value="edit">
							<c:param name="idReservation" value="${r.idReservation}"></c:param>
						</c:url>

						<td><a href="${edit}" class="btn btn-outline-primary">modifier</a>
						</td>

						<c:url var="delete" value="delete">
							<c:param name="idReservation" value="${r.idReservation}"></c:param>
						</c:url>
						<td><a href="${delete}" class="btn btn-outline-danger">supprimer</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>