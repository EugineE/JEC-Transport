<%@page import="java.util.Comparator"%>
<%@page import="com.jeppiaar.model.ArraySt"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
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
$(document).ready(function() {

	   var docHeight = $(window).height();
	   var footerHeight = $('.footer').height();
	   var footerTop = $('.footer').position().top + footerHeight;

	   if (footerTop < docHeight) {
	    $('.footer').css('margin-top', 10+ (docHeight - footerTop) + 'px');
	   }
	  });
</script>
<style type="text/css">
.row {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display:         flex;
  flex-wrap: wrap;
}
.row > [class*='col-'] {
  display: flex;
  flex-direction: column;
}
</style>
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

<!count>
<%

//total no
int students=0;
//status

String busNo[]=(String[])request.getAttribute("msg");
String attendence="";

//System.out.println(bus.toString());
//end status
Connection connection=ConnectionUtil.getconnection();
Statement statement=connection.createStatement();
String studentdepartment[]=null,staffDepartment[]=null,batch[]=null;
if(busNo==null){
	String sql="truncate table combine_route;";
	statement.execute(sql);
	attendence=request.getParameter("attendence");
studentdepartment=request.getParameterValues("studentDepartment");
staffDepartment=request.getParameterValues("staffDepartment");
batch=request.getParameterValues("batch");
//System.out.println(studentdepartment.toString());
}
else
{
	attendence=(String)request.getAttribute("attendence");
	studentdepartment=(String[])request.getAttribute("studentdepartment");
	 staffDepartment=(String[])request.getAttribute("staffDepartment");
	 batch=(String[])request.getAttribute("batch");	
}
ArrayList<String> boardingPoints=new ArrayList<String>();
//start


if(attendence.equalsIgnoreCase("withAttendence"))
{
if(batch==null&&staffDepartment==null&&studentdepartment==null)
	%> <p>No item selected</p> <%
	else if(staffDepartment==null){
		for(int i=0;i<studentdepartment.length;i++){
			for(int j=0;j<batch.length;j++){
				String sql="select boardingpoint from student where department='"+studentdepartment[i]+"' AND batch='"+batch[j]+"' AND Status='true';";//
				ResultSet resultSet=statement.executeQuery(sql);
				while(resultSet.next())
				{
					boardingPoints.add(resultSet.getString("boardingpoint"));
				}		
			}
			
		}
	}
	else if(studentdepartment==null||batch==null){
		for(int i=0;i<staffDepartment.length;i++){
				String sql="select boardingpoint from staff where department='"+staffDepartment[i]+"' AND status='true';";//And Status='true'
				ResultSet resultSet=statement.executeQuery(sql);
				while(resultSet.next())
				{
					boardingPoints.add(resultSet.getString("boardingpoint"));
				}		
		}
	}
	else{
		for(int i=0;i<studentdepartment.length;i++){
			for(int j=0;j<batch.length;j++){
				String sql="select boardingpoint from student where department='"+studentdepartment[i]+"' AND batch='"+batch[j]+"' AND status='true';";//And Status='true'
				ResultSet resultSet=statement.executeQuery(sql);
				while(resultSet.next())
				{
					boardingPoints.add(resultSet.getString("boardingpoint"));
				}		
			}
			
		}
		for(int i=0;i<staffDepartment.length;i++){
			String sql="select boardingpoint from staff where department='"+staffDepartment[i]+"'AND status='true';";//And Status='true'
			ResultSet resultSet=statement.executeQuery(sql);
			while(resultSet.next())
			{
				boardingPoints.add(resultSet.getString("boardingpoint"));
			}		
		}
	}
}
else
{
	if(batch==null&&staffDepartment==null&&studentdepartment==null)
		%> <p>No item selected</p> <%
		else if(staffDepartment==null){
			for(int i=0;i<studentdepartment.length;i++){
				for(int j=0;j<batch.length;j++){
					String sql="select boardingpoint from student where department='"+studentdepartment[i]+"' AND batch='"+batch[j]+"' ;";//
					ResultSet resultSet=statement.executeQuery(sql);
					while(resultSet.next())
					{
						boardingPoints.add(resultSet.getString("boardingpoint"));
					}		
				}
				
			}
		}
		else if(studentdepartment==null||batch==null){
			for(int i=0;i<staffDepartment.length;i++){
					String sql="select boardingpoint from staff where department='"+staffDepartment[i]+"';";//And Status='true'
					ResultSet resultSet=statement.executeQuery(sql);
					while(resultSet.next())
					{
						boardingPoints.add(resultSet.getString("boardingpoint"));
					}		
			}
		}
		else{
			for(int i=0;i<studentdepartment.length;i++){
				for(int j=0;j<batch.length;j++){
					String sql="select boardingpoint from student where department='"+studentdepartment[i]+"' AND batch='"+batch[j]+"';";//And Status='true'
					ResultSet resultSet=statement.executeQuery(sql);
					while(resultSet.next())
					{
						boardingPoints.add(resultSet.getString("boardingpoint"));
					}		
				}
				
			}
			for(int i=0;i<staffDepartment.length;i++){
				String sql="select boardingpoint from staff where department='"+staffDepartment[i]+"';";//And Status='true'
				ResultSet resultSet=statement.executeQuery(sql);
				while(resultSet.next())
				{
					boardingPoints.add(resultSet.getString("boardingpoint"));
				}		
			}
		}	
}
//end
//System.out.println(boardingPoints);
Set<String> count=new HashSet<String>(boardingPoints);
TreeSet<String> duplicate=new TreeSet<String>();
String temp;
int number=0;
for(String key: count)
{
	int num=Collections.frequency(boardingPoints, key);
	temp=key+"="+num;
	number=number+num;	
duplicate.add(temp);
}
System.out.println(duplicate.toString());
%>
<div class="container">
<div class="row">
			<div class="col-md-4 col-sm-4">
			</div>
			<div class="col-md-4 col-sm-4">
			<h3><b>Bus Route</b></h3>
			</div>
			<div class="col-md-4 col-sm-4">
			</div>
