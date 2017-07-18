<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="estilo.css"></link>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <title>Comentarios de reporte</title>
    </head>
		<%
		  if (session.getAttribute("perfil")==null)
		  {
		    String address = "/index.jsp";
		    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
		    dispatcher.forward(request,response);
		  }
		%>
	<script>
	$(document).ready(function() {

		if($('#estadoReporte').val()=='Aceptado'){

			console.log('Reporte aceptado. Se ocultan botones de actualizaci�n');
			$('#btnObjetivo').hide();
			$('#btnDescripcion').hide();
			$('#btnTareas').hide();
			$('#btnActividadesProx').hide();

			}

		if($('#estadoReporte').val()=='Rechazado' || $('#estadoReporte').val()=='Pendiente'){

			$('#btnObjetivo').click(function() {
					$('#btnObjetivoCancel').show();
					$('#campoObjetivo').show();
					$('#btnObjetivo').hide();
				});
			
			$('#btnObjetivoCancel').click(function() {
				$('#btnObjetivoCancel').hide();
				$('#campoObjetivo').hide();
				$('#btnObjetivo').show();
				});
	
			$('#btnDescripcion').click(function() {
				$('#btnDescripcionCancel').show();
				$('#campoDescripcion').show();
				$('#btnDescripcion').hide();
			});
		
			$('#btnDescripcionCancel').click(function() {
				$('#btnDescripcionCancel').hide();
				$('#campoDescripcion').hide();
				$('#btnDescripcion').show();
				});
	
			$('#btnTareas').click(function() {
				$('#btnTareasCancel').show();
				$('#campoTareas').show();
				$('#btnTareas').hide();
			});
		
			$('#btnTareasCancel').click(function() {
				$('#btnTareasCancel').hide();
				$('#campoTareas').hide();
				$('#btnTareas').show();
				});
	
			$('#btnActividadesProx').click(function() {
				$('#btnActividadesProxCancel').show();
				$('#campoActividades').show();
				$('#btnActividadesProx').hide();
			});
		
			$('#btnActividadesProxCancel').click(function() {
				$('#btnActividadesProxCancel').hide();
				$('#campoActividades').hide();
				$('#btnActividadesProx').show();
				});	
			}
				
		});
	</script>
		
    <body>      
        <!--MEMU SUPERIOR--> 
        <%@include file="./menuNavegacionPracticante.jsp" %>
		<div>
        	<h1 class="cabin">Comentarios de reporte</h1>
        	<h2 class="cabin">Cita n�mero ${requestScope.cita.numCita}</h2>
        </div>
        <br>
        <div id="marcoFormularioCupos">
        	<form align="center" id="register-form" name="formularioComentariosAsesor" action="ReportesPracticante" method="POST">
        		<input type="hidden" id="operacion" name="operacion" value="guardarMoficiacionesReporteSesion"/>
        		<input type="hidden" id="idReporte" name="idReporte" value="${requestScope.sesionReportePracticante.idSesion}"/>
        		<input type="hidden" id="estadoReporte" name="estadoReporte" value="${requestScope.cita.estado}"/>
        		<fieldset>
        			<div class="fieldgroupTextArea">
        				<label class="cabin"><b>Fecha de la cita:</b></label>
        				<label class="cabin">${requestScope.sesionReportePracticante.fecha}</label>
        			</div>
        			<div class="fieldgroupTextArea">
        				<label class="cabin"><b>Paciente:</b></label>
        				<label class="cabin">${requestScope.paciente.primerNombre}
        									 ${requestScope.paciente.segundoNombre}
        									 ${requestScope.paciente.primerApellido}
        									 ${requestScope.paciente.segundoApellido}</label>
        			</div>
        			<div class="fieldgroupTextArea">
        				<label class="cabin"><b>Recibo N�:</b></label>
        				<input type="text" id="numRecibo" name="numRecibo" value="${requestScope.sesionReportePracticante.numRecibo}">
        			</div>
        			<div class="fieldgroupTextArea">
        				<label class="cabin"><b>Profesional que atendi� la cita:</b></label>
        				<label class="cabin">${requestScope.sesionReportePracticante.nombreProfesional}</label>
        			</div>        		
        			<div class="fieldgroupTextArea">
        				<label class="cabin"><b>Estado del reporte:</b></label>
        				<label class="cabin">${requestScope.cita.estado}</label>
        			</div>     		
        		</fieldset>
        		<fieldset>
        			<div class="fieldgroupTextArea">
        				<label class="cabin"><b>Objetivo sesi�n:</b></label><br>
        				<p class="pReporte">${requestScope.sesionReportePracticante.objetivo}</p><br>
        				<input type="button" name="btnObjetivo" id="btnObjetivo" value="Actualizar" class="botones"/><br>
        				<input type="button" name="btnObjetivoCancel" id="btnObjetivoCancel" value="Cancelar" class="botones" hidden="true"/><br>
						<textarea id="campoObjetivo" name="campoObjetivo" class="marginTextArea sizeTextArea" hidden="true">${requestScope.sesionReportePracticante.objetivo}</textarea><br>
        			</div>
        		</fieldset>
        		<fieldset>
        				<label class="cabin"><b>Comentario sobre objetivo:</b></label><br>
        				<p class="pReporte">${requestScope.sesionReportePracticante.comentarios.comentariosObjetivo}</p><br>    		
        		</fieldset>
        		<fieldset>
        			<div class="fieldgroupTextArea">
        				<label class="cabin"><b>Descripci�n de sesi�n:</b></label><br>
        				<p class="pReporte">${requestScope.sesionReportePracticante.descripcion}</p><br>
        				<input type="button" name="btnDescripcion" id="btnDescripcion" value="Actualizar" class="botones"/><br>
        				<input type="button" name="btnDescripcionCancel" id="btnDescripcionCancel" value="Cancelar" class="botones" hidden="true"/><br>
						<textarea id="campoDescripcion" name="campoDescripcion" class="marginTextArea sizeTextArea" hidden="true">${requestScope.sesionReportePracticante.descripcion}</textarea><br>
        			</div>
        		</fieldset>
        		<fieldset>
        				<label class="cabin"><b>Comentario sobre descripci�n:</b></label><br>
        				<p class="pReporte">${requestScope.sesionReportePracticante.comentarios.comentariosDescripcion}</p><br>        		
        		</fieldset>        		
        		<fieldset>
        			<div class="fieldgroupTextArea">
        				<label class="cabin"><b>Tareas asignadas:</b></label>
        				<p class="pReporte">${requestScope.sesionReportePracticante.tareasAsignadas}</p>
        				<input type="button" name="btnTareas" id="btnTareas" value="Actualizar" class="botones"/><br>
        				<input type="button" name="btnTareasCancel" id="btnTareasCancel" value="Cancelar" class="botones" hidden="true"/><br>
						<textarea id="campoTareas" name="campoTareas" class="marginTextArea sizeTextArea" hidden="true">${requestScope.sesionReportePracticante.tareasAsignadas}</textarea><br>
        			</div>
        		</fieldset>
        		<fieldset>
        				<label class="cabin"><b>Comentario sobre tareas asignadas:</b></label><br>
        				<p class="pReporte">${requestScope.sesionReportePracticante.comentarios.comentariosTareas}</p><br>	
        		</fieldset>
        		<fieldset>
        			<div class="fieldgroupTextArea">
        				<label class="cabin"><b>Actividades pr�xima sesi�n:</b></label>
        				<p class="pReporte">${requestScope.sesionReportePracticante.actividadesProximaSesion}</p>
        				<input type="button" name="btnActividadesProx" id="btnActividadesProx" value="Actualizar" class="botones"/><br>
        				<input type="button" name="btnActividadesProxCancel" id="btnActividadesProxCancel" value="Cancelar" class="botones" hidden="true"/><br>
						<textarea id="campoActividades" name="campoActividades" class="marginTextArea sizeTextArea" hidden="true">${requestScope.sesionReportePracticante.actividadesProximaSesion}</textarea><br>
        			</div>
        		</fieldset>        		
        		<fieldset>
        				<label class="cabin"><b>Comentario sobre actividades pr�xima sesi�n:</b></label><br>
        				<p class="pReporte">${requestScope.sesionReportePracticante.comentarios.comentariosActividades}</p><br>       		
        		</fieldset>
        		<fieldset>	
        			<div class="fieldgroup">
        				<input type="submit" name="btnAceptar" id="btnAceptar" value="Guardar" class="botones"/>
        			</div>
        		</fieldset>        		        		
        	</form>
        </div>
        <div>
			<a href="VentanaPracticante.jsp"><button id="logoutBtn" class="btnReturn btnReturn-warning">Regresar</button></a>
		</div>
    </body>
</html>