<%-- 
    Document   : FormularioEPS
    Created on : 07/11/2016
    Author     : Ovidio Zea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="estilo.css"></link>
<link rel="stylesheet" href="listas.css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Datos Persona</title>
</head>
<script type="text/javascript">
	function enviarFormulario(operacion, idPersona){
		document.getElementById('operacion').value=operacion;
		document.getElementById('idPersona').value=idPersona;
		document.getElementById("FormDatos").submit();
	}
	
	function cargarPersona(operacion){
		document.getElementById('operacion').value=operacion;
		document.getElementById("FormDatos").submit();
	}

</script>
<body>
	<!--MEMU SUPERIOR-->
	<%@include file="/menuNavegacion.jsp"%>
	<!--MEMU LATERAL--> 
        <%@include file="./menuPersona.jsp" %>
	<h1 id="titulo">DATOS PERSONA</h1>
	<form id="FormDatos" name="FormDatos" action="./ServletPersona" method="POST">
		<input type="hidden" name="operacion" id="operacion" />
		<input type="hidden" name="idPersona" id="idPersona"/>
		<table class="rwd-table-noBorder">
			<tr>
				<td>
					<h2>Perfil: ${requestScope.perfil}</h2>
				</td>
			</tr>
		</table>
		<table class="rwd-table" style="font-size: 20px">
		<tr>
				<th>Nombre</th>
				<th>Tipo Documento</th>
				<th>No. Documento</th>
				<th>Dirección</th>
				<th>Telefono</th>
				<th>Correo</th>
				<th>EPS</th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<td>${requestScope.pNom} ${requestScope.sNom} ${requestScope.pApe} ${requestScope.sApe}</td>
				<td>${requestScope.doc}</td>
				<td>${requestScope.num} </td>
				<td>${requestScope.dir}</td>
				<td>${requestScope.tel}</td>
				<td>${requestScope.mail}</td>
				<td>${requestScope.eps}</td>
				<td><input type="submit" name="editarPersona" id="editarPersona" value="editar" class="btnEditar"
							 onclick="enviarFormulario(this.id,${requestScope.idPersona})"/></td>
				<td><input type="submit" name="eliminarPersona" id="eliminarPersona" value="eliminar" class="btnEliminar"
						onclick="enviarFormulario(this.id,${requestScope.idPersona})"/></td>
			</tr>
		</table>
	</form>
</body>
</html>
