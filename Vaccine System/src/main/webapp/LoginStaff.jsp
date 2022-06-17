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
		<title>Log In | Staff</title>
		<style>
			input[type=text], input[type=password]
			{	
				width: 150%;
				padding: 12px;
				border: 1px solid #ccc;
				border-radius: 9px;
				box-sizing: border-box;
				margin-top: 6px;
				margin-bottom: 16px;
				resize: vertical;
				margin-left:60%;
			}
			
			button[type=submit]
			{
				background-color:#50D050;
				color: black;
				padding: 12px 30px;
				border: none;
				border-radius: 4px;
				cursor: pointer;
				margin-left:40%;
			}
			
			form
			{
				margin-left:38%;
			}
			
			
			button:hover, button:active 
			{
			  background-color:#3CBC3C;
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
			#btn
			{
				background-color:rgba(133, 104, 73, 0.9);
				color: white;
				padding: 14px 25px;
				text-align: center;
				text-decoration: none;
				display: inline-block;
				border-radius:40px;
				height: 55px;
				width: 100%;
				margin-left:4px;
				font-weight: 700;
				font-size: 18px;"
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
			<li style="float:left;"> <a href="index.jsp"><i class="fa fa-home"></i>&nbsp;Home</a></li>
			<li><a href="LoginPatient.jsp"><i class='fas fa-user-injured'></i>&nbsp;Patient</a></li>
			<li><a href="LoginStaff.jsp"><i class='fas fa-user-tie'></i>&nbsp;Staff</a></li>
		</ul>
		<div id="booking" class="section">
			<div class="section-center">
				<div class="container">
					<c:if test="${not empty LoginError}">
						<div id="close" class="alert error">
							<span class="closebtn" onclick="document.getElementById('close').style.display='none'">&#215;</span>
				            <h6 align="center" style="color: white;font-size:15px;"><c:out value="${LoginError}"></c:out></h6>
						</div>
					</c:if>
					<c:if test="${not empty Success}">
						<div id="close" class="alert success">
							<span class="closebtn" onclick="document.getElementById('close').style.display='none'">&#215;</span>
				            <h6 align="center" style="color: white;font-size:15px;"><c:out value="${Success}"></c:out></h6>
						</div>
					</c:if><br><br><br>
					<div class="row">
						<div class="booking-form">
							<div class="booking-bg">
								<div class="form-header">
									<h2 align="center">Log In</h2>
								</div>
							</div>
							<form name="LogInStaff" action="StaffController?action=LoginStaff" method="post">
								<div class="row">
									<div class="col-md-5">
										<div class="form-group">
											<span class="form-label" style="margin-left:60%;">Email</span>
											<input type="text" name="StaffEmail" id="StaffEmail" required>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-5">
										<div class="form-group">
											<span class="form-label" style="margin-left:60%;">Password</span>
											<input type="password" name="StaffPassword" id="StaffPassword" required>
											<input type="checkbox" onclick="showPassword()" style="margin-left:100px;">&nbsp;Show
										</div>
									</div>
								</div>
								<div class="form-btn">
									<button class="submit-btn">Log In</button><br>
									<a style="background-color:rgba(133, 104, 73, 0.9);color: white;padding: 14px 25px;text-align: center;text-decoration: none;display: inline-block;border-radius:40px;height: 55px;width: 100%;margin-left:-1px;font-weight: 700;font-size: 18px;" href="SignUpStaff.jsp">Sign Up</a>
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
			<form name="LogInStaff" action="StaffController?action=LoginStaff" method="post">
				Email:
				<input type="text" name="StaffEmail" id="StaffEmail" required><br><br>
				Password:
				<input type="password" name="StaffPassword" id="StaffPassword" required><br><br>
				<button type="submit">Log in</button>
			</form>
		</div>
	</body> -->
</html>