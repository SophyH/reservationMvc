<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>edition vol</title>
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
			<legend>edition vol</legend>
			<form:form action = "saveVol" method="post" modelAttribute="vol">
				<form:hidden path="version" />
				<div class="form-group">
					<form:label path="idVol" >id</form:label>
					<form:input path="idVol" readonly="true" cssClass="form-control" />
				</div>
				
				<div class="form-group">
					<form:label path="dateDepart">date de départ:</form:label>
					<form:input type="date" path="dateDepart" cssClass="form-control" />
				</div>
				
				<div class="form-group">
					<form:label path="heureDepart">heure de départ</form:label>
					<form:input type="time" path="heureDepart" cssClass="form-control" />
				</div>
				<div class="form-group">
					<form:label path="dateArrivee">date d'arrivee:</form:label>
					<form:input type="date" path="dateArrivee" cssClass="form-control" />
				</div>
				<div class="form-group">
					<form:label path="heureArrivee">heure d'arrivee</form:label>
					<form:input type="time" path="heureArrivee" cssClass="form-control" />
				</div>
				
				
	
				<div class="form-group">
					<button type="submit" class="btn btn-outline-success">enregistrer</button>
					<a href="list" class="btn btn-outline-danger">Annuler</a>
				</div>

			</form:form>
		</fieldset>

	</div>

</body>
</html>