package com.plataforma.cpc.modelo;

import java.util.ArrayList;

import com.plataforma.cpc.dao.DaoCitas;
import com.plataforma.cpc.dao.DaoPersona;
import com.plataforma.cpc.dao.DaoSesionIndividual;
import com.plataforma.cpc.to.CitaTo;
import com.plataforma.cpc.to.HistoriaClinicaTo;
import com.plataforma.cpc.to.PersonaTo;
import com.plataforma.cpc.to.SesionIndividualTo;
import com.plataforma.cpc.to.TratamientoTo;
import com.plataforma.cpc.to.reporteValoracionTo;

/**
 * Clase que aglomera diferentes funciones para consultar la informacion de historia clinica de un paciente
 */
public class HistoriaClinicaBean {
	//--------------------------------------------------------------------------------------------------
	// Funciones
	//--------------------------------------------------------------------------------------------------
	
	/**
	 * Consulta todos los tratamientos asociados a un paciente en particular
	 * @param idPaciente Paciente que se desea consultar
	 * @return Lista de TratamientoTo con la informacion encontrada. Lista vacia de lo contrario
	 */
	public ArrayList<TratamientoTo> consultarTratamientosxPaciente (Integer idPaciente){		
		DaoCitas dao = new DaoCitas();
		ArrayList<TratamientoTo> tratamientos = new ArrayList<TratamientoTo>();
		tratamientos = dao.concultarTratamientosPaciente(idPaciente);
		return tratamientos;
	}
	
	
	public ArrayList<CitaTo> consultarCitasxTratamiento(Integer idPaciente, Integer idTratamiento){
		ArrayList<CitaTo> citas = new ArrayList<CitaTo>();
		DaoCitas dao = new DaoCitas();
		DaoPersona daoPersona = new DaoPersona();
		citas = dao.consultarCitasPacienteTratamiento(idPaciente, idTratamiento);
		
		for (CitaTo cita : citas){
			//Se consulta el detalle del paciente
			PersonaTo pacienteFiltro = new PersonaTo();
			pacienteFiltro.setIdPersona(cita.getPaciente().getIdPersona());
			cita.setPaciente(daoPersona.consultarPersona(pacienteFiltro));
			//Se consulta el detalle del practicante
			PersonaTo practicanteFiltro = new PersonaTo();
			practicanteFiltro.setIdPersona(cita.getPracticante().getIdPersona());
			cita.setPracticante(daoPersona.consultarPersona(practicanteFiltro));
		}		
		return citas;
	}
	
	public TratamientoTo consultarTratamiento(Integer idTratamiento){
		DaoCitas dao = new DaoCitas();
		TratamientoTo tratamiento = new TratamientoTo();
		tratamiento = dao.consultarTratamiento(idTratamiento);	
		return tratamiento;
	}
		
	public SesionIndividualTo consultarReportesSesion(Integer idCita){
		DaoSesionIndividual dao = new DaoSesionIndividual();
		return dao.consultarReporteSesionporCita(idCita);
	}
	
	public reporteValoracionTo consultarReportesValoracion(Integer idCita){
		DaoSesionIndividual dao = new DaoSesionIndividual();
		return dao.consultarValoracionporCita(idCita);
	}
	
	public CitaTo consultarCita(CitaTo cita){
		CitaTo citaTo = new CitaTo();
		DaoCitas dao = new DaoCitas();
		citaTo = dao.consultarCita(cita);
		return citaTo;
	}
	
	public boolean crearHistoriaClinica(HistoriaClinicaTo historia){
		DaoPersona dao = new DaoPersona();
		return dao.CrearHistoriaClinica(historia);
	}
	
	public HistoriaClinicaTo consultarHistoriaClinica(int idPaciente){
		DaoPersona dao = new DaoPersona();
		return dao.consultarHistoriaClinica(idPaciente);
	}
}