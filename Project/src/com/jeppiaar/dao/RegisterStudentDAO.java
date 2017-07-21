package com.jeppiaar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.jeppiaar.model.RegisterStudents;
import com.jeppiaar.model.Staff;
import com.jeppiaar.util.ConnectionUtil;

public class RegisterStudentDAO {
			public Boolean registerNoValidate(String registerNo) throws ClassNotFoundException, SQLException {
				ArrayList<String> arrayList=new ArrayList<String>();
				Connection connection=ConnectionUtil.getconnection();
				Statement statement=connection.createStatement();
				String sql="select registerno from student ;";
				ResultSet resultSet=statement.executeQuery(sql);
				while(resultSet.next())
				{
				arrayList.add(resultSet.getString("registerno"));	
				}
				for(String temp:arrayList){
					if(registerNo.equalsIgnoreCase(temp))
						return false;
						}
				return true;
				}	
			public Boolean boardingPointValidate(String boardingpoint) throws ClassNotFoundException, SQLException {
				ArrayList<String> arrayList=new ArrayList<String>();
				Connection connection=ConnectionUtil.getconnection();
				Statement statement=connection.createStatement();
				String sql="select bp from boardingpoint;";
				ResultSet resultSet=statement.executeQuery(sql);
				while(resultSet.next())
				{
				arrayList.add(resultSet.getString("bp"));	
				}
				for(String temp:arrayList){
					if(boardingpoint.equalsIgnoreCase(temp))
						return true;
						}
				return false;
				}	
	
	public void add(RegisterStudents registerStudents) throws Exception {
				Connection connection=ConnectionUtil.getconnection();
				String sql="insert into student (name,registerno,department,batch,boardingpoint) values(?,?,?,?,?);";
				PreparedStatement preparedStatement=connection.prepareStatement(sql);
				preparedStatement.setString(1,registerStudents.getName() );
				preparedStatement.setString(2, registerStudents.getRegisterNo());
				preparedStatement.setString(3, registerStudents.getDepartment());
				preparedStatement.setString(4, registerStudents.getBatch());
				preparedStatement.setString(5, registerStudents.getBoardingPoint());
				preparedStatement.executeUpdate();
				
			}
			public void deleteBatch(String batch) throws SQLException, ClassNotFoundException
			{
				Connection connection=ConnectionUtil.getconnection();
				String sql="delete from student where batch=?;";
				PreparedStatement preparedStatement=connection.prepareStatement(sql);
				preparedStatement.setString(1, batch);
				preparedStatement.executeUpdate();
				
			}
			public void deleteStudent(String registerNo) throws ClassNotFoundException, SQLException {
				Connection connection=ConnectionUtil.getconnection();
				String sql="delete from student where registerno=?;";
				PreparedStatement preparedStatement=connection.prepareStatement(sql);
				preparedStatement.setString(1, registerNo);
				preparedStatement.executeUpdate();
			}
			public void changeBoardingPoint(RegisterStudents registerStudents) throws ClassNotFoundException, SQLException {
				Connection connection=ConnectionUtil.getconnection();
				String sql="update student set boardingpoint=? where registerno=?;";
				PreparedStatement preparedStatement=connection.prepareStatement(sql);
				preparedStatement.setString(1, registerStudents.getBoardingPoint());
				preparedStatement.setString(2, registerStudents.getRegisterNo());
				preparedStatement.executeUpdate();
			}
			public Boolean validateBatch(String batch) throws ClassNotFoundException, SQLException {
				ArrayList<String> arrayList=new ArrayList<String>();
				Connection connection=ConnectionUtil.getconnection();
				Statement statement=connection.createStatement();
				String sql="select batch from student ;";
				ResultSet resultSet=statement.executeQuery(sql);
				while(resultSet.next())
				{
				arrayList.add(resultSet.getString("batch"));	
				}

				for(String temp:arrayList){
					if(batch.equals(temp))
						return true;
						}
				return false;
			}
			public void status(String department) throws ClassNotFoundException, SQLException {
				Connection connection=ConnectionUtil.getconnection();
				
				String status="update student set status='false' where department=? ;";
				PreparedStatement preparedStatement=connection.prepareStatement(status);
				
				preparedStatement.setString(1, department);
				preparedStatement.executeUpdate();
				
			}
			public Boolean updatestatus(String condition) throws ClassNotFoundException, SQLException {
				Connection connection = ConnectionUtil.getconnection();;
				String studentSql="update student set status='true' where "+condition+";";
				PreparedStatement preparedStatement=connection.prepareStatement(studentSql);
				preparedStatement.executeUpdate();
				return true;
			}
		//to see the date of attendence
			public void attendence(String department) throws ClassNotFoundException, SQLException {
Connection connection=ConnectionUtil.getconnection();
				
				String status="update attendence set date=now() where department=? ;";
				PreparedStatement preparedStatement=connection.prepareStatement(status);
				
				preparedStatement.setString(1, department);
				preparedStatement.executeUpdate();
				
			}

}
