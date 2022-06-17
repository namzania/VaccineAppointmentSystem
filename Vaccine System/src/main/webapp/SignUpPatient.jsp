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
		<title>Sign Up | Patient</title>
	</head>
	<style>
		.alert 
		{
	      opacity: 1;
	      transition: opacity 0.6s;
	      border-radius: 30px;
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
	      font-size: 100px;
	      line-height: 50px;
	      cursor: pointer;
	      transition: 0.3s;      
	    }    
	    
	    input,select
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
			position:fixed;
			z-index:1;
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
			border-bottom:2px solid red; 
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
			<li style="float:left;"> <a href="index.jsp"><i class="fa fa-home"></i>&nbsp;Home</a></li>
			<li><a href="LoginPatient.jsp"><i class='fas fa-user-injured'></i>&nbsp;Patient</a></li>
			<li><a href="LoginStaff.jsp"><i class='fas fa-user-tie'></i>&nbsp;Staff</a></li>
		</ul>
		<div id="booking" class="section">
			<div class="section-center">
				<div class="container"><br><br>
					<c:if test="${not empty Signuperror}">
						<div id="close" class="alert error">
							<span class="closebtn" onclick="document.getElementById('close').style.display='none'">&#215;</span>
				            <h6 align="center" style="color: white;font-size:15px;"><c:out value="${Signuperror}"></c:out></h6>
						</div>
					</c:if><br><br>
					<div class="row">
						<div class="booking-form">
							<div class="booking-bg">
								<div class="form-header">
									<h2 align="center">Sign up</h2>
								</div>
							</div>
							<form name="SignUpPatient" action="PatientController?action=AddPatient" method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Name</span>
											<input type="text" id="PatientName" name="PatientName" required>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Phone</span>
											<input type="number" id="PatientPhone" name="PatientPhone" required>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Email</span>
											<input type="email" id="PatientEmail" name="PatientEmail" required>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Password</span>
											<input type="password" id="PatientPassword" name="PatientPassword" required>
											<input type="checkbox" onclick="showPassword()" style="margin-left:-90px;">Show
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Address</span>
											<input type="text" id="PatientAddress" name="PatientAddress" required>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Gender</span>
											<select name="PatientGender" class="selects"  required>
												<option hidden selected> Please select</option>
												<option value=Male> Male</option>
												<option value=Female> Female</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Age</span>
											<input type="number" id="PatientAge" name="PatientAge" required>
										</div>
									</div>
								</div>
								<div class="form-btn">
									<button class="submit-btn">Sign Up</button><br>
									<a style="background-color:rgba(133, 104, 73, 0.9);color: white;padding: 14px 25px;text-align: center;text-decoration: none;display: inline-block;border-radius:40px;height: 55px;width: 100%;margin-left:-1px;font-weight: 700;font-size: 18px;" href="LoginPatient.jsp">Login</a>
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
			<c:if test="${not empty signuperror}">
	        	<div id="close" class="alert error">
	            	<span class="closebtn" onclick="document.getElementById('close').style.display='none'">&#215;</span>
	                <h6 align="center" style="color: white;"><c:out value="${signuperror}"></c:out></h6>
	            </div>
	        </c:if> 
			<form name="SignUpPatient" action="PatientController?action=AddPatient" method="post">
				Name:
				<input type="text" id="PatientName" name="PatientName" required><br><br>
				Phone:
				<input type="number" id="PatientPhone" name="PatientPhone" required><br><br>
				Email:
				<input type="email" id="PatientEmail" name="PatientEmail" required><br><br>
				Password:
				<input type="password" id="PatientPassword" name="PatientPassword" required><br><br>
				Address:
				<input type="text" id="PatientAddress" name="PatientAddress" required><br><br>
				Gender:
				<input type="radio" id="PatientGender" name="PatientGender" value="Male"> Male<input type="radio" id="PatientGender" name="PatientGender" value="Female"> Female<br><br>
				Age:
				<input type="number" id="PatientAge" name="PatientAge" required><br><br>
				<input type="checkbox" onclick="showPassword()"> Show Password<br><br>
				<button type="submit">Sign up</button>
			</form>
		</div>
	</body> -->
</html>