</div>	
<form  method="get">
<div class="row">
<%


//status from the controller

	if(staffDepartment!=null&&studentdepartment!=null&&batch!=null){
	%>
	<input type="hidden" value="<%=ArraySt.st(studentdepartment) %>" name="studentdepartment">
	<input type="hidden" value="<%=ArraySt.st(staffDepartment) %>" name="staffDepartment">
	<input type="hidden" value="<%=ArraySt.st(batch) %>" name="batch">
	<input type="hidden" value="<%=attendence %>" name="attendence">
	<%
	}
	else if(staffDepartment!=null){
		%>
		
		<input type="hidden" value="<%=ArraySt.st(staffDepartment) %>" name="staffDepartment">
		<input type="hidden" value="<%=attendence %>" name="attendence">
		<%
		}
	else if(studentdepartment!=null&&batch!=null){
		%>
		<input type="hidden" value="<%=ArraySt.st(studentdepartment) %>" name="studentdepartment">
		<input type="hidden" value="<%=ArraySt.st(batch) %>" name="batch">
		<input type="hidden" value="<%=attendence %>" name="attendence">
		<%
		}
//combine route
if(busNo!=null){
	String route="select route_no from combine_route";
	ResultSet resultSet=statement.executeQuery(route);
	ArrayList<String> array=new ArrayList<String>();
	while(resultSet.next()){
		array.add(resultSet.getString(1));
	}
	
	for(String combine:array){
		int total=0;
		String routeNo[]=combine.split(",");
		ArrayList<String> arrayCombine=new ArrayList<String>();
		for(String num:routeNo){
			int i=Integer.parseInt(num);
			String sql="select bp from boardingpoint where bus_no="+i+";";
			resultSet=statement.executeQuery(sql);
			
			while(resultSet.next()){
				arrayCombine.add(resultSet.getString(1));
			}
		}
	
	//here
	%>
		<div class="col-md-4 col-sm-4 col-lg-4">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Combine-<%=combine %><input type="checkbox" name="combine" value="<%=combine %>" /></h3>
			</div>
		</div>
		<table class="table table-hover" id="dev-table">
				<thead>
					<tr>
					<th>Place</th>
					<th>Students</th>
					</tr>
				</thead>
				<%
				int p;
				String place,no;
				String eql="=";
				for(String list:arrayCombine){
				for(String set:duplicate )
				{
					p=set.indexOf(eql);
					place=set.substring(0, p);
					no=set.substring(p+1, set.length());
					if(list.equalsIgnoreCase(place)){
				
				%>
				<tbody>
					<tr>
						<td><%=place%></td>
						<td><%=no %></td>
					</tr>
	<%
			String bp="update boardingpoint set total='"+no+"' where bp='"+place+"';";
			statement.executeUpdate(bp);
			int c=Integer.parseInt(no);
			total+=c;
			students+=c;
			
					}
				}
				}
				%>
				<tr>
						<td><b>Total</b></td>
						<td><b><%=total %></b></td>
					</tr>
				</tbody>
				</table>
				</div>
				
				
	<%
	}
	}
	//end
	
	//normal bus route
