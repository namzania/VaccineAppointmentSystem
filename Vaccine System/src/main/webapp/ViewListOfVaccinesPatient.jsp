<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	int bill=0;
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   		<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
	    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
	    <link rel="stylesheet" href="css/style.css" type="text/css">
	    <link rel="stylesheet" href="css/style1.css">
	    <link rel="stylesheet" href="css/bootstrap.min.css">
	    <link rel="stylesheet" href="css/owl.css">
	    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<title>List of Vaccines | Patient</title>
	</head>
	<style>
		#t1
		{
			font-family:"Times New Roman";
			text-align:center;
		}
		
		#t2
		{
			font-family:"Times New Roman";
			font-size:15px;
			text-align:center;
		}
		#t3
		{
			font-family:"Times New Roman";
			font-weight: 900;
			color:black;
			font-size: 42px;
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
		#SearchInput
		{
			float:right;
			width: 23%;
			font-size: 18px;
			padding: 10px 20px 12px 40px;
			border: 1px solid #ddd;
			border-radius:5px;
			margin-bottom: 12px;
			font-family:"Times New Roman";
		}
	</style>
	<body style="background:rgba(133, 104, 73, 0.33);">
		<ul>	
			<li style="float:left;"><a href="HomePatient.jsp"><i class="fa fa-home"></i>&nbsp;Home</a></li>
			<li><a href="PatientController?action=logout&PatientID=<%= session.getAttribute("PatientID") %>"><i class='fas fa-sign-out-alt'></i>&nbsp;Logout</a></li>
			<li><a href="AppointmentController?action=listAppointment&PatientID=<%=session.getAttribute("PatientID")%>"><i class="fa fa-calendar"></i>&nbsp;My Appointments</a></li>
			<li><a href="VaccineController?action=listVaccineP"><i class="fa fa-calendar-plus-o"></i>&nbsp;Book Appointment</a></li>
			<li><a href="PatientController?action=viewProfile&PatientID=<%=session.getAttribute("PatientID")%>"><i class="fa fa-address-book"></i>&nbsp;My Profile</a></li>
		</ul>
 		 <div class="content">
   		 	<div class="container">
   		 		<input type="text" id="SearchInput" onkeyup="Search()" placeholder="Vaccine's Name">
   		 		<div style="float:right;font-family:Times New Roman;font-size:20px;font-weight:bold;">Search Vaccine:&nbsp;</div><br><br>
     			<h2 id="t3">List of Vaccines</h2>
     			<div class="table-responsive custom-table-responsive" >
        			<table class="table custom-table" id="MyTable" style="overflow-x:auto;overflow-y:auto;">
          				<thead>
            				<tr>  
						    	<th scope="col" id="t2">No</th>
						        <th scope="col" id="t2">Vaccine ID</th>
						        <th scope="col" id="t2">Vaccine Name</th>
						        <th scope="col" id="t2">Vaccine Description</th>
            				</tr>
          				</thead>
         			 	<tbody>
         			 		<c:forEach items="${vaccines}" var="vaccine">
         			 			<%bill++; %>
	            				<tr>
	              					<td id="t1"><% out.print(bill); %></td>
	              					<td id="t1"><c:out value="${vaccine.vaccineID}"/></td>
	              					<td id="t1"><c:out value="${vaccine.vaccineName}"/></td>
	              					<td id="t1"><c:out value="${vaccine.vaccineDescription}"/></td>
	             					<td id="t1"><a href="AppointmentController?action=bookAppointment&VaccineID=<c:out value="${vaccine.vaccineID}" />" style="color:#50C878;font-weight:bold;">Book Appointment</a></td>
	            				</tr>
	            				<tr class="spacer"><td colspan="100"></td></tr>
	            			</c:forEach>
	            			<!-- <tr class="spacer"><td colspan="100"></td></tr> -->
          				</tbody>
       				</table>
     		 	</div>
    		</div>
  		</div>
   		<script src="js/jquery-3.3.1.min.js"></script>
    	<script src="js/popper.min.js"></script>
    	<script src="js/bootstrap.min.js"></script>
    	<script src="js/main.js"></script>
    	<script>
    		function Search()
    		{
    			var input,filter,table,tr,td,i,textValue;
    			input=document.getElementById("SearchInput");
    			filter=input.value.toUpperCase();
    			table=document.getElementById("MyTable");
    			tr=table.getElementsByTagName("tr");
    			
    			for(i=0;i<tr.length;i++)
    			{
    				td=tr[i].getElementsByTagName("td")[2];
    				
    				if(td)
    				{
    					textValue=td.textContent||td.innerText;
    					
     					if(textValue.toUpperCase().indexOf(filter)>-1)
        				{
        					tr[i].style.display="";
        				}
        					
        				else
        				{
        					tr[i].style.display="none";
        				}
    				}
    			}
    		}
    	</script>
    </body>
	
	<!-- <body>
		<table>
			<tr>
				<th>No</th>
				<th>Vaccine ID</th>
				<th>Vaccine Name</th>
				<th>Vaccine Description</th>
			</tr>
			<c:forEach items="${vaccines}" var="vaccine">
				<%bill++; %>
				<tr>
					<td><% out.print(bill); %></td> 
					<td><c:out value="${vaccine.vaccineID}"/></td>
					<td><c:out value="${vaccine.vaccineName}"/></td>
					<td><c:out value="${vaccine.vaccineDescription}"/></td>
					<td><a href="AppointmentController?action=bookAppointment&VaccineID=<c:out value="${vaccine.vaccineID}" />">Book Appointment</a></td>
				</tr>
			</c:forEach>
		</table>
	</body> -->
</html>

<!-- <td><a href="AppointmentController?action=bookAppointment&VaccineID=<%=session.getAttribute("VaccineID") %>">Book Appointment</a></td> -->