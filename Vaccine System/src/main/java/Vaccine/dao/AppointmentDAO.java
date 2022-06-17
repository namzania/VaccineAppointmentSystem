package Vaccine.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
//import java.util.*;

import Vaccine.connection.ConnectionManager;
import Vaccine.model.Appointment;
//import Vaccine.model.Patient;

public class AppointmentDAO 
{
	static Connection currentCon=null;
	static ResultSet rs=null;
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static String AppointmentID,AppointmentType,AppointmentDescription,AppointmentDate,AppointmentTime;
	static String PatientID,StaffID,VaccineID;
	
	public void addAppointment(Appointment appointment)
	{
		AppointmentType=appointment.getAppointmentType();
		AppointmentDescription=appointment.getAppointmentDescription();
		AppointmentDate=appointment.getAppointmentDate();
		AppointmentTime=appointment.getAppointmentTime();
		PatientID=appointment.getPatientID();
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("insert into appointment (appointmenttype,appointmentdate,appointmenttime,patientid,appointmentdescription) values(?,?,?,?,?)");
			ps.setString(1, AppointmentType);
			ps.setString(2, AppointmentDate);
			ps.setString(3, AppointmentTime);
			ps.setString(4, PatientID);
			ps.setString(5, AppointmentDescription);
			ps.executeUpdate();
			
			System.out.println("Appointment Type: "+AppointmentType);
			System.out.println("Appointment Description: "+AppointmentDescription);
			System.out.println("Appointment Date: "+AppointmentDate);
			System.out.println("Appointment Time: "+AppointmentTime);
			System.out.println("Patient ID: "+PatientID);
			
		}
		
		catch(Exception e)
		{
			System.out.println("Failed: An exception has occured! addAppointment "+e);
		}
		
		finally
		{
			if (ps!=null)
			{
				try
				{
					ps.close();
				}
				
				catch(Exception e) {}
				ps=null;
			}
			
			if(currentCon!=null)
			{
				try
				{
					currentCon.close();
				}
				
				catch(Exception e) {}
				currentCon=null;
			}
		}
	}

	public List<Appointment> getAllAppointment(String PatientID)
	{
		List<Appointment> appointments=new ArrayList<Appointment>();
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("Select * from appointment where patientid=?");
			ps.setString(1, PatientID);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				Appointment appointment=new Appointment();
				appointment.setAppointmentID(rs.getString("AppointmentID"));
				appointment.setAppointmentType(rs.getString("AppointmentType"));
				appointment.setAppointmentDescription(rs.getString("AppointmentDescription"));
				appointment.setAppointmentDate(rs.getString("AppointmentDate"));
				appointment.setAppointmentTime(rs.getString("AppointmentTime"));
				appointment.setPatientID(rs.getString("PatientID"));
				appointments.add(appointment);
				//System.out.println(appointments);
			}
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return appointments;
	}
	
	public List<Appointment> getAllAppointments()
	{
		List<Appointment> appointments=new ArrayList<Appointment>();
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			stmt=currentCon.createStatement();
			String query="Select * from appointment";
			ResultSet rs=stmt.executeQuery(query);
			
			while(rs.next())
			{
				Appointment appointment=new Appointment();
				appointment.setAppointmentID(rs.getString("AppointmentID"));
				appointment.setAppointmentType(rs.getString("AppointmentType"));
				appointment.setAppointmentDescription(rs.getString("AppointmentDescription"));
				appointment.setAppointmentDate(rs.getString("AppointmentDate"));
				appointment.setAppointmentTime(rs.getString("AppointmentTime"));
				appointment.setPatientID(rs.getString("PatientID"));
				appointments.add(appointment);
				//System.out.println(appointments);
			}
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return appointments;
	}

}
