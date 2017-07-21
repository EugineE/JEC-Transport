package com.jeppiaar.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;

import com.jeppiaar.model.ArraySt;
import com.jeppiaar.util.ConnectionUtil;

public class Route {
	public void combine(String busNo[]) throws ClassNotFoundException, SQLException {
		Arrays.sort(busNo,new Comparator<String>(){
			@Override
			public int compare(String o1,String o2){
				return Integer.valueOf(o1).compareTo(Integer.valueOf(o2));
			}
		});
		String value=ArraySt.st(busNo);
		String sql="insert into combine_route(route_no) value('"+value+"');";
		Connection connection=ConnectionUtil.getconnection();
		Statement statement=connection.createStatement();
		statement.execute(sql);
	}
	public void combingRoutes(String combine,String busNo[]) throws SQLException, ClassNotFoundException {
		 String No[]=combine.split(",");
		ArrayList<String> arrayList=new ArrayList<String>();
		for(String temp:busNo)
			arrayList.add(temp);
		for(String temp:No)
			arrayList.add(temp);
		String bus[]=(String[]) arrayList.toArray(new String[0]);
		 Arrays.sort(bus,new Comparator<String>(){
				@Override
				public int compare(String o1,String o2){
					return Integer.valueOf(o1).compareTo(Integer.valueOf(o2));
				}
			});
		 String value=ArraySt.st(bus);
		 System.out.println(value);
		 String sql="update combine_route set route_no='"+value+"' where route_no='"+combine+"';";
		 Connection connection=ConnectionUtil.getconnection();
			Statement statement=connection.createStatement();
			statement.executeUpdate(sql);
	}
	
	//Add route
	public void addRoute(String busNO,String boardingPoint) throws ClassNotFoundException, SQLException {
		String sql="insert into boardingpoint values("+Integer.parseInt(busNO)+",'"+boardingPoint+"','"+0+"');";
		Connection connection=ConnectionUtil.getconnection();
		Statement statement=connection.createStatement();
		statement.execute(sql);
	}
}
