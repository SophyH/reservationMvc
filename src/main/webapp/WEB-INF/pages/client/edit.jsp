<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edition client</title>
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
		<fieldset>
			<legend>Edition d'un client</legend>
			<c:choose>
				<c:when test="${client.getClass().simpleName == 'ClientEI'}">
					<c:url var="action" value="saveClientEI"></c:url>
				</c:when>
				<c:when test="${client.getClass().simpleName == 'ClientMoral'}">
					<c:url var="action" value="saveClientMoral"></c:url>
				</c:when>
				<c:when test="${client.getClass().simpleName == 'ClientPhysique'}">
					<c:url var="action" value="saveClientPhysique"></c:url>
				</c:when>
			</c:choose>
			<form:form action="${action}" method="post" modelAttribute="client">
				<form:hidden path="version" />
				<div class="form-group">
					<form:label path="id">Id</form:label>
					<form:input path="id" cssClass="form-control" readonly="true" />
				</div>
				<div class="form-group">
					<form:label path="nom">Nom</form:label>
					<form:input path="nom" cssClass="form-control" />
				</div>
				<div class="form-group">
					<form:label path="numeroTel">Numéro de téléphone</form:label>
					<form:input path="numeroTel" cssClass="form-control" />
				</div>
				<div class="form-group">
					<form:label path="numeroFax">Numéro de fax</form:label>
					<form:input path="numeroFax" cssClass="form-control" />
				</div>
				<div class="form-group">
					<form:label path="email">Email</form:label>
					<form:input path="email" cssClass="form-control" />
				</div>
				<div class="form-group">
					<form:label path="adresse.adresse">Adresse</form:label>
					<form:input path="adresse.adresse" type="number"
						cssClass="form-control"></form:input>
				</div>
				<div class="form-group">
					<form:label path="adresse.codePostal">Code postal</form:label>
					<form:input path="adresse.codePostal" cssClass="form-control"></form:input>
				</div>
				<div class="form-group">
					<form:label path="adresse.ville">Ville</form:label>
					<form:input path="adresse.ville" cssClass="form-control"></form:input>
				</div>
				<div class="form-group">
					<form:label path="adresse.pays">Pays</form:label>
					<form:input path="adresse.pays" cssClass="form-control"></form:input>
				</div>
				<div class="form-group">
							<form:label path="titre">Titre</form:label>
							<form:select path="titre" itemLabel="label" items="${titres}" cssClass="form-control"/>
						</div>
				<c:choose>
					<c:when test="${client.getClass().simpleName == 'ClientEI'}">
						<div class="form-group">
							<form:label path="prenom">Prénom</form:label>
							<form:input path="prenom" cssClass="form-control" />
						</div>
					</c:when>
					<c:when test="${client.getClass().simpleName == 'ClientMoral'}">
						<div class="form-group">
							<form:label path="siret">Siret</form:label>
							<form:input path="siret" cssClass="form-control" />
						</div>
					</c:when>
					<c:when test="${client.getClass().simpleName == 'ClientPhysique'}">
						<div class="form-group">
							<form:label path="prenom">Prenom</form:label>
							<form:input path="prenom" cssClass="form-control" />
						</div>
					</c:when>
				</c:choose>


				<div class="form-group">
					<button type="submit" class="btn btn-outline-success">Enregistrer</button>
					<a href="list" class="btn btn-outline-danger">Annuler</a>
				</div>
			</form:form>
		</fieldset>
	</div>
</body>
</html>