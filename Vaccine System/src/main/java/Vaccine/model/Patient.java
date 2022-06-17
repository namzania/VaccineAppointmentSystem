package Vaccine.model;

public class Patient 
{
	private String PatientID;
	private String PatientName;
	private String PatientPhone;
	private String PatientEmail;
	private String PatientPassword;
	private String PatientAddress;
	private String PatientGender;
	private String PatientAge;
	public boolean valid;
	
	public Patient()
	{
		super();
	}
	
	public Patient(String PatientID,String PatientName,String PatientPhone,String PatientEmail,String PatientPassword,String PatientAddress,String PatientGender,String PatientAge)
	{
		this.PatientID=PatientID;
		this.PatientName=PatientName;
		this.PatientPhone=PatientPhone;
		this.PatientEmail=PatientEmail;
		this.PatientPassword=PatientPassword;
		this.PatientAddress=PatientAddress;
		this.PatientGender=PatientGender;
		this.PatientAge=PatientAge;
	}
	
	public Patient(String PatientID,String PatientPhone,String PatientEmail,String PatientPassword,String PatientAddress,String PatientAge)
	{
		this.PatientID=PatientID;
		this.PatientPhone=PatientPhone;
		this.PatientEmail=PatientEmail;
		this.PatientPassword=PatientPassword;
		this.PatientAddress=PatientAddress;
		this.PatientAge=PatientAge;
	}
	
	
	public Patient(String PatientName,String PatientPhone,String PatientEmail,String PatientPassword,String PatientAddress,String PatientGender,String PatientAge)
	{
		this.PatientName=PatientName;
		this.PatientPhone=PatientPhone;
		this.PatientEmail=PatientEmail;
		this.PatientPassword=PatientPassword;
		this.PatientAddress=PatientAddress;
		this.PatientGender=PatientGender;
		this.PatientAge=PatientAge;
	}
	
	public String getPatientID() {return PatientID;}
	public String getPatientName() {return PatientName;}
	public String getPatientPhone() {return PatientPhone;}
	public String getPatientEmail() {return PatientEmail;}
	public String getPatientPassword() {return PatientPassword;}
	public String getPatientAddress() {return PatientAddress;}
	public String getPatientGender() {return PatientGender;}
	public String getPatientAge() {return PatientAge;}
	
	public void setPatientID(String PatientID) {this.PatientID=PatientID;}
	public void setPatientName(String PatientName) {this.PatientName=PatientName;}
	public void setPatientPhone(String PatientPhone) {this.PatientPhone=PatientPhone;}
	public void setPatientEmail(String PatientEmail) {this.PatientEmail=PatientEmail;}
	public void setPatientPassword(String PatientPassword) {this.PatientPassword=PatientPassword;}
	public void setPatientAddress(String PatientAddress) {this.PatientAddress=PatientAddress;}
	public void setPatientGender(String PatientGender) {this.PatientGender=PatientGender;}
	public void setPatientAge(String PatientAge) {this.PatientAge=PatientAge;}
	
	public boolean isValid() {return valid;}
	public void setValid(boolean valid) {this.valid=valid;}
	
	public String toString()
	{
		return ("\nPatient ID: "+getPatientID()+
				"\nPatient Name: "+getPatientName()+
				"\nPhone Number: "+getPatientPhone()+
				"\nPatient Email: "+getPatientEmail()+
				"\nPatient Password: "+getPatientPassword()+
				"\nPatient Address: "+getPatientAddress()+
				"\nPatient Gender: "+getPatientGender()+
				"\nPatient Age: "+getPatientAge());
	}
}
