<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.jeppiaar.util.ConnectionUtil"%>
<%@page import="java.util.Comparator"%>
<%@page import="com.jeppiaar.model.ArraySt"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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
String sql="select route_no from combine_route;";
Connection connection=ConnectionUtil.getconnection();
Statement statement=connection.createStatement();
ArrayList<String> combine=new ArrayList<String>();
ArrayList<Integer> No=new ArrayList<Integer>();
ResultSet resultSet=statement.executeQuery(sql);
while(resultSet.next()){
	combine.add(resultSet.getString(1));
}
%>
<div class="container">

<div class="row">
<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Bus Route</h3>
			</div>
		</div>
		<table class="table table-hover" id="dev-table">
				<thead>
					<tr>
					<th>Bus</th>
					<th><center>Route</center></th>
					</tr>
				</thead>

<%

for(String temp:combine){
String busNo[]=temp.split(",");
String route="";
%> 
<tbody>
				<tr>
					<td><%=temp %></td>
					
					

<%
for(String var:busNo){
	int i=Integer.parseInt(var);
	No.add(i);
	String bp="select bp from boardingpoint where bus_no="+i+";";
	resultSet=statement.executeQuery(bp);
	while(resultSet.next()){
		route+=resultSet.getString(1)+",";
	}
}
%>
<td><%=route %></td>
	</tr>
<%
}
Collections.sort(No);
for(int i=1;i<43;i++){
	String busRoute="";
	for(int temp:No){
		if(i==temp)
			i++;
	}
	if(i>42)
	{
		continue;
	}
	String bp="select bp from boardingpoint where bus_no="+i+";";
	resultSet=statement.executeQuery(bp);
	while(resultSet.next()){
		busRoute+=resultSet.getString(1)+",";
	}
	%>
	<tr>
		<td>BusNo<%=i %></td>
		<td><%=busRoute %></td>
	</tr>	
	<%
}
%>
</tbody>
</table>

<a href="excel.jsp?exportToExcel=YES">Export To Excel</a>

</div>
</div>

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