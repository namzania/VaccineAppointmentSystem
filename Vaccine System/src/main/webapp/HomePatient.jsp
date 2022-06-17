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
	    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
	    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
	    <link rel="stylesheet" href="css/style.css" type="text/css">
		<title>Home | Patient</title>
	</head>
	<style>
		#t3
		{
			font-family:"Times New Roman";
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
			<li style="float:left;"><a href="HomePatient.jsp"><i class="fa fa-home"></i>&nbsp;Home</a></li>
			<li><a href="PatientController?action=logout&PatientID=<%= session.getAttribute("PatientID") %>"><i class="fa fa-sign-out "></i>&nbsp;Logout</a></li>
			<li><a href="AppointmentController?action=listAppointment&PatientID=<%=session.getAttribute("PatientID")%>"><i class="fa fa-calendar"></i>&nbsp;My Appointments</a></li>
			<li><a href="VaccineController?action=listVaccineP"><i class="fa fa-calendar-plus-o"></i>&nbsp;Book Appointment</a></li>
			<li><a href="PatientController?action=viewProfile&PatientID=<%=session.getAttribute("PatientID")%>"><i class="fa fa-address-book"></i>&nbsp;My Profile</a></li>
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
							<h2 id="t3">Hi <%= session.getAttribute("PatientName") %>!</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br><br>
		
		
		
		<!-- <a href="PatientController?action=viewProfile&PatientID=<%=session.getAttribute("PatientID")%>">Profile</a><br><br>
		<a href="VaccineController?action=listVaccineP">View Vaccines</a>
		<a href="AppointmentController?action=listAppointment&PatientID=<%=session.getAttribute("PatientID")%>">List Appointment</a> -->
		<!-- <a href="AppointmentController?action=bookAppointment&PatientID=<%=session.getAttribute("PatientID")%>">Book Appointment</a> -->
	</body>
</html>

