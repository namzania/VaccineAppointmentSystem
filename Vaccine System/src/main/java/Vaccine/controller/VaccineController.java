package Vaccine.controller;

import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// import javax.servlet.http.HttpSession;

import Vaccine.dao.VaccineDAO;
import Vaccine.model.Vaccine;


@WebServlet("/VaccineController")
public class VaccineController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	private VaccineDAO daoVaccine;
	String forward="";

    public VaccineController() 
    {
        super();
        daoVaccine=new VaccineDAO();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("listVaccine"))
		{
			forward="ViewListOfVaccinesStaff.jsp";
			request.setAttribute("vaccines", daoVaccine.getAllVaccine());
		}
		
		else if(action.equalsIgnoreCase("listVaccineP"))
		{
			forward="ViewListOfVaccinesPatient.jsp";
			request.setAttribute("vaccines",daoVaccine.getAllVaccine());
		}
		
		else if(action.equalsIgnoreCase("deleteVaccine"))
		{
			String VaccineID=request.getParameter("VaccineID");
			daoVaccine.deleteVaccine(VaccineID);
			forward="ViewListOfVaccinesStaff.jsp";
			request.setAttribute("vaccines", daoVaccine.getAllVaccine());
		}
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("AddVaccine"))
		{
			String VaccineName=request.getParameter("VaccineName");
			String VaccineDescription=request.getParameter("VaccineDescription");
			String StaffID=request.getParameter("StaffID");
			
			Vaccine vaccine=new Vaccine(VaccineName,VaccineDescription,StaffID);
			vaccine=daoVaccine.getVaccine(vaccine);
			
			if(!vaccine.isValid())
			{
				daoVaccine.addVaccine(vaccine);
				request.setAttribute("Success","Successfully added!");
				forward="HomeStaff.jsp";
			}
			
			else
			{
				request.setAttribute("Error","This name of vaccine has been registered!");
				forward="CreateVaccineStaff.jsp";
			}
			
		}
		
		RequestDispatcher view=request.getRequestDispatcher(forward);
		view.forward(request, response);

	}

}