for(int i=1;i<=42;i++)
{
	if(busNo!=null){
		Arrays.sort(busNo,new Comparator<String>(){
			@Override
			public int compare(String o1,String o2){
				return Integer.valueOf(o1).compareTo(Integer.valueOf(o2));
			}
		});
	for(String no:busNo)
		{
			int j=Integer.parseInt(no);
			if(j==i)
				i++;
		}
	}
	if(i>42)
	{
		continue;
	}
	
	int total=0;
	String sql="select bp from boardingpoint where bus_no="+i+";";
	ResultSet resultSet=statement.executeQuery(sql);
	ArrayList<String> arrayList=new ArrayList<String>();
	while(resultSet.next()){
		arrayList.add(resultSet.getString(1));
	}
	if(busNo!=null){
	String pre=ArraySt.st(busNo);
	
%>
		<input type="hidden" value="<%=pre %>" name="previous">	
		<%} %>	
			<div class="col-md-4 col-sm-4 col-lg-4">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">BusNo-<%=i %><input type="checkbox" name="busNo" value="<%=i %>" /></h3>
					</div>
				</div>
				<table class="table table-hover" id="dev-table">
						<thead>
							<tr>
							<th>Place</th>
							<th>Students</th>
							</tr>
						</thead>
						<%
						int p;
						String place,no;
						String eql="=";
						for(String list:arrayList){
						for(String set:duplicate )
						{
							p=set.indexOf(eql);
							place=set.substring(0, p);
							no=set.substring(p+1, set.length());
							if(list.equalsIgnoreCase(place)){
						
						%>
						<tbody>
							<tr>
								<td><%=place%></td>
								<td><%=no %></td>
							</tr>
<%
					String bp="update boardingpoint set total='"+no+"' where bp='"+place+"';";
					statement.executeUpdate(bp);
					int c=Integer.parseInt(no);
					total+=c;
					students+=c;
					
							}
						}
						}
						%>
						<tr>
								<td><b>Total</b></td>
								<td><b><%=total %></b></td>
							</tr>
						</tbody>
						</table>
						</div>
						
						
<%
}
%>


</div>
<div class=row>
<div class="col-md-2 col-sm-2"></div>
<div class="col-md-4 col-sm-4">
<center><button type="submit" class="btn btn-primary" formaction="BusController">Combine</button></center>
</div>
<div class="col-md-4 col-sm-4">
<center><button type="submit" class="btn btn-primary" formaction="Result.jsp">Route List</button></center>
</div>
<div class="col-md-2 col-sm-2"></div>
</div>
</form>
<div class="row">
<h3>Total no of students=<%=students %></h3>
</div>
</div>
<!end count>
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