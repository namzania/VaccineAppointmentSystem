package Vaccine.controller;

import java.io.IOException;
//import java.util.*;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import Vaccine.dao.AppointmentDAO;
//import Vaccine.dao.PatientDAO;
import Vaccine.dao.VaccineDAO;
//import Vaccine.model.Patient;
import Vaccine.model.Vaccine;
import Vaccine.model.Appointment;



@WebServlet("/AppointmentController")
public class AppointmentController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	private AppointmentDAO daoAppointment;
	//private PatientDAO daoPatient;
	private VaccineDAO daoVaccine;
	//private StaffDAO daoStaff;
	String forward="";
	
  
    public AppointmentController() 
    {
        super();
        daoAppointment=new AppointmentDAO();
        //daoPatient=new PatientDAO();
        daoVaccine=new VaccineDAO();
        //daoStaff=new StaffDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("bookAppointment"))
		{
			String VaccineID=request.getParameter("VaccineID");
			System.out.println(VaccineID);
			Vaccine vaccine=new Vaccine();
			vaccine=daoVaccine.getVaccineByID(VaccineID);
			forward="BookAppointment.jsp";
			request.setAttribute("vaccine",vaccine);
		}
		
		else if(action.equalsIgnoreCase("listAppointment"))
		{
			String PatientID=request.getParameter("PatientID");
			forward="ViewAppointmentPatient.jsp";
			request.setAttribute("appointments",daoAppointment.getAllAppointment(PatientID));
		}
		
		else if(action.equalsIgnoreCase("listAppointments"))
		{
			forward="ViewAppointmentStaff.jsp";
			request.setAttribute("appointments",daoAppointment.getAllAppointments());
		}
		
		RequestDispatcher view=request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("AddAppointment"))
		{
			String AppointmentType=request.getParameter("AppointmentType");
			String AppointmentDescription=request.getParameter("AppointmentDescription");
			String AppointmentDate=request.getParameter("AppointmentDate");
			String AppointmentTime=request.getParameter("AppointmentTime");
			String PatientID=request.getParameter("PatientID");
			
			Appointment appointment=new Appointment(AppointmentType,AppointmentDescription,AppointmentDate,AppointmentTime,PatientID);
			daoAppointment.addAppointment(appointment);
			request.setAttribute("Success", "Successfully book an appointment!");
			forward="HomePatient.jsp";
		}
		
		RequestDispatcher view=request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

}
