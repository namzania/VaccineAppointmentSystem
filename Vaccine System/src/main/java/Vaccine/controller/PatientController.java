package Vaccine.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Vaccine.dao.PatientDAO;
import Vaccine.model.Patient;

@WebServlet("/PatientController")
public class PatientController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	private PatientDAO daoPatient;
	String forward="";
  
    public PatientController() 
    {
        super();
        daoPatient=new PatientDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String action=request.getParameter("action");
		
		if (action.equalsIgnoreCase("ManageProfile"))
		{
			String PatientID=request.getParameter("PatientID");
			Patient patient=new Patient();
			patient=daoPatient.getPatientByID(PatientID);
			forward="ManageProfilePatient.jsp";
			request.setAttribute("patient",patient);
		}
		
		else if(action.equalsIgnoreCase("logout"))
		{
			HttpSession session=request.getSession();
			session.invalidate();
			forward="LoginPatient.jsp";
			System.out.println("Successfully logged out!");
		}
		
		else if(action.equalsIgnoreCase("viewProfile")) 
		{
			String PatientID=request.getParameter("PatientID");
			Patient patient=new Patient();
			patient=daoPatient.getPatientByID(PatientID);
			forward="ProfilePatient.jsp";
			request.setAttribute("patient",patient);
		}
		
		else if(action.equalsIgnoreCase("listPatient"))
		{
			forward="ViewListOfPatient.jsp";
			request.setAttribute("patients",daoPatient.getAllPatient());
		}
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("AddPatient"))
		{
			String PatientName=request.getParameter("PatientName");
			String PatientPhone=request.getParameter("PatientPhone");
			String PatientEmail=request.getParameter("PatientEmail");
			String PatientPassword=request.getParameter("PatientPassword");
			String PatientAddress=request.getParameter("PatientAddress");
			String PatientGender=request.getParameter("PatientGender");
			String PatientAge=request.getParameter("PatientAge");
			
			Patient patient=new Patient(PatientName,PatientPhone,PatientEmail,PatientPassword,PatientAddress,PatientGender,PatientAge);
			patient=daoPatient.getPatient(patient);
			
			if(!patient.isValid())
			{
				daoPatient.addPatient(patient);
				request.setAttribute("Success","Successfully signed up!");
				forward="LoginPatient.jsp";
			}
			
			else
			{
				request.setAttribute("Signuperror","This email has been registered!");
				forward="SignUpPatient.jsp";
			}
			
		}
		
		else if(action.equalsIgnoreCase("LoginPatient"))
		{
			String PatientEmail=request.getParameter("PatientEmail");
			String PatientPassword=request.getParameter("PatientPassword");
			
			Patient patient=new Patient();
			patient.setPatientEmail(PatientEmail);
			patient.setPatientPassword(PatientPassword);
			patient=daoPatient.validate(patient);
			
			if(patient.isValid())
			{
				System.out.println("Successfully logged in!");
				HttpSession session=request.getSession();
				session.setAttribute("PatientID",patient.getPatientID());
				session.setAttribute("PatientName",patient.getPatientName());
				session.setAttribute("PatientPhone",patient.getPatientPhone());
				session.setAttribute("PatientEmail",patient.getPatientEmail());
				session.setAttribute("PatientPassword",patient.getPatientPassword());
				session.setAttribute("PatientAddress",patient.getPatientAddress());
				session.setAttribute("PatientGender",patient.getPatientGender());
				session.setAttribute("PatientAge",patient.getPatientAge());
				request.setAttribute("patient", patient);
				request.setAttribute("Success","Successfully log in!");
				forward="HomePatient.jsp";
			}
			
			else
			{
				System.out.println("Invalid Email and/or Password!");
				request.setAttribute("LoginError","Invalid Email and/or Password!");
				forward="LoginPatient.jsp";
			}
		}
		
		else if(action.equalsIgnoreCase("ManageProfile"))
		{
			String PatientID=request.getParameter("PatientID");
			String PatientName=request.getParameter("PatientName");
			String PatientPhone=request.getParameter("PatientPhone");
			String PatientEmail=request.getParameter("PatientEmail");
			String PatientPassword=request.getParameter("PatientPassword");
			String PatientAddress=request.getParameter("PatientAddress");
			String PatientAge=request.getParameter("PatientAge");
			String PatientGender=request.getParameter("PatientGender");
			
			Patient patient=new Patient(PatientID,PatientName,PatientPhone,PatientEmail,PatientPassword,PatientAddress,PatientGender,PatientAge);
			
			patient.setPatientPhone(PatientPhone);
			patient.setPatientEmail(PatientEmail);
			patient.setPatientPassword(PatientPassword);
			patient.setPatientAddress(PatientAddress);
			patient.setPatientAge(PatientAge);
			patient.setPatientID(PatientID);
			patient.setPatientGender(PatientGender);
			patient.setPatientName(PatientName);
			
			patient=daoPatient.UpdateProfile(patient);
			patient=daoPatient.getPatientByID(PatientID);
			request.setAttribute("patient", patient);
			
			HttpSession session=request.getSession(); //Update session.
			session.setAttribute("PatientID",patient.getPatientID());
			session.setAttribute("PatientName",patient.getPatientName());
			session.setAttribute("PatientPhone",patient.getPatientPhone());
			session.setAttribute("PatientEmail",patient.getPatientEmail());
			session.setAttribute("PatientPassword",patient.getPatientPassword());
			session.setAttribute("PatientAddress",patient.getPatientAddress());
			session.setAttribute("PatientGender",patient.getPatientGender());
			session.setAttribute("PatientAge",patient.getPatientAge());
			
			if(!patient.isValid())
			{
				request.setAttribute("Updated","Successfully updated!");
				forward="ProfilePatient.jsp";
			}
			
			else
			{
				request.setAttribute("Outdated","Failed to update!");
				forward="ManageProfilePatient.jsp";
			}
		}
		
		RequestDispatcher view=request.getRequestDispatcher(forward);
		view.forward(request, response);
	}
}
