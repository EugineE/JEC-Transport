<%@page import="com.jeppiaar.util.ConnectionUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- including bootstrap file -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/Style.css">
<title>Transport Department</title>

<script type="text/javascript">
$(document).ready(function() {

	   var docHeight = $(window).height();
	   var footerHeight = $('.footer').height();
	   var footerTop = $('.footer').position().top + footerHeight;

	   if (footerTop < docHeight) {
	    $('.footer').css('margin-top', 10+ (docHeight - footerTop) + 'px');
	   }
	  });
</script>
</head>
<body>

<!-- logo image -->
    <img alt="..." src="Image/web%20page.png" class="logo-img" >
<!-- end of logo image -->    
  
<%
String username=(String)session.getAttribute("userName");
if(username.equalsIgnoreCase("transport")){
%>
<!--Navigator  -->
 <div class="navbar navbar-default" role="navigation">

    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand">Jeppiaar Transport</a>
    </div>

    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="index.jsp" >Home</a></li>
       <li class="dropdown">
       <a class="dropdown-toggle" data-toggle="dropdown">Register<b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="Registration.jsp">Student</a></li>
            <li><a href="StaffRegistration.jsp">Staff</a></li>
            </ul>
            </li>
             <li class="dropdown">
          <a  class="dropdown-toggle" data-toggle="dropdown">Attendance<b class="caret"></b></a>
          <ul class="dropdown-menu">
                     <li><a href="StaffAttendance.jsp">Staff</a></li>
           			 <li><a href="Update.jsp">Update</a></li>
          </ul>
       <li class="dropdown">
       <a  class="dropdown-toggle" data-toggle="dropdown">Route<b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="Department.jsp">Bus</a></li>
            <li><a href="AddRoute.jsp">Add Route</a></li>
            <li><a href="DeleteRoute.jsp">Delete Route</a>
            </ul>
            </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">Update<b class="caret"></b></a>
          <ul class="dropdown-menu">
          			 <li><a href="BoardingPoint.jsp">BoardingPoint</a></li>
                     <li><a href="Delete.jsp">Delete</a></li>
           			 <li><a href="Batch.jsp">Batch</a></li>
          </ul>
        </li>
        <li><a href="Login.jsp" >Logout</a></li>
      </ul>
    </div>
     
    </div>
    <%}
else{
	%>
	<!--Navigator  -->
<div class="navbar navbar-default" role="navigation">

 <div class="navbar-header">
   <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
     <span class="sr-only">Toggle navigation</span>
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
   </button>
   <a class="navbar-brand">Jeppiaar Transport</a>
 </div>

 <div class="navbar-collapse collapse">
   <ul class="nav navbar-nav navbar-right">
     <li><a href="Attendence.jsp" >Home</a></li>
    <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown">Register<b class="caret"></b></a>
       <ul class="dropdown-menu">
         <li><a href="Registration.jsp">Student</a></li>
         <li><a href="StaffRegistration.jsp">Staff</a></li>
         </ul>
         </li>
          
     <li class="dropdown">
       <a class="dropdown-toggle" data-toggle="dropdown">Update<b class="caret"></b></a>
       <ul class="dropdown-menu">
       			 <li><a href="BoardingPoint.jsp">BoardingPoint</a></li>
                  <li><a href="Delete.jsp">Delete</a></li>
        			
       </ul>
     </li>
     <li><a href="Login.jsp" >Logout</a></li>
   </ul>
 </div>
  
 </div>
    
<!-- end of navigator -->
	
	
	
	<%
} %>   
<!-- end of navigator -->
<!status>

