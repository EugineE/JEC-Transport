package com.jeppiaar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.jeppiaar.model.Staff;
import com.jeppiaar.util.ConnectionUtil;

public class RegisterStaff {
	public void add(Staff staff) throws ClassNotFoundException, SQLException {
		Connection connection=ConnectionUtil.getconnection();
		String sql="insert into staff(name,staffId,department,boardingpoint) values(?,?,?,?);";
		PreparedStatement preparedStatement=connection.prepareStatement(sql);
		preparedStatement.setString(1, staff.getName());
		preparedStatement.setString(2, staff.getStaffId());
		preparedStatement.setString(3, staff.getDepartment());
		preparedStatement.setString(4, staff.getBoardingPoint());
		preparedStatement.executeUpdate();
	}
	public Boolean validateStaffId(String staffId) throws SQLException, ClassNotFoundException {
		ArrayList<String> arrayList=new ArrayList<String>();
		Connection connection=ConnectionUtil.getconnection();
		Statement statement=connection.createStatement();
		String sql="select staffId from staff ;";
		ResultSet resultSet=statement.executeQuery(sql);
		while(resultSet.next())
		{
		arrayList.add(resultSet.getString("staffId"));	
		}
		for(String temp:arrayList){
			if(staffId.equals(temp))
				return false;
				}
		
		return true;
	}
	public Boolean validateStaffBoardingPoint(String boardingPoint) throws SQLException, ClassNotFoundException {
		ArrayList<String> arrayList=new ArrayList<String>();
		Connection connection=ConnectionUtil.getconnection();
		Statement statement=connection.createStatement();
		String sql="select bp from boardingpoint;";
		ResultSet resultSet=statement.executeQuery(sql);
		while(resultSet.next())
		{
		arrayList.add(resultSet.getString("bp"));	
		}
		System.out.println(arrayList);
		for(String temp:arrayList){
			if(boardingPoint.equals(temp))
				return true;
				}
		return false;
	}
	public void changeBoardingPoint(Staff staff) throws ClassNotFoundException, SQLException {
		Connection connection=ConnectionUtil.getconnection();
		String sql="update staff set boardingpoint=? where staffId=?;";
		PreparedStatement preparedStatement=connection.prepareStatement(sql);
		preparedStatement.setString(1, staff.getBoardingPoint());
		preparedStatement.setString(2, staff.getStaffId());
		preparedStatement.executeUpdate();
	}
	public void deleteStaff(String staffId) throws ClassNotFoundException, SQLException {
		Connection connection=ConnectionUtil.getconnection();
		String sql="delete from staff where staffId=?;";
		PreparedStatement preparedStatement=connection.prepareStatement(sql);
		preparedStatement.setString(1, staffId);
		preparedStatement.executeUpdate();
	}
	public void status(String department) throws ClassNotFoundException, SQLException {
		Connection connection=ConnectionUtil.getconnection();
		
		String status="update staff set status=? where department=?;";
		PreparedStatement preparedStatement=connection.prepareStatement(status);
		preparedStatement.setString(1,"false");
		preparedStatement.setString(2, department);
		preparedStatement.executeUpdate();
	}
	public Boolean updatestatus(String condition) throws ClassNotFoundException, SQLException {
		Connection connection = ConnectionUtil.getconnection();;
		String staffSql="update staff set status='true' where "+condition+";";
		PreparedStatement preparedStatement=connection.prepareStatement(staffSql);
		preparedStatement.executeUpdate();
		return true;
	}
}
