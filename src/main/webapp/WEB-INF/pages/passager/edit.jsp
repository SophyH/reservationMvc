<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>edition passager</title>
<link rel="stylesheet"
	href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<fieldset>
			<legend>edition passager</legend>
			<form:form action="savePassager" method="post" modelAttribute="passager">
				<form:hidden path="version" />
				<div class="form-group">
					<form:label path="idPassager">id</form:label>
					<form:input path="idPassager" cssClass="form-control" />
				</div>
				<div class="form-group">
					<form:label path="nomPassager">nom</form:label>
					<form:input path="nomPassager" cssClass="form-control" />
				</div>
				<div class="form-group">
					<form:label path="prenomPassager">prenom</form:label>
					<form:input path="prenomPassager" cssClass="form-control" />
				</div>
				<div class="form-group">
					<form:label path="adressePassager.adresse">adresse</form:label>
					<form:input path="adressePassager.adresse" cssClass="form-control" />
				</div>
				<div class="form-group">
					<form:label path="adressePassager.codePostal">codePostal</form:label>
					<form:input path="adressePassager.codePostal"
						cssClass="form-control" />
				</div>
				<div class="form-group">
					<form:label path="adressePassager.ville">ville</form:label>
					<form:input path="adressePassager.ville" cssClass="form-control" />
				</div>
				<div class="form-group">
					<form:label path="adressePassager.pays">pays</form:label>
					<form:input path="adressePassager.pays" cssClass="form-control" />
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-outline-success">enregistrer</button>
					<a href="list" type="btn btn-outline-danger">annuler</a>
				</div>
			</form:form>
		</fieldset>
	</div>
</body>
</html>