<% 
String flag=(String)request.getAttribute("msg");
if(flag!=null){
if(flag.equals("valid")){
	%>
	<div id="contact-form" class="form-container" data-form-container style="color: rgb(46, 125, 50); background: rgb(200, 230, 201);">
	<div class="row">
		<div class="form-title">
			<span>BoaringPoint is changed successfully</span>
		</div>
	</div>
	</div>
<%}
else if(flag.equals("invalid")){
	%>
	<div id="login-form" class="form-container" data-form-container style="color: rgb(198, 40, 40); background: rgb(255, 205, 210);">
			<div class="row">
				<div class="form-title">
					<span>Register_No doesn't Exists</span>
				</div>
			</div>
			</div>
<%
}
}
%> 
<% 
String status=(String)request.getAttribute("msgStaff");
if(status!=null){
if(status.equals("valid")){
	%>
	<div id="contact-form" class="form-container" data-form-container style="color: rgb(46, 125, 50); background: rgb(200, 230, 201);">
	<div class="row">
		<div class="form-title">
			<span>BoaringPoint is changed successfully</span>
		</div>
	</div>
	</div>
<%}
else if(status.equals("invalid")){
	%>
	<div id="login-form" class="form-container" data-form-container style="color: rgb(198, 40, 40); background: rgb(255, 205, 210);">
			<div class="row">
				<div class="form-title">
					<span>StaffId doesn't Exists</span>
				</div>
			</div>
			</div>
<%
}
}
%> 

<!End status>
<!form>
<div class="container">
    <div class="row">
    		<div class="col-md-6 col-sm-6">
			<form action="StudentBPController" method="get">
			<div id="contact-form" class="form-container" data-form-container >
			<div class="row">
				<div class="form-title">
					<span>Student Boarding Point Changes</span>
				</div>
			</div>
			<div class="input-container">
				
				<div class="row">
					<span class="req-input">
						<span class="input-status" data-toggle="tooltip" data-placement="top" title="Please Input Student Register No."> </span>
						<input type="text" placeholder="Register No" required name=registerNo>
					</span>
				</div>
				<div class="row">
					<span class="req-input">
						<span class="input-status" data-toggle="tooltip" data-placement="top" title="Please Input Student Boarding Point."> </span>
						<input type="text" placeholder="Boarding Point" list="boardingPoint" required name=boardingPoint>
					</span>
				</div>
				<div class="row submit-row">
					<button type="submit" class="btn btn-block submit-form">Change</button>
				</div>
			</div>
			</div>
			</form>
			</div>
<div class="col-md-6 col-sm-6">
			<form action="StaffBPController" method="get">
			<div id="contact-form" class="form-container" data-form-container>
			<div class="row">
				<div class="form-title">
					<span>Staff Boarding Point Changes</span>
				</div>
			</div>
			<div class="input-container">
				
				<div class="row">
					<span class="req-input">
						<span class="input-status" data-toggle="tooltip" data-placement="top" title="Please Input Staff Id."> </span>
						<input type="text" placeholder="Staff Id" required name="staffid">
					</span>
				</div>
				<div class="row">
					<span class="req-input">
						<span class="input-status" data-toggle="tooltip" data-placement="top" title="Please Input Staff Boarding Point."> </span>
						<input type="text" placeholder="Boarding Point" list="boardingPoint" required name="boardingPoint">
					</span>
				</div>
				<div class="row submit-row">
					<button type="submit" class="btn btn-block submit-form">Change</button>
				</div>
			</div>
			</div>
			</form>
			</div>
	</div>
	</div>
<!end form>

 <datalist id="boardingPoint"> 
<%
Connection connection=ConnectionUtil.getconnection();
Statement statement=connection.createStatement();
String sql="select * from boardingpoint;";
ResultSet resultSet=statement.executeQuery(sql);
while(resultSet.next())
{
	%><option value="<%=resultSet.getString("bp") %>"><%;
}
%>

</datalist> 

<br><br>

<footer class="footer">
    <div class="container">
      <div class="row">
      <div class="col-lg-4 col-md-4 col-sm-5 col-xs-5">
        &copy Jeppiaar Engineering College
        </div>
         <div class="col-lg-3 col-md-3 col-sm-1 col-xs-1"></div>
         <div class="col-lg-5 col-md-5 col-sm-6 col-xs-6">
         Designed by Eugine(IT-department)
         </div>
        </div>
      </div>
</footer>

    
<!-- Bootstrap core JavaScript -->
        <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    
</body>
</html>