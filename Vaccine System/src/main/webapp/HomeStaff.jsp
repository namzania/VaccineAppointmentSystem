<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<meta http-equiv="X-UA-Compatible" content="ie=edge">
   		<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
   		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   		<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
	    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
	    <link rel="stylesheet" href="css/style.css" type="text/css">
		<title>Home | Staff</title>
	</head>
	<style>
		#t3
		{
			//font-family:"Alice,serif";
			font-weight: 900;
			color:black;
			font-size: 30px;
			text-align:center;
		}
		ul
		{	
			list-style-type: none;
	  		margin: 0;
	 		padding: 0;
			overflow: hidden;
			border: 1px solid #e7e7e7;
			background-color: #f3f3f3;
			width:100%;
		}
		li
		{
			float:right;
			font-family:"Times New Roman";
			font-size:20px;
		}
		li a
		{
			display: block;
	  		color: #666;
	  		text-align: center;
	  		padding: 14px 16px;
	  		text-decoration: none;
	  		font-weight:bold;
		}
		li a:hover:not(.active)
		{
			border-bottom:2px solid #A9A9A9;
			color:#666;
			text-decoration: none;
		}
		li a.active
		{
			color: white;
	  		background-color: #04AA6D; 
		}
		.alert 
			{
      			opacity: 1;
      			transition: opacity 0.6s;
      			border-radius: 30px;
      			padding:10px;
      			width:50%;
      			margin:auto;
 		   	}
			.alert.success 
			{
				background-color: #97BD64;
			}
   			.alert.error 
   			{
   				background-color: #ff4d4d;
   			}

		    .closebtn 
		    {
		     	margin-left: 15px;
		      	color: white;
		      	font-weight: bold;
			    float: right;
			    font-size: 20px;
			    line-height: 10px;
			    cursor: pointer;
			    transition: 0.3s;      
   	 		}    
	</style>
	<body>
		<ul>	
			<li style="float:left;"><a href="HomeStaff.jsp"><i class="fa fa-home"></i>&nbsp;Home</a></li>
			<li><a href="StaffController?action=logout&StaffID=<%= session.getAttribute("StaffID") %>"><i class='fas fa-sign-out-alt'></i>&nbsp;Logout</a></li>
			<li><a href="AppointmentController?action=listAppointments"><i class="fa fa-calendar"></i>&nbsp;Appointments</a></li>
			<li><a href="PatientController?action=listPatient"><i class='fas fa-user-injured'></i>&nbsp;Patients</a></li>
			<li><a href="VaccineController?action=listVaccine"><i class='fas fa-syringe'></i>&nbsp;Vaccines</a></li>
			<li><a href="StaffController?action=viewProfile&StaffID=<%=session.getAttribute("StaffID")%>"><i class="fa fa-address-book"></i>&nbsp;My Profile</a></li>
		</ul>
		<div id="booking" class="section">
			<div class="section-center">
				<div class="container">
					<c:if test="${not empty Success}">
						<div id="close" class="alert success">
							<span class="closebtn" onclick="document.getElementById('close').style.display='none'">&#215;</span>
							<h6 align="center" style="color: white;font-size:15px;"><c:out value="${Success}"></c:out></h6>
						</div>
					</c:if><br><br>
					<div class="row">
						<div class="booking-form">
							<h2 align="Center">Hi <%=session.getAttribute("StaffName")%>!</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- <a href="StaffController?action=viewProfile&StaffID=<%=session.getAttribute("StaffID")%>">Profile</a><br><br>
		<a href="CreateVaccineStaff.jsp">Create Vaccine</a>
		<a href="VaccineController?action=listVaccine"> View Vaccine</a>
		<a href="PatientController?action=listPatient">View Patient</a>
		<a href="AppointmentController?action=listAppointments">View Appointment</a> 
		<li style="float:left;"><a href="HomeStaff.jsp">Home</a></li> -->
	</body>
</html>