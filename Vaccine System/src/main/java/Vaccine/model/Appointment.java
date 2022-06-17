package Vaccine.model;

public class Appointment 
{
	private String AppointmentID;
	private String AppointmentType;
	private String AppointmentDescription;
	private String AppointmentDate;
	private String AppointmentTime;
	public boolean valid;
	private String PatientID;
	private String StaffID;
	private String VaccineID;
	
	
	public Appointment()
	{
		super();
	}
	
	public Appointment(String AppointmentID,String AppointmentType,String AppointmentDate,String AppointmentTime,String PatientID,String StaffID,String VaccineID)
	{
		this.AppointmentID=AppointmentID;
		this.AppointmentType=AppointmentType;
		this.AppointmentDate=AppointmentDate;
		this.AppointmentTime=AppointmentTime;
		this.PatientID=PatientID;
		this.StaffID=StaffID;
		this.VaccineID=VaccineID;
	}
	
	public Appointment(String AppointmentType,String AppointmentDescription,String AppointmentDate,String AppointmentTime, String PatientID)
	{
		this.AppointmentType=AppointmentType;
		this.AppointmentDescription=AppointmentDescription;
		this.AppointmentDate=AppointmentDate;
		this.AppointmentTime=AppointmentTime;
		this.PatientID=PatientID;
	}
	
	public String getAppointmentID(){return AppointmentID;}
	public String getAppointmentType(){return AppointmentType;}
	public String getAppointmentDescription(){return AppointmentDescription;}
	public String getAppointmentDate(){return AppointmentDate;}
	public String getAppointmentTime(){return AppointmentTime;}
	public String getPatientID(){return PatientID;}
	public String getStaffID(){return StaffID;}
	public String getVaccineID(){return VaccineID;}
	
	public void setAppointmentID(String AppointmentID) {this.AppointmentID=AppointmentID;}
	public void setAppointmentType(String AppointmentType) {this.AppointmentType=AppointmentType;}
	public void setAppointmentDescription(String AppointmentDescription) {this.AppointmentDescription=AppointmentDescription;}
	public void setAppointmentDate(String AppointmentDate) {this.AppointmentDate=AppointmentDate;}
	public void setAppointmentTime(String AppointmentTime) {this.AppointmentTime=AppointmentTime;}
	//public void setAppointmentStatus(String AppointmentStatus) {this.AppointmentStatus=AppointmentStatus;}
	public void setPatientID(String PatientID) {this.PatientID=PatientID;}
	public void setStaffID(String StaffID) {this.StaffID=StaffID;}
	public void setVaccineID(String VaccineID) {this.VaccineID=VaccineID;}
	
	public boolean isValid() {return valid;}
	public void setValid(boolean valid) {this.valid=valid;}
	
	public String toString()
	{
		return("\nAppointment ID: "+getAppointmentID()+
				"\nAppointment Type: "+getAppointmentType()+
				"\nAppointment Date: "+getAppointmentDate());
	}
}
