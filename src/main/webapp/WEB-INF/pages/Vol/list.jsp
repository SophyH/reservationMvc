<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="personne.list.titre"></spring:message></title>
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
			<a  class="btn btn-link" type="submit" >Ajouter vol</a> 
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
						<td>${v.id}</td>
						<td>${p.civilite}</td>
						<td>${p.prenom}</td>
						<td>${p.nom}</td>
						<td><fmt:formatDate value="${p.dtNaiss}" pattern="dd/MM/yyyy"/></td>
						<td>${p.adresse.numero}&nbsp;${p.adresse.rue}</td>
						<td>${p.adresse.codePostal}</td>
						<td>${p.adresse.ville}</td>
						<td>${p.salle.nom}</td>
						<td><c:if test="${p.getClass().simpleName == 'Formateur'}">${p.anneeExperience}</c:if></td>
						<td><c:if test="${p.getClass().simpleName == 'Stagiaire'}">${p.formation}</c:if></td>						
						<c:url var="edit" value="edit">
							<c:param name="id" value="${p.id}"></c:param>
						</c:url>
						<td><a href="${edit}" class="btn btn-primary"><spring:message code="bouton.edit"></spring:message></a></td>
						<c:url var="delete" value="delete">
							<c:param name="id" value="${p.id}"></c:param>
						</c:url>
						<td><a href="${delete}" class="btn btn-danger"><spring:message code="bouton.supprimer"></spring:message></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>