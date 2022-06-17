package Vaccine.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Vaccine.dao.StaffDAO;
import Vaccine.model.Staff;


@WebServlet("/StaffController")
public class StaffController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	String forward="";
	private StaffDAO daoStaff;
  
    public StaffController() 
    {
        super();
        daoStaff=new StaffDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("ManageProfile"))
		{
			String StaffID=request.getParameter("StaffID");
			Staff staff=new Staff();
			staff=daoStaff.getStaffByID(StaffID);
			forward="ManageProfileStaff.jsp";
			request.setAttribute("staff",staff);
			
		}
		
		else if(action.equalsIgnoreCase("logout"))
		{
			HttpSession session=request.getSession();
			session.invalidate();
			forward="LoginStaff.jsp";
			System.out.println("Successfully logged out!");
		}
		
		else if(action.equalsIgnoreCase("viewProfile"))
		{
			String StaffID=request.getParameter("StaffID");
			Staff staff=new Staff();
			staff=daoStaff.getStaffByID(StaffID);
			forward="ProfileStaff.jsp";
			request.setAttribute("staff",staff);
		}
		
		else if(action.equalsIgnoreCase("home"))
		{
			String StaffID=request.getParameter("StaffID");
			Staff staff=new Staff();
			staff=daoStaff.getStaffByID(StaffID);
			forward="HomeStaff.jsp";
			request.setAttribute("staff",staff);
		}
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("AddStaff"))
		{
			String StaffName=request.getParameter("StaffName");
			String StaffEmail=request.getParameter("StaffEmail");
			String StaffPassword=request.getParameter("StaffPassword");
			
			Staff staff=new Staff(StaffName,StaffEmail,StaffPassword);
			staff=daoStaff.getStaff(staff);
			
			if(!staff.isValid())
			{
				daoStaff.addStaff(staff);
				request.setAttribute("Success","Successfully signed up!");
				forward="LoginStaff.jsp";
			}
			
			else
			{
				request.setAttribute("Signuperror","This email has been registered!");
				forward="SignUpStaff.jsp";
			}
		}

		else if(action.equalsIgnoreCase("LoginStaff"))
		{
			String StaffEmail=request.getParameter("StaffEmail");
			String StaffPassword=request.getParameter("StaffPassword");
			
			Staff staff=new Staff();
			staff.setStaffEmail(StaffEmail);
			staff.setStaffPassword(StaffPassword);
			staff=daoStaff.validate(staff);
			
			if(staff.isValid()) 
			{
				HttpSession session=request.getSession();
				session.setAttribute("StaffID",staff.getStaffID());
				session.setAttribute("StaffName",staff.getStaffName());
				session.setAttribute("StaffEmail",staff.getStaffEmail());
				session.setAttribute("StaffPassword",staff.getStaffPassword());
				request.setAttribute("staff",staff);
				request.setAttribute("Success","Successfully log in!");
				forward="HomeStaff.jsp";
			}
			
			else
			{
				request.setAttribute("LoginError","Invalid Email and/or Password!");
				forward="LoginStaff.jsp";
			}
		}
		
		else if(action.equalsIgnoreCase("ManageProfile"))
		{
			String StaffID=request.getParameter("StaffID");
			String StaffName=request.getParameter("StaffName");
			String StaffEmail=request.getParameter("StaffEmail");
			String StaffPassword=request.getParameter("StaffPassword");
			
			Staff staff=new Staff(StaffID,StaffName,StaffEmail,StaffPassword);
			
			staff.setStaffID(StaffID);
			staff.setStaffName(StaffName);
			staff.setStaffEmail(StaffEmail);
			staff.setStaffPassword(StaffPassword);
			
			staff=daoStaff.UpdateProfile(staff);
			staff=daoStaff.getStaffByID(StaffID);
			request.setAttribute("staff",staff);
			
			HttpSession session=request.getSession();
			session.setAttribute("StaffID",staff.getStaffID());
			session.setAttribute("StaffName",staff.getStaffName());
			session.setAttribute("StaffPassword",staff.getStaffPassword());
			
			if(!staff.isValid())
			{
				request.setAttribute("Updated","Successfully updated!");
				forward="ProfileStaff.jsp";
			}
			
			else
			{
				request.setAttribute("Outdated","Failed to update!");
				forward="ManageProfileStaff.jsp";
			}
		}
		
		RequestDispatcher view=request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

}
