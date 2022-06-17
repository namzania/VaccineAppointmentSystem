package Vaccine.dao;

import java.sql.*;
//import java.util.*;

import Vaccine.connection.ConnectionManager;
import Vaccine.model.Staff;

public class StaffDAO 
{
	static Connection currentCon=null;
	static ResultSet rs=null;
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static String StaffName,StaffEmail,StaffPassword;
	static String StaffID;
	
	public void addStaff(Staff staff)
	{
		StaffName=staff.getStaffName();
		StaffEmail=staff.getStaffEmail();
		StaffPassword=staff.getStaffPassword();
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("insert into staff (staffname,staffemail,staffpassword) values(?,?,?)");
			ps.setString(1,StaffName);
			ps.setString(2,StaffEmail);
			ps.setString(3,StaffPassword);
			ps.executeUpdate();
			
			System.out.println("Name: "+StaffName);
			System.out.println("Email:"+StaffEmail);
			System.out.println("Password: "+StaffPassword);
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
	
	public Staff getStaff(Staff staff)
	{
		StaffEmail=staff.getStaffEmail();
		String SearchQuery="Select * from staff where staffemail='"+StaffEmail+"'";
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			stmt=currentCon.createStatement();
			rs=stmt.executeQuery(SearchQuery);
			boolean more=rs.next();
			System.out.println(SearchQuery);
			
			if(more)
			{
				staff.setValid(true);
			}
			
			else if(!more)
			{
				staff.setValid(false);
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
		
		return staff;
	}

	public Staff validate(Staff staff)
	{
		StaffEmail=staff.getStaffEmail();
		StaffPassword=staff.getStaffPassword();
		String LoginQuery="Select * from staff where staffemail='"+StaffEmail+"'and staffpassword='"+StaffPassword+"'";
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			stmt=currentCon.createStatement();
			rs=stmt.executeQuery(LoginQuery);
			boolean more=rs.next();
			System.out.println(LoginQuery);
			
			if(more)
			{
				staff.setValid(true);
				staff.setStaffID(rs.getString("StaffID"));
				staff.setStaffName(rs.getString("StaffName")); 
			}
			
			else if(!more)
			{
				staff.setValid(false);
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
		
		return staff;
	}

	public Staff getStaffByID(String StaffID)
	{
		Staff staff=new Staff();
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("select * from staff where staffid=?");
			
			ps.setString(1,StaffID);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) 
			{
				staff.setStaffID(rs.getString("StaffID"));
				staff.setStaffName(rs.getString("StaffName"));
				staff.setStaffEmail(rs.getString("StaffEmail"));
				staff.setStaffPassword(rs.getString("StaffPassword"));
			}
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return staff;
	}

	public Staff UpdateProfile(Staff staff)
	{
		StaffID=staff.getStaffID();
		StaffName=staff.getStaffName();
		StaffEmail=staff.getStaffEmail();
		StaffPassword=staff.getStaffPassword();
		
		String UpdateQuery="UPDATE staff SET staffemail='"+StaffEmail+"',staffpassword='"+StaffPassword+"' WHERE staffid='"+StaffID+"'";
		
		try
		{
			currentCon=ConnectionManager.getConnection();
			stmt=currentCon.createStatement();
			stmt.executeUpdate(UpdateQuery);
			
			if(stmt!=null) 
			{
				System.out.println("Update");
				System.out.println("Staff ID: "+StaffID);
				System.out.println("Email: " +StaffEmail);
				System.out.println("Password: "+StaffPassword);
				
				staff.setValid(true);
				staff.setStaffID(StaffID);
				staff.setStaffName(StaffName);
				staff.setStaffEmail(StaffEmail);
				staff.setStaffPassword(StaffPassword);
			}
			
			else
			{
				staff.setValid(false);
			}
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return staff;
	}
}


