<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<div class="contrainer">

		<fieldset>
			<legend> Edition Reservations </legend>

			<c:url var="action" value="saveReservation"></c:url>


				<form:form action="${action}" method="post" modelAttribute="reservation">
				<form:hidden path="version" value="${reservation.version}" />

				<div class="form-group">

					<form:label path="idReservation">id Reservation:</form:label>
					<form:input path="idReservation" cssClass="form-control"
						readonly="true" />
				</div>

				<div class="form-group">
					<form:label path="numeroReservation">numero Reservation:</form:label>
					<form:input path="numeroReservation" cssClass="form-control" />
				</div>
				<div class="form-group">
					<form:label path="dateReservation">date de Reservation:</form:label>
					<form:input type="date" path="dateReservation"
						cssClass="form-control" />
				</div>
				
				
				<div class="from-group">
					<button type="submit" class="btn btn-outline-success">enregistrer</button>
					<a href="list" class="btn btn-outline-danger">annuler</a>
				</div>
				
				<div class="form-group">
					<form:label path="passager.idPassager">passager:</form:label>
					<form:select cssClass="form-control" path="passager.idPassager">
						<form:option value="">pas de passager</form:option>
						<form:options items="${passagers}" itemValue="idPassager" itemLabel="nomPassager" />
					</form:select>
				</div>
			
			
	<div class="form-group">
					<form:label path="vols.idVol">Vol:</form:label>
					<form:select cssClass="form-control" path="vols.idVol">
						<form:option value="">pas de Vol</form:option>
						<form:options items="${vols}" itemValue="idVol" itemLabel="idVol" />
					</form:select>
				</div>
			
			
			
			
					</form:form>
		</fieldset>
	</div>
</body>
</html>