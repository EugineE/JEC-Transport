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
<title>Excel</title>
</head>
<body>
<%//excel
		String exportToExcel = request.getParameter("exportToExcel");
		if (exportToExcel != null
				&& exportToExcel.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "inline; filename="
					+ "excel.xls");

		}
	
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
	
	
	
	<table border="5px">
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
					<td><center><%=temp %></center></td>
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
	
</body>
</html>