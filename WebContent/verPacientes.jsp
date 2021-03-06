<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="estilo.css"></link>
<link rel="stylesheet" href="estiloAsignaciones.css"></link>
<link rel="stylesheet" href="listas.css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pacientes</title>
</head>
<script type="text/javascript">
	function enviarFormulario(tipo, idPersona, idPaciente){
		document.getElementById('operacion').value=tipo;
		document.getElementById('idPracticante').value=idPersona;
		document.getElementById('idPaciente').value=idPaciente;
		document.getElementById("FormDatos").submit();
	}
	
	function verPaciente(idPaciente){
		console.log("formVer");
		document.getElementById('idPersona').value=idPaciente;
		document.getElementById('FormVer').submit();
	}
</script>
<body>
	<!--MEMU SUPERIOR-->
	<%@include file="/menuNavegacionPracticante.jsp"%>
	<div id="usuarios">
		<h1 class="cabin">MIS PACIENTES</h1>
		<form id="FormDatos" name="FormDatos" action="./ServletCita" method="POST">
			<input type="hidden" name="operacion" id="operacion" />
			<input type="hidden" name="idPracticante" id="idPracticante"/>
			<input type="hidden" name="idPaciente" id="idPaciente"/>
		<table id="tablaUsuarios">
			<thead>
				<th>Nombre</th>
				<th>Tipo Documento</th>
				<th>N° Documento</th>
				<th>Dirección</th>
				<th>Teléfono</th>
				<th>Correo</th>
				<th>Historia Clinica</th>
				<th>Detalle</th>
				<th>Acción</th>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.listaPacientes}" var="persona">
				<tr>
					<td>${persona.primerNombre} ${persona.segundoNombre} ${persona.primerApellido} ${persona.segundoApellido}</td>
					<td>${persona.tipoDocumento.sigla}</td>
					<td>${persona.numeroDocumento}</td>
					<td>${persona.direccion}</td>
					<td>${persona.telefono}</td>
					<td>${persona.correo}</td>
					<td><a href="./ServletHistoriaClinica?operacion=detalleTratamiento&amp;idPersona=${persona.idPersona}">${persona.historiaClinica.codigo}</a></td>
					<td><input type="button" name="verPersona" id="verPersona" value="" class="btnVer" onclick="verPaciente(${persona.idPersona})"/></td>
					<td><input type="submit" name="editarPersona" id="editarPersona" value="" class="btnEditarPersona" onclick="enviarFormulario('crearCita',${sessionScope.personaSession.idPersona},${persona.idPersona})"/></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</form>
	</div>
	<div>
		<a href="inicioCita.jsp"><button id="returnBtn" class="btnReturn btnReturn-warning">Regresar</button></a>
	</div>
	<form id="FormVer" name="FormVer" action="./ServletPersona" method="POST">
		<input type="hidden" name="operacion" id="operacion" value="detallePersona"/>
		<input type="hidden" name="idPersona" id="idPersona"/>
	</form> 
</body>
</html>