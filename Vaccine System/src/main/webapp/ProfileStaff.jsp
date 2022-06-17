<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    
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
		<title>Profile | Staff</title>
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
		    var x = document.getElementById("StaffPassword");
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
					<c:if test="${not empty Updated}">
						<div id="close" class="alert success">
							<span class="closebtn" onclick="document.getElementById('close').style.display='none'">&#215;</span>
				            <h6 align="center" style="color: white;font-size:15px;"><c:out value="${Updated}"></c:out></h6>
						</div>
					</c:if><br><br><br>
					<div class="row">
						<div class="booking-form">
							<div class="booking-bg">
								<div class="form-header">
									<h2 align="center">My Profile</h2>
								</div>
							</div>
							<form>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Staff ID</span>
											<input value="<c:out value="${staff.staffID}" />" readonly>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Name</span>
											<input value="<c:out value="${staff.staffName}" />" readonly>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Email</span>
											<input value="<c:out value="${staff.staffEmail}" />"readonly>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Password</span>
											<input type="password" id="StaffPassword" value="<c:out value="${staff.staffPassword}" />" readonly>
											<input type="checkbox" onclick="showPassword()" style="margin-left:-90px;">Show
										</div>
									</div>
								</div>
								<div class="form-btn">
									<a style="background-color:rgba(133, 104, 73, 0.9);color: white;padding: 14px 25px;text-align: center;text-decoration: none;display: inline-block;border-radius:40px;height: 55px;width: 100%;margin-left:4px;font-weight: 700;font-size: 18px;" href="StaffController?action=manageProfile&StaffID=<%= session.getAttribute("StaffID") %>">Manage</a>&nbsp;
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	
	<!-- <body>
		<p><b>Staff ID: </b> <input value="<c:out value="${staff.staffID}" />" readonly></p>
		<p><b>Name: </b> <input value="<c:out value="${staff.staffName}" />" readonly></p>
		<p><b>Email: </b> <input value="<c:out value="${staff.staffEmail}" />"readonly></p>
		<p><b>Password: </b> <input value="<c:out value="${staff.staffPassword}" />" readonly></p>
		<a href="StaffController?action=manageProfile&StaffID=<%= session.getAttribute("StaffID") %>">Manage</a>&nbsp;
		<a href="StaffController?action=logout&StaffID=<%= session.getAttribute("StaffID") %>">Logout</a>
	</body> -->
</html>