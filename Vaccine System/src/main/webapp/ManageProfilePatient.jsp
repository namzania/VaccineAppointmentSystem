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
		<title>Update Profile | Patient</title>
	</head>
	<style>
			input
			{	
				width: 100%;
				padding: 12px;
				border: 1px solid #ccc;
				border-radius: 9px;
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
				margin-left:12%;
			}
			
			form
			{
				margin-left:38%;
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
	<script>
		function showPassword() 
		{
		    var x = document.getElementById("PatientPassword");
		    if (x.type === "password") 
		    {
		      x.type = "text";
		    } 
		    
		    else 
		    {
		      x.type = "password";
		    }
		 }
	</script>
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
					<c:if test="${not empty Outdated}">
						<div id="close" class="alert error">
							<span class="closebtn" onclick="document.getElementById('close').style.display='none'">&#215;</span>
				            <h6 align="center" style="color: white;font-size:15px;"><c:out value="${Outdated}"></c:out></h6>
						</div>
					</c:if><br><br><br>
					<div class="row">
						<div class="booking-form">
							<div class="booking-bg">
								<div class="form-header">
									<h2 align="center">Update Profile</h2>
								</div>
							</div>
							<form name="ManageProfilePatient" action="PatientController?action=ManageProfile" method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Patient ID</span>
											<input type="text" name="PatientID" id="PatientID" value="<c:out value="${patient.patientID}" />" readonly>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Name</span>
											<input type="text" name="PatientName" id="PatientName" value="<c:out value="${patient.patientName}" />" readonly>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Phone</span>
											<input type="number" name="PatientPhone" value="<c:out value="${patient.patientPhone}" />" required>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Email</span>
											<input type="email" name="PatientEmail" value="<c:out value="${patient.patientEmail}" />" required>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Password</span>
											<input type="password" name="PatientPassword" id="PatientPassword" value="<c:out value="${patient.patientPassword}" />" required>
											<input type="checkbox" onclick="showPassword()" style="margin-left:-90px;">Show
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Address</span>
											<input type="text" name="PatientAddress" value="<c:out value="${patient.patientAddress}" />" required>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Gender</span>
											<input type="text" name="PatientGender" value="<c:out value="${patient.patientGender}" />" readonly>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Age</span>
											<input type="number" name="PatientAge" value="<c:out value="${patient.patientAge}" />" required>
										</div>
									</div>
								</div>
								<div class="form-btn">
									<button class="submit-btn">Update</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<!-- <body>
		<form name="ManageProfilePatient" action="PatientController?action=ManageProfile" method="post">
			Patient ID:
			<input type="text" name="PatientID" id="PatientID" value="<c:out value="${patient.patientID}" />" readonly><br><br>
			Name:
			<input type="text" name="PatientName" id="PatientName" value="<c:out value="${patient.patientName}" />" readonly><br><br>
			Phone:
			<input type="number" name="PatientPhone" value="<c:out value="${patient.patientPhone}" />" required><br><br>
			Email:
			<input type="email" name="PatientEmail" value="<c:out value="${patient.patientEmail}" />" required><br><br>
			Password:
			<input type="password" name="PatientPassword" value="<c:out value="${patient.patientPassword}" />" required><br><br> 
			Address:
			<input type="text" name="PatientAddress" value="<c:out value="${patient.patientAddress}" />" required><br><br>
			Gender:
			<input type="text" name="PatientGender" value="<c:out value="${patient.patientGender}" />" readonly><br><br>
			Age:
			<input type="number" name="PatientAge" value="<c:out value="${patient.patientAge}" />" required><br><br>
			<br><br>
			<button type="submit" class="site-btn register-btn">Update</button>
		</form>
	</body> -->
</html>
