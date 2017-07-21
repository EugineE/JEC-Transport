<%@page import="com.jeppiaar.util.ConnectionUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.jeppiaar.model.Vechile"%>
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
       
<!-- end of navigator -->

<%
if(request.getAttribute("vechileNo")!=null){
	
Vechile vechile=(Vechile)request.getAttribute("vechileNo");
String sql="select * from fc where vechile_no=? and (fc_date>=? and fc_date<=?) order by fc_date ASC;";
Connection connection=ConnectionUtil.getconnection();
PreparedStatement preparedStatement=connection.prepareStatement(sql);
preparedStatement.setString(1, vechile.getVechileNo());
preparedStatement.setDate(2,  new java.sql.Date(vechile.getStart().getTime()));
preparedStatement.setDate(3,  new java.sql.Date(vechile.getEnd().getTime()));
ResultSet resultSet=preparedStatement.executeQuery();
int i=0;

while(resultSet.next())
{
	//System.out.println("hi");
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
					<th><center>Sno</center></th>
					<th><center>Vechile No</center></th>
					<th><center>Vechile Type</center></th>
					<th><center>FC Date</center></th>
					<th><center>FC Amount</center></th>
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
String sql1="select * from roadtax where vechile_no=? and roadtax_date>=? and roadtax_date<=? order by roadtax_date ASC;";
preparedStatement=connection.prepareStatement(sql1);
preparedStatement.setString(1, vechile.getVechileNo());
preparedStatement.setDate(2,  new java.sql.Date(vechile.getStart().getTime()));
preparedStatement.setDate(3,  new java.sql.Date(vechile.getEnd().getTime()));
resultSet=preparedStatement.executeQuery();
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
					<th><center>Sno</center></th>
					<th><center>Vechile No</center></th>
					<th><center>Vechile Type</center></th>
					<th><center>Payment Date</center></th>
					<th><center>Payment Amount</center></th>
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
String sql2="select * from insurence where vechile_no=? and insurence_date>=? and insurence_date<=? order by insurence_date ASC;";
preparedStatement=connection.prepareStatement(sql2);
preparedStatement.setString(1, vechile.getVechileNo());
preparedStatement.setDate(2,  new java.sql.Date(vechile.getStart().getTime()));
preparedStatement.setDate(3,  new java.sql.Date(vechile.getEnd().getTime()));
resultSet=preparedStatement.executeQuery();
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
					<th><center>Sno</center></th>
					<th><center>Vechile No</center></th>
					<th><center>Vechile Type</center></th>
					<th><center>Payment Date</center></th>
					<th><center>Payment Amount</center></th>
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
String sql3="select * from permit  where vechile_no=? and permit_date>=? and permit_date<=? order by permit_date ASC;";
preparedStatement=connection.prepareStatement(sql3);
preparedStatement.setString(1, vechile.getVechileNo());
preparedStatement.setDate(2,  new java.sql.Date(vechile.getStart().getTime()));
preparedStatement.setDate(3,  new java.sql.Date(vechile.getEnd().getTime()));
resultSet=preparedStatement.executeQuery();
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
					<th><center>Sno</center></th>
					<th><center>Vechile No</center></th>
					<th><center>Vechile Type</center></th>
					<th><center>Payment Date</center></th>
					<th><center>Payment Amount</center></th>
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

<%}
else if(request.getAttribute("vechileType")!=null){
	
	Vechile vechile=(Vechile)request.getAttribute("vechileType");
	String sql="select * from fc where vechile_type=? and (fc_date>=? and fc_date<=?) order by fc_date ASC;";
	Connection connection=ConnectionUtil.getconnection();
	PreparedStatement preparedStatement=connection.prepareStatement(sql);
	preparedStatement.setString(1, vechile.getVechileType());
	preparedStatement.setDate(2,  new java.sql.Date(vechile.getStart().getTime()));
	preparedStatement.setDate(3,  new java.sql.Date(vechile.getEnd().getTime()));
	ResultSet resultSet=preparedStatement.executeQuery();
	int i=0;

	while(resultSet.next())
	{
		//System.out.println("hi");
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
						<th><center>Sno</center></th>
						<th><center>Vechile No</center></th>
						<th><center>Vechile Type</center></th>
						<th><center>FC Date</center></th>
						<th><center>FC Amount</center></th>
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
	String sql1="select * from roadtax where vechile_type=? and roadtax_date>=? and roadtax_date<=? order by roadtax_date ASC;";
	preparedStatement=connection.prepareStatement(sql1);
	preparedStatement.setString(1, vechile.getVechileType());
	preparedStatement.setDate(2,  new java.sql.Date(vechile.getStart().getTime()));
	preparedStatement.setDate(3,  new java.sql.Date(vechile.getEnd().getTime()));
	resultSet=preparedStatement.executeQuery();
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
						<th><center>Sno</center></th>
						<th><center>Vechile No</center></th>
						<th><center>Vechile Type</center></th>
						<th><center>Payment Date</center></th>
						<th><center>Payment Amount</center></th>
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
	String sql2="select * from insurence where vechile_type=? and insurence_date>=? and insurence_date<=? order by insurence_date ASC;";
	preparedStatement=connection.prepareStatement(sql2);
	preparedStatement.setString(1, vechile.getVechileType());
	preparedStatement.setDate(2,  new java.sql.Date(vechile.getStart().getTime()));
	preparedStatement.setDate(3,  new java.sql.Date(vechile.getEnd().getTime()));
	resultSet=preparedStatement.executeQuery();
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
						<th><center>Sno</center></th>
						<th><center>Vechile No</center></th>
						<th><center>Vechile Type</center></th>
						<th><center>Payment Date</center></th>
						<th><center>Payment Amount</center></th>
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
	String sql3="select * from permit  where vechile_type=? and permit_date>=? and permit_date<=? order by permit_date ASC;";
	preparedStatement=connection.prepareStatement(sql3);
	preparedStatement.setString(1, vechile.getVechileType());
	preparedStatement.setDate(2,  new java.sql.Date(vechile.getStart().getTime()));
	preparedStatement.setDate(3,  new java.sql.Date(vechile.getEnd().getTime()));
	resultSet=preparedStatement.executeQuery();
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
						<th><center>Sno</center></th>
						<th><center>Vechile No</center></th>
						<th><center>Vechile Type</center></th>
						<th><center>Payment Date</center></th>
						<th><center>Payment Amount</center></th>
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

	<%}
else if(request.getAttribute("all")!=null){
	
	Vechile vechile=(Vechile)request.getAttribute("all");
	String sql="select * from fc where (fc_date>=? and fc_date<=?) order by fc_date ASC;";
	Connection connection=ConnectionUtil.getconnection();
	PreparedStatement preparedStatement=connection.prepareStatement(sql);
	preparedStatement.setDate(1,  new java.sql.Date(vechile.getStart().getTime()));
	preparedStatement.setDate(2,  new java.sql.Date(vechile.getEnd().getTime()));
	ResultSet resultSet=preparedStatement.executeQuery();
	int i=0;

	while(resultSet.next())
	{
		//System.out.println("hi");
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
						<th><center>Sno</center></th>
						<th><center>Vechile No</center></th>
						<th><center>Vechile Type</center></th>
						<th><center>FC Date</center></th>
						<th><center>FC Amount</center></th>
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
	String sql1="select * from roadtax where  roadtax_date>=? and roadtax_date<=? order by roadtax_date ASC;";
	preparedStatement=connection.prepareStatement(sql1);
	preparedStatement.setDate(1,  new java.sql.Date(vechile.getStart().getTime()));
	preparedStatement.setDate(2,  new java.sql.Date(vechile.getEnd().getTime()));
	resultSet=preparedStatement.executeQuery();
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
						<th><center>Sno</center></th>
						<th><center>Vechile No</center></th>
						<th><center>Vechile Type</center></th>
						<th><center>Payment Date</center></th>
						<th><center>Payment Amount</center></th>
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
	String sql2="select * from insurence where insurence_date>=? and insurence_date<=? order by insurence_date ASC;";
	preparedStatement=connection.prepareStatement(sql2);
	preparedStatement.setDate(1,  new java.sql.Date(vechile.getStart().getTime()));
	preparedStatement.setDate(2,  new java.sql.Date(vechile.getEnd().getTime()));
	resultSet=preparedStatement.executeQuery();
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
						<th><center>Sno</center></th>
						<th><center>Vechile No</center></th>
						<th><center>Vechile Type</center></th>
						<th><center>Payment Date</center></th>
						<th><center>Payment Amount</center></th>
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
	String sql3="select * from permit  where permit_date>=? and permit_date<=? order by permit_date ASC;";
	preparedStatement=connection.prepareStatement(sql3);
	preparedStatement.setDate(1,  new java.sql.Date(vechile.getStart().getTime()));
	preparedStatement.setDate(2,  new java.sql.Date(vechile.getEnd().getTime()));
	resultSet=preparedStatement.executeQuery();
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
						<th><center>Sno</center></th>
						<th><center>Vechile No</center></th>
						<th><center>Vechile Type</center></th>
						<th><center>Payment Date</center></th>
						<th><center>Payment Amount</center></th>
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

	<%}


%>



</div></div>


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