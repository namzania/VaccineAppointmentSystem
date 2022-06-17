package Vaccine.model;

public class Staff 
{
	private String StaffID; //Change to string.
	private String StaffName;
	private String StaffEmail;
	private String StaffPassword;
	public boolean valid;

	public Staff()
	{
		super();
	}
	
	public Staff(String StaffID,String StaffName,String StaffEmail,String StaffPassword)
	{
		this.StaffID=StaffID;
		this.StaffName=StaffName;
		this.StaffEmail=StaffEmail;
		this.StaffPassword=StaffPassword;
	}
	
	public Staff(String StaffName,String StaffEmail,String StaffPassword) //Sign up
	{
		this.StaffName=StaffName;
		this.StaffEmail=StaffEmail;
		this.StaffPassword=StaffPassword;
	}
	
	public Staff(String StaffEmail,String StaffPassword) //Log in
	{
		this.StaffEmail=StaffEmail;
		this.StaffPassword=StaffPassword;
	}
	
	public String getStaffID() {return StaffID;}
	public String getStaffName() {return StaffName;}
	public String getStaffEmail() {return StaffEmail;}
	public String getStaffPassword() {return StaffPassword;}
	
	public void setStaffID(String StaffID) {this.StaffID=StaffID;}
	public void setStaffName(String StaffName) {this.StaffName=StaffName;}
	public void setStaffEmail(String StaffEmail) {this.StaffEmail=StaffEmail;}
	public void setStaffPassword(String StaffPassword) {this.StaffPassword=StaffPassword;}
	
	public boolean isValid() {return valid;}
	public void setValid(boolean valid) {this.valid=valid;}
	
	public String toString()
	{
		return ("\nStaff ID: "+getStaffID()+
				"\nStaff Name: "+getStaffName()+
				"\nStaff Email: "+getStaffEmail()+
				"\nStaff Password: "+getStaffPassword());
	}
	
	
}