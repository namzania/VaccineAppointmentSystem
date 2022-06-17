package Vaccine.model;

//import java.util.ArrayList;
import java.util.List;

public class Vaccine 
{
	private String VaccineID;
	private String VaccineName;
	private String VaccineDescription;
	private List<Vaccine> vaccines;
	public boolean valid;
	private String StaffID;
	
	public Vaccine()
	{
		super();
	}
	
	/**public Vaccine (String VaccineID,String VaccineName,String VaccineDescription)
	{
		this.VaccineID=VaccineID;
		this.VaccineName=VaccineName;
		this.VaccineDescription=VaccineDescription;
	}*/
	
	public Vaccine (String VaccineName,String VaccineDescription,String StaffID)
	{
		this.VaccineName=VaccineName;
		this.VaccineDescription=VaccineDescription;
		this.StaffID=StaffID;
	}
	
	public String getVaccineID() {return VaccineID;}
	public String getVaccineName() {return VaccineName;}
	public String getVaccineDescription() {return VaccineDescription;}
	public List<Vaccine> getVaccines() {return vaccines;}
	public String getStaffID() {return StaffID;}
	
	public void setVaccineID(String VaccineID) {this.VaccineID=VaccineID;}
	public void setVaccineName(String VaccineName) {this.VaccineName=VaccineName;}
	public void setVaccineDescription(String VaccineDescription) {this.VaccineDescription=VaccineDescription;}
	public void setVaccines(List<Vaccine> vaccines) {this.vaccines=vaccines;}
	public void setStaffID(String StaffID) {this.StaffID=StaffID;}
	
	public boolean isValid() {return valid;}
	public void setValid(boolean valid) {this.valid=valid;}
	
	public String toString()
	{
		return ("\nVaccine Name: "+getVaccineName()+
				"\nVaccine Description: "+getVaccineDescription()+
				"\nStaff ID: "+getStaffID());
	}
	

}
