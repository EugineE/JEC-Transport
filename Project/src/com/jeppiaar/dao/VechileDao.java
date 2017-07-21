package com.jeppiaar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import com.jeppiaar.model.Maintenenece;
import com.jeppiaar.model.Vechile;
import com.jeppiaar.util.ConnectionUtil;

public class VechileDao {
		public void add(Vechile vechile) throws ClassNotFoundException, SQLException {
			Connection connection=ConnectionUtil.getconnection();
			
			String fc="insert into fc(vechile_no,vechile_type,fc_date,fc_amount) values(?,?,?,?);";
			String insurence="insert into insurence(vechile_no,vechile_type,insurence_date,insurence_amount) values(?,?,?,?);";
			String roadtax="insert into roadtax(vechile_no,vechile_type,roadtax_date,roadtax_amount) values(?,?,?,?);";
			String permit="insert into permit(vechile_no,vechile_type,permit_date,permit_amount) values(?,?,?,?);";
			PreparedStatement preparedStatement=connection.prepareStatement(fc);
			preparedStatement.setString(1, vechile.getVechileNo());
			preparedStatement.setString(2, vechile.getVechileType());
			preparedStatement.setDate(3,new java.sql.Date(vechile.getFcDate().getTime()) );
			preparedStatement.setString(4, vechile.getFcAmount());
			preparedStatement.executeUpdate();
			preparedStatement=connection.prepareStatement(insurence);
			preparedStatement.setString(1, vechile.getVechileNo());
			preparedStatement.setString(2, vechile.getVechileType());
			preparedStatement.setDate(3,new java.sql.Date(vechile.getInsurenceDate().getTime()));
			preparedStatement.setString(4, vechile.getInsureneceAmount());
			preparedStatement.executeUpdate();
			preparedStatement=connection.prepareStatement(roadtax);
			preparedStatement.setString(1, vechile.getVechileNo());
			preparedStatement.setString(2, vechile.getVechileType());
			preparedStatement.setDate(3,new java.sql.Date(vechile.getRoadtaxDate().getTime()) );
			preparedStatement.setString(4, vechile.getRoadtaxAmount());
			preparedStatement.executeUpdate();
			preparedStatement=connection.prepareStatement(permit);
			preparedStatement.setString(1, vechile.getVechileNo());
			preparedStatement.setString(2, vechile.getVechileType());
			preparedStatement.setDate(3,new java.sql.Date(vechile.getPermitDate().getTime()));
			preparedStatement.setString(4, vechile.getPermitAmount());
			preparedStatement.executeUpdate();
			String Sql2="insert into vechile_detials(vechile_no,vechile_type) values(?,?);";
			PreparedStatement preparedStatement1=connection.prepareStatement(Sql2);
			preparedStatement1.setString(1, vechile.getVechileNo());
			preparedStatement1.setString(2, vechile.getVechileType());
			preparedStatement1.executeUpdate();

			
		}
		public void update(Vechile vechile) throws SQLException, ClassNotFoundException {
			Connection connection=ConnectionUtil.getconnection();
			String update="update fc set status='true' where vechile_No='"+vechile.getVechileNo()+"';";
			PreparedStatement statement=connection.prepareStatement(update);
			statement.executeUpdate();
			
			String Sql="insert into fc(vechile_no,vechile_type,fc_date,fc_amount) values(?,?,?,?);";
			PreparedStatement preparedStatement=connection.prepareStatement(Sql);
			preparedStatement.setString(1, vechile.getVechileNo());
			preparedStatement.setString(2, vechile.getVechileType());
			preparedStatement.setDate(3,new java.sql.Date(vechile.getFcDate().getTime()) );
			preparedStatement.setString(4, vechile.getFcAmount());
			preparedStatement.executeUpdate();	
		}
		public void roadtax(Vechile vechile) throws SQLException, ClassNotFoundException {
			Connection connection=ConnectionUtil.getconnection();
			String update="update roadtax set status='true' where vechile_No='"+vechile.getVechileNo()+"';";
			PreparedStatement statement=connection.prepareStatement(update);
			statement.executeUpdate();
			
			String Sql="insert into roadtax(vechile_no,vechile_type,roadtax_date,roadtax_amount) values(?,?,?,?);";
			PreparedStatement preparedStatement=connection.prepareStatement(Sql);
			preparedStatement.setString(1, vechile.getVechileNo());
			preparedStatement.setString(2, vechile.getVechileType());
			preparedStatement.setDate(3,new java.sql.Date(vechile.getRoadtaxDate().getTime()) );
			preparedStatement.setString(4, vechile.getRoadtaxAmount());
			preparedStatement.executeUpdate();	
		}
		public void insurence(Vechile vechile) throws SQLException, ClassNotFoundException {
			Connection connection=ConnectionUtil.getconnection();
			String update="update insurence set status='true' where vechile_No='"+vechile.getVechileNo()+"';";
			PreparedStatement statement=connection.prepareStatement(update);
			statement.executeUpdate();
			
			String Sql="insert into insurence(vechile_no,vechile_type,insurence_date,insurence_amount) values(?,?,?,?);";
			PreparedStatement preparedStatement=connection.prepareStatement(Sql);
			preparedStatement.setString(1, vechile.getVechileNo());
			preparedStatement.setString(2, vechile.getVechileType());
			preparedStatement.setDate(3,new java.sql.Date(vechile.getInsurenceDate().getTime()) );
			preparedStatement.setString(4, vechile.getInsureneceAmount());
			preparedStatement.executeUpdate();	
		}
		public void permit(Vechile vechile) throws SQLException, ClassNotFoundException {
			Connection connection=ConnectionUtil.getconnection();
			String update="update permit set status='true' where vechile_No='"+vechile.getVechileNo()+"';";
			PreparedStatement statement=connection.prepareStatement(update);
			statement.executeUpdate();
			
			String Sql="insert into permit(vechile_no,vechile_type,permit_date,permit_amount) values(?,?,?,?);";
			PreparedStatement preparedStatement=connection.prepareStatement(Sql);
			preparedStatement.setString(1, vechile.getVechileNo());
			preparedStatement.setString(2, vechile.getVechileType());
			preparedStatement.setDate(3,new java.sql.Date(vechile.getPermitDate().getTime()) );
			preparedStatement.setString(4, vechile.getPermitAmount());
			preparedStatement.executeUpdate();	
		}
		public void maintain(Maintenenece maintenenece) throws SQLException, ClassNotFoundException {
Connection connection=ConnectionUtil.getconnection();
			
			String Sql="insert into maintenance(vechile_no,vechile_type,date,amount,reason) values(?,?,?,?,?);";
			PreparedStatement preparedStatement=connection.prepareStatement(Sql);
			preparedStatement.setString(1, maintenenece.getVechileNo());
			preparedStatement.setString(2, maintenenece.getVechileType());
			preparedStatement.setDate(3,new java.sql.Date(maintenenece.getDate().getTime()) );
			preparedStatement.setString(4, maintenenece.getAmount());
			preparedStatement.setString(5, maintenenece.getReason());
			preparedStatement.executeUpdate();
		}
		public Boolean validateNo(String vechileNo) throws SQLException, ClassNotFoundException {
			Connection connection=ConnectionUtil.getconnection();
			Statement statement=connection.createStatement();
			String sql="select * from vechile_detials where vechile_no='"+vechileNo+"';";
			ResultSet resultSet=statement.executeQuery(sql);
			if(resultSet.next())
				return false;
			return true;
		}
		public void fuel(Vechile vechile) throws ClassNotFoundException, SQLException {
			Connection connection=ConnectionUtil.getconnection();
			String Sql="insert into fuel(vechile_no,kilometer,liters,date,amount,vechile_type) values(?,?,?,?,?,?);";
			PreparedStatement preparedStatement=connection.prepareStatement(Sql);
			preparedStatement.setString(1, vechile.getVechileNo());
			preparedStatement.setInt(2, vechile.getKiloMeter());
			preparedStatement.setInt(3, vechile.getLiter());
			preparedStatement.setDate(4, new java.sql.Date(vechile.getFuelDate().getTime()));
			preparedStatement.setInt(5, vechile.getFuelAmount());
			preparedStatement.setString(6, vechile.getVechileType());
			preparedStatement.executeUpdate();
		}
}
