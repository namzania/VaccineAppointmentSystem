<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 		<meta charset="ISO-8859-1"> -->
		<link href="http://fonts.googleapis.com/css?family=Playfair+Display:900" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   		<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
		<link href="http://fonts.googleapis.com/css?family=Alice:400,700" rel="stylesheet" type="text/css" />
		<link type="text/css" rel="stylesheet" href="css/bootstrap.css" />
		<link type="text/css" rel="stylesheet" href="css/style.css" />
		<title>Book Appointment</title>
		<style>
			input[type=text],textarea,input[type=date],select
			{	
				width: 100%;
				padding: 12px;
				border: 1px solid #ccc;
				border-radius: 10px;
				box-sizing: border-box;
				margin-top: 6px;
				margin-bottom: 16px;
				resize: vertical;
			}
			
			button[type=submit]
			{
				background-color:#AFE1AF;
				color: black;
				padding: 12px 30px;
				border: none;
				border-radius: 4px;
				cursor: pointer;
				margin-left:45%;
			}
			
			.selects
			{
				border-radius:10px;
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
	</head>
	<body>
		<ul>	
			<li style="float:left;"><a href="HomePatient.jsp"><i class="fa fa-home"></i>&nbsp;Home</a></li>
			<li><a href="PatientController?action=logout&PatientID=<%= session.getAttribute("PatientID") %>"><i class='fas fa-sign-out-alt'></i>&nbsp;Logout</a></li>
			<li><a href="AppointmentController?action=listAppointment&PatientID=<%=session.getAttribute("PatientID")%>"><i class="fa fa-calendar"></i>&nbsp;My Appointments</a></li>
			<li><a href="VaccineController?action=listVaccineP"><i class="fa fa-calendar-plus-o"></i>&nbsp;Book Appointment</a></li>
			<li><a href="PatientController?action=viewProfile&PatientID=<%=session.getAttribute("PatientID")%>"><i class="fa fa-address-book"></i>&nbsp;My Profile</a></li>
		</ul>
		<div id="booking" class="section">
			<div class="section-center">
				<div class="container">
					<div class="row">
						<div class="booking-form">
							<div class="booking-bg">
								<div class="form-header">
									<h2 align="center">Book your appointment</h2>
								</div>
							</div>
							<form name="BookAppointment" action="AppointmentController?action=AddAppointment" method="post">
								<input type="hidden" name="PatientID" value="<%=session.getAttribute("PatientID")%>">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Appointment for</span>
											<input type="text" name="AppointmentType" value="<c:out value="${vaccine.vaccineName}" />" readonly>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Appointment Desc</span>
											<textarea name="AppointmentDescription" rows="4" cols="50" readonly><c:out value="${vaccine.vaccineDescription}" /></textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Preferred Date</span>
											<input type="date" name="AppointmentDate" id="AppointmentDate" min="2022-01-30" max="2022-03-31"  required>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Preferred Time:</span>
											<div>
												<select name="AppointmentTime" id="AppointmentTime" class="selects" onfocus='this.size=6;' onblur='this.size=1;' onchange='this.size=2; this.blur();' required>
													<option hidden selected> Please select</option>
													<option value="8:30 AM"> 8:30 AM</option>
													<option value="9:00 AM"> 9:00 AM</option>
													<option value="9:30 AM"> 9:30 AM</option>
													<option value="10:00 AM"> 10:00 AM</option>
													<option value="10:30 AM"> 10:30 AM</option>
													<option value="11:00 AM"> 11:00 AM</option>
													<option value="11:30 AM"> 11:30 AM</option>
													<option value="1:00 PM"> 1:00 PM</option>
													<option value="1:30 PM"> 1:30 PM</option>
													<option value="2:00 PM"> 2:00 PM</option>
													<option value="2:30 PM"> 2:30 PM</option>
													<option value="3:00 PM"> 3:00 PM</option>
													<option value="3:30 PM"> 3:30 PM</option>
													<option value="4:00 PM"> 4:00 PM</option>
													<option value="4:30 PM"> 4:30 PM</option>
													<option value="5:00 PM"> 5:00 PM</option>
													<option value="5:30 PM"> 5:30 PM</option>
													<option value="6:00 PM"> 6:00 PM</option>
												</select>
												<span class="select-arrow"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="form-btn">
									<button class="submit-btn">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
		<!-- <body>
			<div class="container" style="margin:auto; max-width:15%;">
				<form name="BookAppointment" action="AppointmentController?action=AddAppointment" method="post">
					<input type="hidden" name="PatientID" value="<%=session.getAttribute("PatientID")%>">
					Appointment for:<br>
					<input type="text" name="AppointmentType" value="<c:out value="${vaccine.vaccineName}" />" readonly><br><br>
					Appointment Description:<br>
					<textarea name="AppointmentDescription" rows="4" cols="50" readonly><c:out value="${vaccine.vaccineDescription}" /></textarea><br><br>
					Preferred Date:<br>
					<input type="date" name="AppointmentDate" id="AppointmentDate" min="2022-01-30" max="2022-03-31"  required><br><br>
					<label for="AppointmentTime">Preferred Time:</label>
					<div>
						<select name="AppointmentTime" id="AppointmentTime" class="form-control" onfocus='this.size=6;' onblur='this.size=1;' onchange='this.size=2; this.blur();' required>
							<option disabled selected> Please select</option>
							<option value="8:30 AM"> 8:30 AM</option>
							<option value="9:00 AM"> 9:00 AM</option>
							<option value="9:30 AM"> 9:30 AM</option>
							<option value="10:00 AM"> 10:00 AM</option>
							<option value="10:30 AM"> 10:30 AM</option>
							<option value="11:00 AM"> 11:00 AM</option>
							<option value="11:30 AM"> 11:30 AM</option>
							<option value="1:00 PM"> 1:00 PM</option>
							<option value="1:30 PM"> 1:30 PM</option>
							<option value="2:00 PM"> 2:00 PM</option>
							<option value="2:30 PM"> 2:30 PM</option>
							<option value="3:00 PM"> 3:00 PM</option>
							<option value="3:30 PM"> 3:30 PM</option>
							<option value="4:00 PM"> 4:00 PM</option>
							<option value="4:30 PM"> 4:30 PM</option>
							<option value="5:00 PM"> 5:00 PM</option>
							<option value="5:30 PM"> 5:30 PM</option>
							<option value="6:00 PM"> 6:00 PM</option>
						</select>
					</div>
					<br><br>
					<button type="submit">Submit</button>
				</form>
			</div>
		</body> -->
</html>