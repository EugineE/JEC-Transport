<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jeppiaar.util.ConnectionUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
<%
if(session.getAttribute("userName")==null){
	response.sendRedirect("Login.jsp");
}
%>
<!-- logo image -->
    <img alt="..." src="Image/web%20page.png" class="logo-img" >
<!-- end of logo image -->    
  
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
        <li><a href="Login.jsp?logout="logout"" >Logout</a></li>
      </ul>
    </div>
     
    </div>
       
<!-- end of navigator -->
    
    
<!-- Carousel -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="Image/home.jpg" alt="First slide">
         </div>
        <div class="item">
          <img class="second-slide" src="Image/pic.jpg" alt="Second slide">
        </div>
        <div class="item">
          <img class="third-slide" src="Image/bus.jpg" alt="Third slide">
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    <!-- end carousel -->
<!-- Fc status -->

<%
DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
Calendar calendar=Calendar.getInstance();
Date date =calendar.getTime();
String systemDate=dateFormat.format(date).toString();
int day=Integer.parseInt(systemDate.substring(0,2));
if(day>=20){
	calendar.add(calendar.MONTH, 2);
	calendar.set(Calendar.DATE, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
	Date nextMonth=	calendar.getTime();
	//System.out.println(new java.sql.Date(nextMonth.getTime()));
Connection connection=ConnectionUtil.getconnection();
Statement statement=connection.createStatement();
//System.out.println(new java.sql.Date(nextMonth.getTime()));
String sql="select * from fc where fc_date<'"+new java.sql.Date(nextMonth.getTime())+"' and status='false' order by fc_date ASC;";
ResultSet resultSet=statement.executeQuery(sql);
int i=0;
%>

<%
while(resultSet.next())
{
	if(i==0){
%>
</br></br>
<div class="container">

<div class="row">

<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Fc Vechile List</h3>
			</div>
		</div>
		<table class="table table-hover" id="dev-table">
				<thead>
					<tr>
					<th>Sno</th>
					<th>Vechile No</th>
					<th>Vechile Type</th>
					<th>FC Date</th>
					<th>FC Amount</th>
					</tr>
				</thead>
				<tbody>
<%}%>
<tr>
<td ><%=i+1 %></td>
<td ><%=resultSet.getString(2) %></td>
<td ><%=resultSet.getString(3) %></td>
<td ><%=resultSet.getDate(4) %></td>
<td ><%=resultSet.getString(5) %></td>
</tr>
<%
i++;
}
%>
</tbody>
</table>

<%

//Road tax
String sql1="select * from roadtax where roadtax_date<'"+new java.sql.Date(nextMonth.getTime())+"' and status='false' order by roadtax_date ASC;";
resultSet=statement.executeQuery(sql1);
int j=0;

while(resultSet.next())
{
	if(j==0){
		%>
		<br><br>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Road Tax Vechile List</h3>
			</div>
		</div>
		<table class="table table-hover" id="dev-table">
				<thead>
					<tr>
					<th>Sno</th>
					<th>Vechile No</th>
					<th>Vechile Type</th>
					<th>Payment Date</th>
					<th>Payment Amount</th>
					</tr>
				</thead>
				<tbody>
		<%}%>
<tr>
<td ><%=j+1 %></td>
<td ><%=resultSet.getString(2) %></td>
<td ><%=resultSet.getString(3) %></td>
<td ><%=resultSet.getDate(4) %></td>
<td ><%=resultSet.getString(5) %></td>
</tr>
		<%
		j++;
		}
%>
</tbody>
</table>

<%
//Insurence
String sql2="select * from insurence where insurence_date<'"+new java.sql.Date(nextMonth.getTime())+"' and status='false' order by insurence_date ASC;";
resultSet=statement.executeQuery(sql2);
int k=0;

while(resultSet.next())
{
	if(k==0){
		%>
		<br><br>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Insurence Vechile List</h3>
			</div>
		</div>
		<table class="table table-hover" id="dev-table">
				<thead>
					<tr>
					<th>Sno</th>
					<th>Vechile No</th>
					<th>Vechile Type</th>
					<th>Payment Date</th>
					<th>Payment Amount</th>
					</tr>
				</thead>
				<tbody>
		<%}%>
		<tr>
<td ><%=k+1 %></td>
<td ><%=resultSet.getString(2) %></td>
<td ><%=resultSet.getString(3) %></td>
<td ><%=resultSet.getDate(4) %></td>
<td ><%=resultSet.getString(5) %></td>
</tr>
<%
		k++;
		}
%>
</tbody>
</table>

<%
//Permit
String sql3="select * from permit where permit_date<'"+new java.sql.Date(nextMonth.getTime())+"' and status='false' order by permit_date ASC;";
resultSet=statement.executeQuery(sql3);
int l=0;

while(resultSet.next())
{
	if(l==0){
		%>
		<br><br>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Permit Vechile List</h3>
			</div>
		</div>
		<table class="table table-hover" id="dev-table">
				<thead>
					<tr>
					<th>Sno</th>
					<th>Vechile No</th>
					<th>Vechile Type</th>
					<th>Payment Date</th>
					<th>Payment Amount</th>
					</tr>
				</thead>
				<tbody>
		<%}%>
		<tr>
<td ><%=l+1 %></td>
<td ><%=resultSet.getString(2) %></td>
<td ><%=resultSet.getString(3) %></td>
<td ><%=resultSet.getDate(4) %></td>
<td ><%=resultSet.getString(5) %></td>
</tr>
<%
		l++;
		}
%>
</tbody>
</table>

<%
}

else{
	
	Date nextMonth=	calendar.getTime();
	//System.out.println(new java.sql.Date(nextMonth.getTime()));
Connection connection=ConnectionUtil.getconnection();
Statement statement=connection.createStatement();
//System.out.println(new java.sql.Date(nextMonth.getTime()));
String sql="select * from fc where fc_date<'"+new java.sql.Date(nextMonth.getTime())+"' and status='false' order by fc_date ASC;";
ResultSet resultSet=statement.executeQuery(sql);
int i=0;
%>

<%
while(resultSet.next())
{
	if(i==0){
%>
</br></br>
<div class="container">

<div class="row">

<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Fc Vechile List</h3>
			</div>
		</div>
		<table class="table table-hover" id="dev-table">
				<thead>
					<tr>
					<th>Sno</th>
					<th>Vechile No</th>
					<th>Vechile Type</th>
					<th>FC Date</th>
					<th>FC Amount</th>
					</tr>
				</thead>
				<tbody>
<%}%>
<tr>
<td ><%=i+1 %></td>
<td ><%=resultSet.getString(2) %></td>
<td ><%=resultSet.getString(3) %></td>
<td ><%=resultSet.getDate(4) %></td>
<td ><%=resultSet.getString(5) %></td>
</tr>
<%
i++;
}
%>
</tbody>
</table>

<%

//Road tax
String sql1="select * from roadtax where roadtax_date<'"+new java.sql.Date(nextMonth.getTime())+"' and status='false' order by roadtax_date ASC;";
resultSet=statement.executeQuery(sql1);
int j=0;

while(resultSet.next())
{
	if(j==0){
		%>
		<br><br>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Road Tax Vechile List</h3>
			</div>
		</div>
		<table class="table table-hover" id="dev-table">
				<thead>
					<tr>
					<th>Sno</th>
					<th>Vechile No</th>
					<th>Vechile Type</th>
					<th>Payment Date</th>
					<th>Payment Amount</th>
					</tr>
				</thead>
				<tbody>
		<%}%>
<tr>
<td ><%=j+1 %></td>
<td ><%=resultSet.getString(2) %></td>
<td ><%=resultSet.getString(3) %></td>
<td ><%=resultSet.getDate(4) %></td>
<td ><%=resultSet.getString(5) %></td>
</tr>
		<%
		j++;
		}
%>
</tbody>
</table>

<%
//Insurence
String sql2="select * from insurence where insurence_date<'"+new java.sql.Date(nextMonth.getTime())+"' and status='false' order by insurence_date ASC;";
resultSet=statement.executeQuery(sql2);
int k=0;

while(resultSet.next())
{
	if(k==0){
		%>
		<br><br>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Insurence Vechile List</h3>
			</div>
		</div>
		<table class="table table-hover" id="dev-table">
				<thead>
					<tr>
					<th>Sno</th>
					<th>Vechile No</th>
					<th>Vechile Type</th>
					<th>Payment Date</th>
					<th>Payment Amount</th>
					</tr>
				</thead>
				<tbody>
		<%}%>
		<tr>
<td ><%=k+1 %></td>
<td ><%=resultSet.getString(2) %></td>
<td ><%=resultSet.getString(3) %></td>
<td ><%=resultSet.getDate(4) %></td>
<td ><%=resultSet.getString(5) %></td>
</tr>
<%
		k++;
		}
%>
</tbody>
</table>

<%
//Permit
String sql3="select * from permit where permit_date<'"+new java.sql.Date(nextMonth.getTime())+"' and status='false' order by permit_date ASC;";
resultSet=statement.executeQuery(sql3);
int l=0;

while(resultSet.next())
{
	if(l==0){
		%>
		<br><br>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Permit Vechile List</h3>
			</div>
		</div>
		<table class="table table-hover" id="dev-table">
				<thead>
					<tr>
					<th>Sno</th>
					<th>Vechile No</th>
					<th>Vechile Type</th>
					<th>Payment Date</th>
					<th>Payment Amount</th>
					</tr>
				</thead>
				<tbody>
		<%}%>
		<tr>
<td ><%=l+1 %></td>
<td ><%=resultSet.getString(2) %></td>
<td ><%=resultSet.getString(3) %></td>
<td ><%=resultSet.getDate(4) %></td>
<td ><%=resultSet.getString(5) %></td>
</tr>
<%
		l++;
		}
%>
</tbody>
</table>

<%
		}

%>
</div>
</div>

<!-- end of Fc status -->
<!-- features -->
 <br>

    <div class="container">

      <!-- Three columns of text below the carousel -->
      <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
          <img class="img-circle" src="Image/fuel.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>Fueling</h2>
          <p></p>
          <p><a class="btn btn-primary" href="fuel.jsp" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
          <img class="img-circle" src="Image/maintenance.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>Maintenance</h2>
          <p><a class="btn btn-primary" href="Maintenance.jsp" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
          <img class="img-circle" src="Image/detials.png" alt="Generic placeholder image" width="140" height="140">
          <h2>Vechile Detials</h2>
          <p><a class="btn btn-primary" href="VechileDetials.jsp" role="button">View details &raquo;</a></p>
        </div>
      </div>
</div>

<!-- end features -->
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