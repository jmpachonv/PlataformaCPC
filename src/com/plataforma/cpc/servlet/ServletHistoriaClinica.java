package com.plataforma.cpc.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.plataforma.cpc.modelo.EpsBean;
import com.plataforma.cpc.modelo.HistoriaClinicaBean;
import com.plataforma.cpc.modelo.PersonaBean;
import com.plataforma.cpc.modelo.UtilBean;
import com.plataforma.cpc.to.CitaTo;
import com.plataforma.cpc.to.EpsTo;
import com.plataforma.cpc.to.PerfilTo;
import com.plataforma.cpc.to.PersonaTo;
import com.plataforma.cpc.to.SesionIndividualTo;
import com.plataforma.cpc.to.TipoDocumentoTo;
import com.plataforma.cpc.to.TratamientoTo;

/**
 * Servlet que se ocupa de la creaci�n y edici�n de personas mediante el formulario correspondiente
 */
@WebServlet(name="ServletHistoriaClinica", urlPatterns = {"/ServletHistoriaClinica"})
public class ServletHistoriaClinica extends HttpServlet {

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
		
		case "detalleTratamiento":
			detalleTratamiento(request,response);
			break;
		case "detalleCitas":
			detalleCitas(request,response);
			break;
		case "detalleSesion":
			detalleSesion(request,response);
			break;
		default:
			System.out.println("Opci�n no existe");
			break;
		
		}
	}
	
	private void detalleTratamiento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HistoriaClinicaBean historiaClinica = new HistoriaClinicaBean();
		PersonaBean personaBean = new PersonaBean();
		ArrayList<TratamientoTo> tratamientos = new ArrayList<TratamientoTo>();
		PersonaTo personaFiltro = new PersonaTo();
		PersonaTo paciente = new PersonaTo();

		Integer idPaciente = new Integer(request.getParameter("dPersona"));
		personaFiltro.setIdPersona(idPaciente);

		try {
			paciente = personaBean.consultarPersona(personaFiltro);
			tratamientos = historiaClinica.concultarTratamientosxPaciente(idPaciente);
			
			request.setAttribute("paciente", paciente);
			request.setAttribute("tratamientos", tratamientos);
			RequestDispatcher dispatcher = request.getRequestDispatcher("hcDetallePaciente.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			System.out.println("Error de formulario: " + e.getMessage());
			e.printStackTrace();
			request.setAttribute("respuesta", "2");
			request.setAttribute("error", e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("");
			dispatcher.forward(request, response);
		}	
	}
	
	@SuppressWarnings("unused")
	private void detalleCitas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HistoriaClinicaBean historiaClinica = new HistoriaClinicaBean();
		ArrayList<CitaTo> citas = new ArrayList<CitaTo>();
		
		Integer idPaciente = new Integer(request.getParameter("idPersona"));
		Integer idTratamiento = new Integer(request.getParameter("idTratamiento"));

		try {

			citas = historiaClinica.consultarCitasxTratamiento(idPaciente, idTratamiento);
			
			request.setAttribute("citas", citas);
			RequestDispatcher dispatcher = request.getRequestDispatcher("hcDetalleTratamiento.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			System.out.println("Error de formulario: " + e.getMessage());
			e.printStackTrace();
			request.setAttribute("respuesta", "2");
			request.setAttribute("error", e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("");
			dispatcher.forward(request, response);
		}	
	}
	
	@SuppressWarnings("unused")
	private void detalleSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HistoriaClinicaBean historiaClinica = new HistoriaClinicaBean();
		ArrayList<SesionIndividualTo> sesiones = new ArrayList<SesionIndividualTo>();
		
		Integer idCita = new Integer(request.getParameter("idCita"));

		try {

			sesiones = historiaClinica.consultarReportesSesion(idCita);
			
			request.setAttribute("sesiones", sesiones);
			RequestDispatcher dispatcher = request.getRequestDispatcher("hcDetalleCita.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			System.out.println("Error de formulario: " + e.getMessage());
			e.printStackTrace();
			request.setAttribute("respuesta", "2");
			request.setAttribute("error", e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("");
			dispatcher.forward(request, response);
		}	
	}
	

}