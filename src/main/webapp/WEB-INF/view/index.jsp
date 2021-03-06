<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value = "/css/style.css"></c:url>">
<body>
	
	<nav class="navbar navbar-dark bg-dark ">
		<h1 class="titre mx-auto">Gestion des sondages</h1>
	</nav>
	<div class="container-fluid py-5">
		<div class="row">
			<div class="col-md-6 ml-auto">
				<div class="panel-body">
					<table class="table table-light">
						<thead style="background-color: #2c333a;" >
							<tr>
								<th>Id:</th>
								<th>Date d'ouverture:</th>
								<th>Date de fermeture prévisionnelle:</th>
								<th>Date de fermeture:</th>
								<th>Détails:</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="survey" items="${surveys}">
								<c:url value="/details.html?id=" var="details" />
								<tr>
									<td class="id" style="background-color: #2c333a;"><c:out value="${survey.id}" /></td>
									<td><c:out value="${survey.startDate}" /></td>
									<td><c:out value="${survey.expectedDate}" /></td>
									<td><c:out value="${survey.endDate}" /></td>
									<td><a href="${details}${survey.id}" class="btn btn-outline-dark">Voir
											détails</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-md-3 ml-auto">
				<div class="card text-white bg-dark mb-3" style="max-width: 18rem;">
					<div class="card-header">Cloturer le sondage en cours</div>
					<div class="card-body">
						<form action="" method="post">
							<div class="form-group">
								<label for="dateFermeture">Date de fermeture:</label> <input
									type="date" class="form-control" id="dateFermeture"
									name="dateFermeture" required>
							</div>
							<div class="form-group">
								<c:if test="${isRunning!=0}">
									<button type="submit" class="btn btn-outline-light">Fermer le
										sondage</button>
									<c:if test="${not empty message}">
										<div class="alert alert-danger my-2" role="alert">${message}</div>
									</c:if>
								</c:if>
								<c:if test="${isRunning==0}">
									<button type="submit" class="btn btn-default"
										disabled="disabled">Fermer le sondage</button>
									<div class="alert alert-warning my-2" role="alert">Vous ne
										pouvez pas fermer de sondage, car il n'y a pas de sondage en
										cours.</div>
								</c:if>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-3 ml-auto">
				<div class="card text-white bg-dark mb-3" style="max-width: 18rem;">
					<div class="card-header">Créer un sondage</div>
					<div class="card-body">
						<form method="post">
							<div class="form-group">
								<label for="dateOuverture">Date d'ouverture:</label> <input
									type="date" class="form-control" id="dateOuverture"
									name="dateOuverture" required>
							</div>
							<div class="form-group">
								<label for="dateFermeturePrevisionnelle">Date de
									fermeture previsionnelle:</label> <input type="date"
									class="form-control" id="dateFermeturePrevisionnelle"
									name="dateFermeturePrevisionnelle" required>
							</div>
							<div class="form-group">
								<c:if test="${isRunning==0}">
									<button type="submit" class="btn btn-outline-light">Créer</button>
									<c:if test="${not empty message}">
										<div class="alert alert-danger my-2" role="alert">${message}</div>
									</c:if>

								</c:if>
								<c:if test="${isRunning!=0}">
									<button type="submit" class="btn btn-default"
										disabled="disabled">Créer</button>
									<div class="alert alert-warning my-2" role="alert">Vous ne
										pouvez pas créer un nouveau sondage, car il y a déjà un
										sondage en cours.</div>
								</c:if>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>