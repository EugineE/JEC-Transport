<%@page import="com.jeppiaar.dao.RegisterStaff"%>
<%@page import="com.jeppiaar.dao.RegisterStudentDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jeppiaar.util.ConnectionUtil"%>
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
function se(temp,st)
{
	
    var checkbox=document.getElementsByClassName(st);	
    
    for(var i=0;i<checkbox.length;i++){
		var cb=document.getElementById(checkbox[i].id);
		cb.checked=temp.checked;
	
	}
}
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

<!-- status -->
<%
String department=(String)session.getAttribute("userName");
Connection connection=ConnectionUtil.getconnection();
Statement statement=connection.createStatement();
String batch[]=(String[])session.getAttribute("batch");
String all[]={"AERO","BIO-TECH","CSE","CIVIL","E&I","ECE","EEE","IT","MECH"};
%>
<div class="container">
<div class="row">
<div class="col-md-4 col-sm-3">  </div>
<div class="col-md-4 col-sm-6">
<h3><%=department %> Department </h3>
</div>
<div class="col-md-4 col-sm-3">  </div>
</div>
</div>
<div class="container">
<div class="row">
<form action="StatusController" method="get">
<input type="hidden" name="department" value="<%=department %>" >
<%
if(department.equals("LIBRARY")==false)
{
if(department.equals("S&H"))
{
	for(int j=0;j<all.length;j++)
for(int i=0;i<batch.length;i++)
{
	if(department.equals("S&H"))
		department=all[j];
	%>
	
	
	<div class="col-lg-6 col-md-6 col-sm-6">
	<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title"><%=department %> <%=batch[i] %></h3>
						</div>
					</div>
					<table class="table table-hover" id="dev-table">
						<thead>
							<tr>
								<th>SNo</th>
								<th>Name</th>
								<th>RegisterNo</th>
								<th>Status <input type="checkbox" id="master"  onchange="se(this,'<%=department+batch[i] %>')" /> </th>
							</tr>
						</thead>
						<tbody>
							
							
	
	
	
	<%
String sql="select name,registerno from student where department='"+department+"' AND batch='"+batch[i]+"' ;";	
ResultSet resultSet=statement.executeQuery(sql);
int sno=1;
while(resultSet.next())
{
%>
	<tr>
		<td><%=sno %></td>
		<td><%=resultSet.getString("name")%></td>
		<td><%=resultSet.getString("registerno")%></td>
		<td><input type="checkbox" name="status" class="<%=department+batch[i] %>" id="<%=department+batch[i]+sno %>" value="<%=resultSet.getString("registerno")%>"  /></td>
	</tr>
<%
sno++;
}
%>
</tbody>
</table>
</div>


<%
if(department.equals(all[j]))
	department="S&H";
}
}
else{
	
	for(int i=0;i<batch.length;i++)
	{
		
		%>
		
		
		<div class="col-lg-6 col-md-6 col-sm-6">
		<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title"><%=department %> <%=batch[i] %></h3>
							</div>
						</div>
						<table class="table table-hover" id="dev-table">
							<thead>
								<tr>
									<th>SNo</th>
									<th>Name</th>
									<th>RegisterNo</th>
									<th>Status <input type="checkbox" id="master"  onchange="se(this,'<%=department+batch[i] %>')" /> </th>
								</tr>
							</thead>
							<tbody>
								
								
		
		
		
		<%
	String sql="select name,registerno from student where department='"+department+"' AND batch='"+batch[i]+"' ;";	
	ResultSet resultSet=statement.executeQuery(sql);
	int sno=1;
	while(resultSet.next())
	{
	%>
		<tr>
			<td><%=sno %></td>
			<td><%=resultSet.getString("name")%></td>
			<td><%=resultSet.getString("registerno")%></td>
			<td><input type="checkbox" name="status" class="<%=department+batch[i] %>" id="<%=department+batch[i]+sno %>" value="<%=resultSet.getString("registerno")%>"  /></td>
		</tr>
	<%
	sno++;
	}
	%>
	</tbody>
	</table>
	</div>


	<%
	}
}	
}
%>
	<div class="col-lg-6 col-md-6 col-sm-6">
	<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title"><%=department %> Staffs</h3>
						</div>
					</div>
					<table class="table table-hover" id="dev-table">
						<thead>
							<tr>
								<th>SNo</th>
								<th>Name</th>
								<th>Staff Id</th>
								<th>Status <input type="checkbox" id="master"  onchange="se(this,'<%=department%>Staff')" > </th>
							</tr>
						</thead>
						<tbody>
<%
String sqlStaff="select name,staffId from staff where department='"+department+"';";	
ResultSet resultSet=statement.executeQuery(sqlStaff);
int snoStaff=1;
while(resultSet.next())
{
	%>
	<tr>
		<td><%=snoStaff %></td>
		<td><%=resultSet.getString("name")%></td>
		<td><%=resultSet.getString("staffId")%></td>
		<td><input type="checkbox" name="staffStatus" class="<%=department%>Staff" id="<%=department+snoStaff %>" value="<%=resultSet.getString("staffId")%>"  /></td>
	</tr>
<%
snoStaff++;
}
%>
</tbody>
</table>
</div>
 </div>

<center><button type="submit" class="btn btn-primary">Update</button></center>
<div class="container">
<div class="row">
           &nbsp
</div>

</div>
 </div>

</form>
<!-- end status -->
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