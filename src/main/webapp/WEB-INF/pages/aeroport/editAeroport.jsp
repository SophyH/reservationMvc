<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>liste des aeroport</title>
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
	<div class="contrainer">

		<fieldset>
			<legend> Edition Aeroports </legend>

			<c:url var="action" value="saveAeroport"></c:url>


			<form:form action="${action}" method="post"
				modelAttribute="aeroport">

				<div class="form-group">

					<form:label path="idAeroport">id Aeroport:</form:label>
					<form:input path="idAeroport" cssClass="form-control"
						readonly="true" />
				</div>

				<div class="form-group">
					<form:label path="nomAeroport">nom Aeroport:</form:label>
					<form:input path="nomAeroport" cssClass="form-control" />
				</div>
				
				
				
				<div class="from-group">
					<button type="submit" class="btn btn-outline-success">enregistrer</button>
					<a href="list" class="btn btn-outline-danger">annuler</a>
				</div>
			</form:form>
		</fieldset>
	</div>
</body>
</html>