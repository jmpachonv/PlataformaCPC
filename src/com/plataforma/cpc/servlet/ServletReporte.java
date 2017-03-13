package com.plataforma.cpc.servlet;


import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.plataforma.cpc.utils.Reporte;



/**
 * Servlet que se ocupa de la creaci�n y edici�n de personas mediante el formulario correspondiente
 */
@WebServlet(name="ServletReporte", urlPatterns = {"/ServletReporte"})
public class ServletReporte extends HttpServlet {

//-----------------------------------------------------------------------------------------------------
// Proceso de la peticion
//-----------------------------------------------------------------------------------------------------
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String operacion = request.getParameter("operacion");
		System.out.println("Operacion: "+operacion);
		switch (operacion) {
		
		case "usuarios":
			reporteJasper(request,response,"ripsUsuario");
			break;
		case "transacciones":
			reporteJasper(request,response,"ripsTransaccion");
			break;
		case "consulta":
			reporteJasper(request,response,"ripsConsulta");
			break;
		case "procedimiento":
			reporteJasper(request,response,"ripsProcedimiento");
			break;	
		default:
			System.out.println("Opci�n no existe");
			break;
		
		}
	}
	
	private void reporteJasper(HttpServletRequest request, HttpServletResponse response,String nombreReporte){
		response.setContentType("application/vnd.ms-excel");
		String nombreArchivo = "attachment; filename="+nombreReporte+".xls";
		response.setHeader("Content-disposition",nombreArchivo);
		byte[] buffer = null;
		String rutaReportes = getServletContext().getRealPath("index.jsp").replace("index.jsp", "resources/reportes");
		Reporte reporte = new Reporte(rutaReportes);
		
		Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("ID_PERFIL",new Integer(1));
		
		try {
			 buffer = reporte.reporte(nombreReporte, parametros);
			 OutputStream out = response.getOutputStream();
		     out.write(buffer, 0, buffer.length);        
		     out.flush();		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}