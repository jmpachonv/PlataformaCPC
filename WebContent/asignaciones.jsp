<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="estiloAsignaciones.css"></link>
        <script type="text/javascript" src="js/manejarAsignacion.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asignar</title>
    </head>
    <body>
    	<!--MEMU SUPERIOR--> 
         <%@include file="./menuNavegacion.jsp" %>
         <!--MEMU LATERAL--> 
        <%@include file="./menuLateral.jsp" %>
        <div id="marcoGeneral" class="cajaVentanaAsignacion">
            <p>${requestScope.pNom} ${requestScope.sNom} ${requestScope.pApe} ${requestScope.sApe}----------Cupos: ${requestScope.cupos}</p>
            <table>
                <tr>
                    <td><div id="marcoAsignados" class="cajaTablas">
                        <table><c:forEach items="${requestScope.asignados}" var="asignado">
                        	<tr>
                            	<td>${asignado.primerNombre} ${asignado.segundoNombre} ${asignado.primerApellido} ${asignado.segundoApellido}</td>
                            	<td><input type="button" id="btnEliminar" value="-"
                            	onclick="manejarAsignacion('eliminar',${asignado.idPersona},${requestScope.id},'${requestScope.pNom}','${requestScope.sNom}', '${requestScope.pApe}', '${requestScope.sApe}', '${requestScope.valor}')"></td>
                        	</tr>
                        </c:forEach>
                        </table></div></td>
                    <td><div id="marcoCandidatos" class="cajaTablas">
                        <table><c:forEach items="${requestScope.posibilidades}" var="posible">
                        	<tr>
                            	<td>${posible.primerNombre} ${posible.segundoNombre} ${posible.primerApellido} ${posible.segundoApellido}</td>
                            	<td><input type="button" id="btnAsignar" value="+"
                            	onclick="manejarAsignacion('asignar',${posible.idPersona},${requestScope.id},'${requestScope.pNom}','${requestScope.sNom}', '${requestScope.pApe}', '${requestScope.sApe}', '${requestScope.valor}')"></td>
                        	</tr>
                        </c:forEach>
                        </table></div></td>
                </tr>
            </table>          
        </div>
        <form name="data" action="./ServletAsignaciones" method="post">
    		<input type="hidden" name="operacion">
    		<input type="hidden" name="asignado">
    		<input type="hidden" name="id">
    		<input type="hidden" name="pNom">
    		<input type="hidden" name="sNom">
    		<input type="hidden" name="pApe">
    		<input type="hidden" name="sApe">
    		<input type="hidden" name="rol">
	   </form>
     </body>  
</html>