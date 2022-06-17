package Vaccine.dao;

//import java.io.IOException;
import java.sql.*;
//import java.util.*;
import java.util.ArrayList;
import java.util.List;

import Vaccine.connection.ConnectionManager;
import Vaccine.model.Vaccine;


public class VaccineDAO 
{
	static Connection currentCon=null;
	static ResultSet rs=null;
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static String VaccineName,VaccineDescription,StaffID;
	
	public Vaccine addVaccine(Vaccine vaccine)
	{
		VaccineName=vaccine.getVaccineName();
		VaccineDescription=vaccine.getVaccineDescription();
		StaffID=vaccine.getStaffID();
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("insert into vaccine (vaccinename,vaccinedescription,staffid) values(?,?,?)");
			ps.setString(1,VaccineName);
			ps.setString(2,VaccineDescription);
			ps.setString(3,StaffID);
			ps.executeUpdate();
			
			System.out.println("Vaccine Name: "+VaccineName);
			System.out.println("Vaccine Description: "+VaccineDescription);
			System.out.println("Staff ID: "+StaffID);
		}
		
		catch(Exception e)
		{
			System.out.println("Failed: An exception has occured! addVaccine() "+e);
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
		
		return vaccine;
	}
	
	public Vaccine getVaccine(Vaccine vaccine)
	{
		VaccineName=vaccine.getVaccineName();
		String SearchQuery="Select * from vaccine where vaccinename='"+VaccineName+"'";
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			stmt=currentCon.createStatement();
			rs=stmt.executeQuery(SearchQuery);
			boolean more=rs.next();
			System.out.println(SearchQuery);
			
			if(more)
			{
				vaccine.setValid(true);
			}
			
			else if(!more)
			{
				vaccine.setValid(false);
			}
		}
		
		catch(Exception e)
		{
			System.out.println("Failed: An exception has occured! getVaccine() "+e);
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
		
		return vaccine;
	}
	
	public List<Vaccine> getAllVaccine()
	{
		List<Vaccine> vaccines=new ArrayList<Vaccine>();
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			stmt=currentCon.createStatement();
			String query="Select * from vaccine";
			ResultSet rs=stmt.executeQuery(query);
			
			while(rs.next())
			{
				Vaccine vaccine=new Vaccine();
				vaccine.setVaccineID(rs.getString("VaccineID"));
				vaccine.setVaccineName(rs.getString("VaccineName"));
				vaccine.setVaccineDescription(rs.getString("VaccineDescription"));
				vaccine.setStaffID(rs.getString("StaffID"));
				vaccines.add(vaccine);
				//System.out.println(vaccines);
			}
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return vaccines;
	}
	
	public Vaccine getVaccineByID(String VaccineID)
	{
		Vaccine vaccine=new Vaccine();
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("select * from vaccine where vaccineid=?");
			
			ps.setString(1,VaccineID);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				vaccine.setVaccineID(rs.getString("VaccineID"));
				vaccine.setVaccineName(rs.getString("VaccineName"));
				vaccine.setVaccineDescription(rs.getString("VaccineDescription"));
				vaccine.setStaffID(rs.getString("StaffID"));
			}
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return vaccine;
	}

	public void deleteVaccine(String VaccineID)
	{
		String SearchQuery="delete from vaccine where vaccineid='"+VaccineID+"'";
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			stmt=currentCon.createStatement();
			stmt.executeUpdate(SearchQuery);
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
}
