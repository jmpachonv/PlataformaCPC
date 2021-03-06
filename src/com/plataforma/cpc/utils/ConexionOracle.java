package com.plataforma.cpc.utils;

import java.sql.Clob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import com.plataforma.cpc.interfaces.Conexion;
import oracle.jdbc.driver.OracleDriver;

/**
 *
 * @author HARLIN
 */
public class ConexionOracle implements Conexion {

	private final String usuario = Propiedades.getInstance().valorPropiedad("USUARIO");
	private final String password = Propiedades.getInstance().valorPropiedad("PASSWORD");
	private final String sid = Propiedades.getInstance().valorPropiedad("SID");
	private final String host = Propiedades.getInstance().valorPropiedad("HOST");
	private final String puerto = Propiedades.getInstance().valorPropiedad("PUERTO");
	

//	private final String usuario = "CPC_DB";
//	private final String password = "CPC2017KL";
//	private final String sid = "test";
//	private final String host = "192.168.98.12";
//
////	private final String usuario = "cpcdb";
////	private final String password = "1234";
////	private final String sid = "xe";
////	private final String host = "localhost";

//	private final String puerto = "1521";
	
	private Connection connection;
	private PreparedStatement sentenciaActual;

	public Connection getConexion() {
		return connection;
	}

	public void registrarDriver() throws SQLException {
		OracleDriver oracleDriver = new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(oracleDriver);
	}

	public void conectar() throws SQLException {
		if (connection == null || connection.isClosed() == true) {
			String cadenaCoenexion = "jdbc:oracle:thin:@"
					+ host + ":"
					+ puerto + ":"
					+ sid;
			registrarDriver();
			connection = DriverManager.getConnection(cadenaCoenexion, usuario, password);

		}
	}

	public void prepararSentencia(String sentencia, String generarColumna[]) throws Exception {
		sentenciaActual = this.connection.prepareStatement(sentencia, generarColumna);
	}

	public void prepararSentencia(String sentencia) throws Exception {
		sentenciaActual = this.connection.prepareStatement(sentencia);
	}

	public void agregarAtributo(int numAtributo, String atributo) throws Exception {
		sentenciaActual.setString(numAtributo, atributo);
	}

	public void agregarAtributo(int numAtributo, int atributo) throws Exception {
		sentenciaActual.setInt(numAtributo, atributo);
	}

	public void agregarAtributo(int numAtributo, LocalDateTime atributo) throws Exception{
		Timestamp timestamp = Timestamp.valueOf(atributo);
		sentenciaActual.setTimestamp(numAtributo, timestamp);
	}

	@Override
	public void agregarAtributo(int numAtributo, Long atributo) throws SQLException {
		sentenciaActual.setLong(numAtributo, atributo);	
	}
	
	@Override
	public void agregarAtributo(int numAtributo, Clob atributo) throws SQLException {
		sentenciaActual.setClob(numAtributo, atributo);	
	}

	public ResultSet ejecutarSentencia() throws Exception {
		if(sentenciaActual != null){
			return sentenciaActual.executeQuery();
		}
		else
			throw new Exception("No se ha preparado previamente una sentencia SQL");
	}

	public void ejecutarActualizacion() throws Exception {
		if(sentenciaActual != null){
			sentenciaActual.executeUpdate();
		}
		else
			throw new Exception("No se ha preparado previamente una sentencia SQL");
	}

	public int recuperarLlavePrimaria() throws SQLException{
		ResultSet generatedKeys = sentenciaActual.getGeneratedKeys();
		if (generatedKeys.next()) {
			int primaryKey = generatedKeys.getInt(1);
			return primaryKey;
		}
		return -1;
	}

	public void cerrar() throws SQLException {
		if (connection != null && connection.isClosed() == false) {
			sentenciaActual.close();
			sentenciaActual = null;
			connection.close();
		}
	}

	public void iniciarTransaccion() throws SQLException{
		if (connection != null && connection.isClosed() == false) {
			connection.setAutoCommit(false);
		}
	}

	public void commit() throws SQLException {
		if (connection != null && connection.isClosed() == false) {
			connection.commit();
		}
	}

	public void rollback() throws SQLException{
		if (connection != null && connection.isClosed() == false) {
			connection.rollback();
		}
	}
	
	public Clob crearClob() throws SQLException{
		if (connection != null && connection.isClosed() == false) {
			return connection.createClob();
		}
		
		return null;
	}

	public void cerrarTransaccion() throws Exception{
		if (connection != null && connection.isClosed() == false) {
			connection.setAutoCommit(true);
		}
	}

	@Override
	public PreparedStatement recuperarSentencia() throws Exception {
		// TODO Auto-generated method stub
		return this.sentenciaActual;
	}
}