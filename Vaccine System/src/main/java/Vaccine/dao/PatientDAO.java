package Vaccine.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
//import java.util.*;

import Vaccine.connection.ConnectionManager;
import Vaccine.model.Patient;

public class PatientDAO 
{
	static Connection currentCon=null;
	static ResultSet rs=null;
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static String PatientName,PatientPhone,PatientEmail,PatientPassword,PatientAddress,PatientGender,PatientAge,PatientID;
	
	public void addPatient(Patient patient)
	{
		PatientName=patient.getPatientName();
		PatientPhone=patient.getPatientPhone();
		PatientEmail=patient.getPatientEmail();
		PatientPassword=patient.getPatientPassword();
		PatientAddress=patient.getPatientAddress();
		PatientGender=patient.getPatientGender();
		PatientAge=patient.getPatientAge();
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("insert into patient (patientname,patientphone,patientemail,patientpassword,patientaddress,patientgender,patientage) values(?,?,?,?,?,?,?)");
			ps.setString(1,PatientName);
			ps.setString(2,PatientPhone);
			ps.setString(3,PatientEmail);
			ps.setString(4,PatientPassword);
			ps.setString(5,PatientAddress);
			ps.setString(6,PatientGender);
			ps.setString(7,PatientAge);
			ps.executeUpdate();
			
			System.out.println("Name: "+PatientName);
			System.out.println("Phone: "+PatientPhone);
			System.out.println("Email: "+PatientEmail);
			System.out.println("Password: "+PatientPassword);
			System.out.println("Address: "+PatientAddress);
			System.out.println("Gender: "+PatientGender);
			System.out.println("Age: "+PatientAge);
		}
		
		catch(Exception e)
		{
			System.out.println("Failed: An exception has occured!"+e);
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
	
	public Patient getPatient(Patient patient)
	{
		PatientEmail=patient.getPatientEmail();
		String SearchQuery="Select * from patient where patientemail='"+PatientEmail+"'";
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			stmt=currentCon.createStatement();
			rs=stmt.executeQuery(SearchQuery);
			boolean more=rs.next();
			System.out.println(SearchQuery);
			
			if(more)
			{
				patient.setValid(true);
			}
			
			else if(!more)
			{
				patient.setValid(false);
			}
		}
		
		catch(Exception e)
		{
			System.out.println("Sign up failed: An exception has occured!"+e);
		}
		
		finally
		{
			if(rs!=null)
			{
				try
				{
					rs.close();
				}
				
				catch(Exception e) {}
				rs=null;
			}
			
			if(stmt!=null)
			{
				try
				{
					stmt.close();
				}
				
				catch(Exception e) {}
				stmt=null;
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
		
		return patient;
	}

	public Patient validate(Patient patient)
	{
		PatientEmail=patient.getPatientEmail();
		PatientPassword=patient.getPatientPassword();
		String LoginQuery="Select * from patient where patientemail='"+PatientEmail+"'and patientpassword='"+PatientPassword+"'";
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			stmt=currentCon.createStatement();
			rs=stmt.executeQuery(LoginQuery);
			boolean more=rs.next();
			System.out.println(LoginQuery);
			
			if(more)
			{
				patient.setValid(true);
				patient.setPatientID(rs.getString("PatientID"));
				patient.setPatientName(rs.getString("PatientName")); 
				patient.setPatientPhone(rs.getString("PatientPhone"));
				patient.setPatientAddress(rs.getString("PatientAddress"));
				patient.setPatientGender(rs.getString("PatientGender"));
				patient.setPatientAge(rs.getString("PatientAge"));
			}
			
			else if(!more)
			{
				patient.setValid(false);
			}
			
		}
		
		catch(Exception e)
		{
			System.out.println("Log in failed! An exception has occured!"+e);
		}
		
		finally
		{
			if(rs!=null)
			{
				try
				{
					rs.close();
				}
				
				catch(Exception e) {}
				rs=null;
			}
			
			if(stmt!=null)
			{
				try
				{
					stmt.close();
				}
				
				catch(Exception e) {}
				stmt=null;
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
		
		return patient;
	}

	public Patient UpdateProfile(Patient patient)
	{
		PatientID=patient.getPatientID();
		PatientPhone=patient.getPatientPhone();
		PatientEmail=patient.getPatientEmail();
		PatientPassword=patient.getPatientPassword();
		PatientAddress=patient.getPatientAddress();
		PatientAge=patient.getPatientAge();
		PatientGender=patient.getPatientGender();
		PatientName=patient.getPatientName();
		
		String UpdateQuery="UPDATE patient SET patientphone='"+PatientPhone+"',patientemail='"+PatientEmail+"',patientpassword='"+PatientPassword+"',patientaddress='"+PatientAddress+"',patientage='"+PatientAge+"' WHERE patientid='"+PatientID+"'";
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			stmt=currentCon.createStatement();
			stmt.executeUpdate(UpdateQuery);
			
			if(stmt!=null) 
			{
				System.out.println("Update");
				System.out.println("Patient ID: "+PatientID);
				System.out.println("Phone: " +PatientPhone);
				System.out.println("Email: " +PatientEmail);
				System.out.println("Password: "+PatientPassword);
				System.out.println("Address: "+PatientAddress);
				System.out.println("Age: "+PatientAge);
				
				patient.setValid(true);
				patient.setPatientPhone(PatientPhone);
				patient.setPatientEmail(PatientEmail);
				patient.setPatientPassword(PatientPassword);
				patient.setPatientAddress(PatientAddress);
				patient.setPatientAge(PatientAge);
				patient.setPatientID(PatientID);
				patient.setPatientName(PatientName);
			}
			
			else
			{
				patient.setValid(false);
			}
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return patient;
	}

	public Patient getPatientByID(String PatientID) 
	{
		Patient patient=new Patient();
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("select * from patient where patientid=?");
			
			ps.setString(1,PatientID);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) 
			{
				patient.setPatientID(rs.getString("PatientID"));
				patient.setPatientName(rs.getString("PatientName"));
				patient.setPatientPhone(rs.getString("PatientPhone"));
				patient.setPatientEmail(rs.getString("PatientEmail"));
				patient.setPatientPassword(rs.getString("PatientPassword"));
				patient.setPatientAddress(rs.getString("PatientAddress"));
				patient.setPatientGender(rs.getString("PatientGender"));
				patient.setPatientAge(rs.getString("PatientAge"));
			}
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return patient;
	}
	
	public List<Patient> getAllPatient()
	{
		List<Patient> patients=new ArrayList<Patient>();
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			stmt=currentCon.createStatement();
			String query="Select * from patient";
			ResultSet rs=stmt.executeQuery(query);
			
			while(rs.next())
			{
				Patient patient=new Patient();
				patient.setPatientID(rs.getString("PatientID"));
				patient.setPatientName(rs.getString("PatientName"));
				patient.setPatientPhone(rs.getString("PatientPhone"));
				patient.setPatientEmail(rs.getString("PatientEmail"));
				patient.setPatientName(rs.getString("PatientName"));
				patient.setPatientAddress(rs.getString("PatientAddress"));
				patient.setPatientGender(rs.getString("PatientGender"));
				patient.setPatientAge(rs.getString("PatientAge"));
				patients.add(patient);
				//System.out.println(patients);
			}
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return patients;
	}


}
