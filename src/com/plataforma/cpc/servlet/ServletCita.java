package com.plataforma.cpc.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.plataforma.cpc.dao.DaoCitas;
import com.plataforma.cpc.dao.DaoSesionIndividual;
import com.plataforma.cpc.modelo.PersonaBean;
import com.plataforma.cpc.to.CitaTo;
import com.plataforma.cpc.to.PersonaTo;
import com.plataforma.cpc.to.SesionIndividualTo;
import com.plataforma.cpc.to.TratamientoTo;
import com.plataforma.cpc.to.reporteValoracionTo;

/**
 * Atiende las llamadas para la creacion y administracion de citas por parte de administradores y practicantes
 * @author sebastian.gilp
 */
@WebServlet(name="ServletCita", urlPatterns = {"/ServletCita"})
public class ServletCita extends HttpServlet{

	//-----------------------------------------------------------------------------------------------------------------------------------------------------
	// Procesamiento del Request HTTP
	//-----------------------------------------------------------------------------------------------------------------------------------------------------

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String operacion = request.getParameter("operacion");

		switch (operacion) {

		case "cargueIncial":
			cargueInicial(request,response);
			break;
		case "crearCita":
			crearCita(request,response);
			break;
		case "guardarCita":
			guardarCita(request, response);
			break;
		case "eliminarCita":
			eliminarCita(request, response);
			break;
		case "ejecutarCita":
			ejecutarCita(request, response);
			break;
		case "cerrarTratamiento":
			cerrarTratamiento(request, response);
			break;
		case "verCita":
			try{
				Integer idCita = new Integer(request.getParameter("idCita"));
				RequestDispatcher dispatcher = request.getRequestDispatcher("./ServletHistoriaClinica?operacion=detalleSesion&grupoCita=" + idCita);
				dispatcher.forward(request, response);
			}catch(Exception e){
				System.out.println("Error de formulario: " + e.getMessage());
				e.printStackTrace();
				request.setAttribute("respuesta", "2");
				request.setAttribute("error", e.getMessage());
				RequestDispatcher dispatcher = request.getRequestDispatcher("");
				dispatcher.forward(request, response);
			}
			break;
		default:
			System.out.println("Opci�n no existe: " + operacion);
			break;	
		}
	}

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

	//-----------------------------------------------------------------------------------------------------------------------------------------------------
	// Funciones
	//-----------------------------------------------------------------------------------------------------------------------------------------------------

	/**
	 * Responde a la peticion para el menu de creacion de cita. Consulta y retorna todos los pracientes de un practicante en especifico
	 * Puede o no tener en el request una fecha ya establecida para la creaci�n de la cita
	 */
	private void crearCita(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PersonaBean personaBean = new PersonaBean();
		PersonaTo personaFiltro = new PersonaTo();
		PersonaTo practicante = new PersonaTo();

		Integer idPersona = new Integer(request.getParameter("idPracticante"));

		String fecha = parsearFecha(request.getParameter("fecha"));

		personaFiltro.setIdPersona(idPersona);			
		ArrayList<PersonaTo> listaPacientes = new ArrayList<PersonaTo>();

		try {
			practicante = personaBean.consultarPersona(personaFiltro);
			listaPacientes = personaBean.consultarAsignados(idPersona);


			request.setAttribute("practicante", practicante);
			request.setAttribute("listaPacientes", listaPacientes);
			request.setAttribute("fecha", fecha);

			request.setAttribute("paciente", request.getParameter("idPaciente"));	
			request.setAttribute("salon", request.getParameter("salon"));
			request.setAttribute("valoracion", request.getParameter("valoracion"));
			request.setAttribute("tipo", request.getParameter("tipo"));

			RequestDispatcher dispatcher = request.getRequestDispatcher("crearCita.jsp");
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

	private void cargueInicial(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PersonaBean persona = new PersonaBean();
		ArrayList<PersonaTo> practicantes = new ArrayList<PersonaTo>();

		try {
			practicantes = persona.consultarPracticantes();

			request.setAttribute("listaPracticantes", practicantes);

			RequestDispatcher dispatcher = request.getRequestDispatcher("citaPracticantes2.jsp");
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

	public void guardarCita(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		DaoCitas dao = new DaoCitas();
		CitaTo citaTo = new CitaTo();
		PersonaTo paciente = new PersonaTo();
		PersonaTo practicante = new PersonaTo();

		try{
			practicante.setIdPersona(Integer.parseInt(request.getParameter("idPracticante")));
			citaTo.setPracticante(practicante);
			paciente.setIdPersona(Integer.parseInt(request.getParameter("grupoPaciente")));
			citaTo.setPaciente(paciente);
			citaTo.setSalon(request.getParameter("salon"));
			LocalDateTime date = LocalDateTime.parse(request.getParameter("fecha"));
			citaTo.setFechaCita(date);
			String valoracion = request.getParameter("valoracion");
			String tipoTratamiento = request.getParameter("tipoTratamiento");
			String flagValoracion = request.getParameter("flagValoracion");

			ArrayList<TratamientoTo> tratamientos = dao.concultarTratamientosPaciente(paciente.getIdPersona());

			if(valoracion != null){
				if(flagValoracion.equals("valorar")){
					for(int i = 0; i < tratamientos.size(); i++){
						if(tratamientos.get(i).getTipo().equals(tipoTratamiento)){
							RequestDispatcher advertencia = request.getRequestDispatcher("advertenciaTratamiento.jsp");
							request.setAttribute("idPracticante", practicante.getIdPersona());
							request.setAttribute("idPaciente", paciente.getIdPersona());
							request.setAttribute("salon", citaTo.getSalon());
							request.setAttribute("valoracion", valoracion);
							request.setAttribute("fecha", request.getParameter("fecha"));
							request.setAttribute("tipoTratamiento", tipoTratamiento);
							advertencia.forward(request, response);
						}
					}
				}
				RequestDispatcher dispatcher = request.getRequestDispatcher("respuestaCrearCita.jsp");
				citaTo.setValoracion(true);
				TratamientoTo tratamiento = new TratamientoTo();
				tratamiento.setPaciente(paciente);
				tratamiento.setFechaInicio(date);
				tratamiento.setTipo(tipoTratamiento);
				int idTratamiento = dao.crearTratamiento(tratamiento);
				if(idTratamiento > 0){
					tratamiento.setIdTratamiento(idTratamiento);
					citaTo.setTratamiento(tratamiento);
					citaTo.setNumCita(0);
					if(dao.crearCita(citaTo))
						request.setAttribute("respuesta", "1");
					else{
						request.setAttribute("respuesta", "2");
						request.setAttribute("error", "No fue posible crear una nueva cita");
					}
				}
				else{
					request.setAttribute("respuesta", "2");
					request.setAttribute("error", "No fue posible crear el nuevo tratamiento");
				}
				dispatcher.forward(request, response);
			}
			else{
				RequestDispatcher dispatcher = request.getRequestDispatcher("respuestaCrearCita.jsp");
				if(request.getParameter("flag") != null){
					TratamientoTo tratamiento = new TratamientoTo();
					tratamiento = dao.consultarTratamiento(Integer.parseInt(request.getParameter("grupoTratamiento")));
					//if(!tratamiento.isPendiente()){
					citaTo.setTratamiento(tratamiento);
					citaTo.setNumCita(tratamiento.getNumCitaActual());
					if(dao.crearCita(citaTo))
						request.setAttribute("respuesta", "1");
					else{
						request.setAttribute("respuesta", "2");
						request.setAttribute("error", "No fue posible crear una nueva cita");
					}
					//}
					//else{
					//	request.setAttribute("respuesta", "2");
					//	request.setAttribute("error", "Hay un reporte pendiente de revisi�n en el tratamiento seleccionado");
					//}

					dispatcher.forward(request, response);
				}
				else{
					request.setAttribute("tratamientos", tratamientos);
					citaTo.setValoracion(false);
					request.setAttribute("cita", citaTo);
					dispatcher = request.getRequestDispatcher("verTratamientos.jsp");
					dispatcher.forward(request, response);
				}
			}		
		}
		catch(Exception e){
			e.printStackTrace();
			request.setAttribute("respuesta", "2");
			request.setAttribute("error", e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("respuestaCrearCita.jsp");
			dispatcher.forward(request, response);
		}
	}

	public void eliminarCita(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		DaoCitas daoCitas = new DaoCitas();
		DaoSesionIndividual daoReportes = new DaoSesionIndividual();
		CitaTo citaTo = new CitaTo();

		try{
			Integer idCita = Integer.parseInt(request.getParameter("idCita"));
			citaTo.setIdCita(idCita);
			citaTo = daoCitas.consultarCita(citaTo);
			TratamientoTo tratamiento = daoCitas.consultarTratamiento(citaTo.getTratamiento().getIdTratamiento());

			int numCitaActual = tratamiento.getNumCitaActual();
			int numCitaEliminar = citaTo.getNumCita();

			SesionIndividualTo reporte = daoReportes.consultarReporteSesionporCita(idCita);
			reporteValoracionTo valoracion = daoReportes.consultarValoracionporCita(idCita);

			if(reporte.getIdSesion() != null || valoracion.getIdValoracion() != null){
				request.setAttribute("mensajeRespuestaReporte", "La cita seleccionada tiene un reporte asociado. No es posible eliminarla");
				RequestDispatcher dispatcher = request.getRequestDispatcher("respuestaReporteCita.jsp");
				dispatcher.forward(request, response);
			}
			else{
				if(numCitaActual - numCitaEliminar == 1){

					if(daoCitas.eliminarCita(citaTo)){
						tratamiento = daoCitas.consultarTratamiento(citaTo.getTratamiento().getIdTratamiento());
						if(tratamiento.getNumCitaActual() <= 0) {
							if(!daoCitas.eliminarTratamiento(tratamiento)) {
								throw new Exception("No fue posible eliminar el tratamineto. Un tratamiento ha quedado vacio");
							}
						}
						RequestDispatcher dispatcher = request.getRequestDispatcher("./Calendario");
						dispatcher.forward(request, response);
					}
					else
						throw new Exception("No fue posible eliminar la cita");
				}
				else{
					request.setAttribute("mensajeRespuestaReporte", "Hay mas citas en el tratamiento despues de esta. No es posible eliminarla");
					RequestDispatcher dispatcher = request.getRequestDispatcher("respuestaReporteCita.jsp");
					dispatcher.forward(request, response);
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	public void ejecutarCita(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		DaoCitas daoCitas = new DaoCitas();
		CitaTo filtroCita = new CitaTo();
		CitaTo citaTo = new CitaTo();

		try{
			Integer idCita = Integer.parseInt(request.getParameter("idCita"));
			filtroCita.setIdCita(idCita);
			citaTo = daoCitas.consultarCita(filtroCita);

			if(citaTo.getIdCita() != null){
				RequestDispatcher dispatcher = null;
				if(citaTo.isValoracion())
					dispatcher = request.getRequestDispatcher("./reporteValoracion.jsp");
				else {
					TratamientoTo tratamiento = daoCitas.consultarTratamiento(citaTo.getTratamiento().getIdTratamiento());
					request.setAttribute("diagnostico", tratamiento.getDiagnostico());
					dispatcher = request.getRequestDispatcher("./reporteCita.jsp");
				}

				request.setAttribute("cita", citaTo);
				dispatcher.forward(request, response);
			}
			else
				throw new Exception("No se encontr� la cita especificada");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	private void cerrarTratamiento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		DaoCitas dao = new DaoCitas();
		RequestDispatcher dispatcher = request.getRequestDispatcher("respuestaCerrarTratamiento.jsp");
		try {
			int idTratamiento = Integer.parseInt(request.getParameter("idTratamiento"));
			int idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
			request.setAttribute("idPaciente", idPaciente);
			if(dao.CerrarTratamiento(idTratamiento)) {			
				request.setAttribute("mensaje", "Tratamiento cerrado exitosamente");		
			}
			else {
				request.setAttribute("mensaje", "Hubo un problema no identificado al cerrar el tratamiento");
			}
		}catch(Exception e) {
			request.setAttribute("mensaje", "Hubo un problema no al cerrar el tratamiento:\n " + e.getMessage());
		}

		dispatcher.forward(request, response);
	}

	private String parsearFecha(String fecha){
		if(fecha != null){
			String[] partes = fecha.split(" ");
			String retorno = partes[3] + "-" + parsearMes(partes[1]) + "-" + partes[2] + "T" + partes[4];
			return retorno;
		}

		return "";
	}

	private String parsearMes(String mes){
		String par = "err";

		switch (mes){
		case "Jan":
			par = "01";
			break;
		case "Feb":
			par = "02";
			break;
		case "Mar":
			par = "03";
			break;
		case "Apr":
			par = "04";
			break;
		case "May":
			par = "05";
			break;
		case "Jun":
			par = "06";
			break;
		case "Jul":
			par = "07";
			break;
		case "Aug":
			par = "08";
			break;
		case "Sep":
			par = "09";
			break;
		case "Oct":
			par = "10";
			break;
		case "Nov":
			par = "11";
			break;
		case "Dec":
			par = "12";
			break;
		default:
			break;
		}

		return par;
	}
}