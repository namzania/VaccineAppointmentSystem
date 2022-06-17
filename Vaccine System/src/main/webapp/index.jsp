<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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
		<title>Homepage</title>
	</head>
	<style>
		ul
		{	
			list-style-type: none;
  			margin: 0;
 			padding: 0;
		  	overflow: hidden;
		  	border: 1px solid #e7e7e7;
		  	background-color: #f3f3f3;
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
			
		}
		li a.active
		{
			color: white;
  			background-color: #04AA6D; 
		}
	</style>
	<body>
		<ul>	
			<li style="float:left;"> <a href="index.jsp"><i class="fa fa-home"></i>&nbsp;Home</a></li>
			<li><a href="LoginPatient.jsp"><i class='fas fa-user-injured'></i>&nbsp;Patient</a></li>
			<li><a href="LoginStaff.jsp"><i class='fas fa-user-tie'></i>&nbsp;Staff</a></li>
		</ul>
		<div id="booking" class="section">
			<div class="section-center">
				<div class="container"><br>
					<div class="row">
						<div class="booking-form">
							<h1 align="center">Welcome!</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	
	<!-- <body>
		<a href="SignUpStaff.jsp">Sign up Staff</a>
		<br><br>
		<a href="LoginStaff.jsp">Login Staff</a>
		<br><br>
		<a href="SignUpPatient.jsp">Sign up Patient</a>
		<br><br>
		<a href="LoginPatient.jsp">Login Patient</a>
	</body>  -->
</html>