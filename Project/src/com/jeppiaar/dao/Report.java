package com.jeppiaar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jeppiaar.model.Maintenenece;
import com.jeppiaar.model.Vechile;
import com.jeppiaar.util.ConnectionUtil;

public class Report {
	public List<Vechile> fuelReportByNo(Vechile vechile) throws ClassNotFoundException, SQLException {

		String sql = "select vechile_no,vechile_type,kilometer,liters,date,amount from fuel where vechile_no=? and (date>=? and date<=?) order by vechile_no DESC,date ASC; ";
		Connection connection = ConnectionUtil.getconnection();

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, vechile.getVechileNo());
		preparedStatement.setDate(2, new java.sql.Date(vechile.getStart().getTime()));
		preparedStatement.setDate(3, new java.sql.Date(vechile.getEnd().getTime()));
		ResultSet set = preparedStatement.executeQuery();
		List<Vechile> list = new ArrayList<Vechile>();
		while (set.next()) {
			Vechile vechile2 = new Vechile();
			vechile2.setVechileNo(set.getString(1));
			vechile2.setVechileType(set.getString(2));
			vechile2.setKiloMeter(set.getInt(3));
			vechile2.setLiter(set.getInt(4));
			vechile2.setFuelDate(set.getDate(5));
			vechile2.setFuelAmount(set.getInt(6));
			list.add(vechile2);

		}
		return list;
	}

	public List<Vechile> fuelReportByType(Vechile vechile) throws ClassNotFoundException, SQLException {
		System.out.println("hi");
		String sql = "select vechile_no,vechile_type,kilometer,liters,date,amount from fuel where vechile_type=? and date between ? and ? order by date ASC; ";
		Connection connection = ConnectionUtil.getconnection();
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, vechile.getVechileType());
		preparedStatement.setDate(2, new java.sql.Date(vechile.getStart().getTime()));
		preparedStatement.setDate(3, new java.sql.Date(vechile.getEnd().getTime()));
		ResultSet set = preparedStatement.executeQuery();
		List<Vechile> list = new ArrayList<Vechile>();
		while (set.next()) {
			Vechile vechile2 = new Vechile();
			vechile2.setVechileNo(set.getString(1));
			vechile2.setVechileType(set.getString(2));
			vechile2.setKiloMeter(set.getInt(3));
			vechile2.setLiter(set.getInt(4));
			vechile2.setFuelDate(set.getDate(5));
			vechile2.setFuelAmount(set.getInt(6));
			list.add(vechile2);

		}
		return list;
	}

	public List<Vechile> fuelReportAll(Vechile vechile) throws ClassNotFoundException, SQLException {
		System.out.println("hi");
		String sql = "select vechile_no,vechile_type,kilometer,liters,date,amount from fuel where date between ? and ? order by date ASC; ";
		Connection connection = ConnectionUtil.getconnection();
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		
		preparedStatement.setDate(1, new java.sql.Date(vechile.getStart().getTime()));
		preparedStatement.setDate(2, new java.sql.Date(vechile.getEnd().getTime()));
		ResultSet set = preparedStatement.executeQuery();
		List<Vechile> list = new ArrayList<Vechile>();
		while (set.next()) {
			Vechile vechile2 = new Vechile();
			vechile2.setVechileNo(set.getString(1));
			vechile2.setVechileType(set.getString(2));
			vechile2.setKiloMeter(set.getInt(3));
			vechile2.setLiter(set.getInt(4));
			vechile2.setFuelDate(set.getDate(5));
			vechile2.setFuelAmount(set.getInt(6));
			list.add(vechile2);

		}
		return list;
	}
	public List<Maintenenece> maintenanceReportByType(Vechile vechile) throws ClassNotFoundException, SQLException {

		String sql = "select vechile_no,vechile_type,date,reason,amount from maintenance where vechile_type=? and (date>=? and date<=?) order by vechile_no DESC,date ASC; ";
		Connection connection = ConnectionUtil.getconnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, vechile.getVechileType());
		preparedStatement.setDate(2, new java.sql.Date(vechile.getStart().getTime()));
		preparedStatement.setDate(3, new java.sql.Date(vechile.getEnd().getTime()));
		ResultSet set = preparedStatement.executeQuery();
		List<Maintenenece> list = new ArrayList<Maintenenece>();
		while (set.next()) {
			Maintenenece vechile2 = new Maintenenece();
			vechile2.setVechileNo(set.getString(1));
			vechile2.setVechileType(set.getString(2));
			vechile2.setDate(set.getDate(3));
			vechile2.setReason(set.getString(4));
			vechile2.setAmount(set.getString(5));
			
			list.add(vechile2);

		}
		return list;
	}

	public List<Maintenenece> maintenanceReportAll(Vechile vechile) throws ClassNotFoundException, SQLException {

		String sql = "select vechile_no,vechile_type,date,reason,amount from maintenance where (date>=? and date<=?) order by vechile_no DESC,date ASC; ";
		Connection connection = ConnectionUtil.getconnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		
		preparedStatement.setDate(1, new java.sql.Date(vechile.getStart().getTime()));
		preparedStatement.setDate(2, new java.sql.Date(vechile.getEnd().getTime()));
		ResultSet set = preparedStatement.executeQuery();
		List<Maintenenece> list = new ArrayList<Maintenenece>();
		while (set.next()) {
			Maintenenece vechile2 = new Maintenenece();
			vechile2.setVechileNo(set.getString(1));
			vechile2.setVechileType(set.getString(2));
			vechile2.setDate(set.getDate(3));
			vechile2.setReason(set.getString(4));
			vechile2.setAmount(set.getString(5));
			list.add(vechile2);

		}
		return list;
	}
	public List<Maintenenece> maintenanceReportByNo(Vechile vechile) throws ClassNotFoundException, SQLException {

		String sql = "select vechile_no,vechile_type,date,reason,amount from maintenance where vechile_no=? and date between ? and ? order by date ASC; ";
		Connection connection = ConnectionUtil.getconnection();
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, vechile.getVechileNo());
		preparedStatement.setDate(2, new java.sql.Date(vechile.getStart().getTime()));
		preparedStatement.setDate(3, new java.sql.Date(vechile.getEnd().getTime()));
		ResultSet set = preparedStatement.executeQuery();
		List<Maintenenece> list = new ArrayList<Maintenenece>();
		while (set.next()) {
			Maintenenece vechile2 = new Maintenenece();
			vechile2.setVechileNo(set.getString(1));
			vechile2.setVechileType(set.getString(2));
			vechile2.setDate(set.getDate(3));
			vechile2.setReason(set.getString(4));
			vechile2.setAmount(set.getString(5));

			list.add(vechile2);

		}
		return list;
	}
	
	
	public List<Vechile> paymentReportByNo(Vechile vechile) throws ClassNotFoundException, SQLException {

		String sql = "select vechile_no,vechile_type,kilometer,liters,date,amount from fuel where vechile_no=? and (date>=? and date<=?) order by vechile_no DESC,date ASC; ";
		Connection connection = ConnectionUtil.getconnection();

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, vechile.getVechileNo());
		preparedStatement.setDate(2, new java.sql.Date(vechile.getStart().getTime()));
		preparedStatement.setDate(3, new java.sql.Date(vechile.getEnd().getTime()));
		ResultSet set = preparedStatement.executeQuery();
		List<Vechile> list = new ArrayList<Vechile>();
		while (set.next()) {
			Vechile vechile2 = new Vechile();
			vechile2.setVechileNo(set.getString(1));
			vechile2.setVechileType(set.getString(2));
			vechile2.setKiloMeter(set.getInt(3));
			vechile2.setLiter(set.getInt(4));
			vechile2.setFuelDate(set.getDate(5));
			vechile2.setFuelAmount(set.getInt(6));
			list.add(vechile2);

		}
		return list;
	}

	public List<Vechile> paymentReportByType(Vechile vechile) throws ClassNotFoundException, SQLException {
		System.out.println("hi");
		String sql = "select vechile_no,vechile_type,kilometer,liters,date,amount from fuel where vechile_type=? and date between ? and ? order by date ASC; ";
		Connection connection = ConnectionUtil.getconnection();
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, vechile.getVechileType());
		preparedStatement.setDate(2, new java.sql.Date(vechile.getStart().getTime()));
		preparedStatement.setDate(3, new java.sql.Date(vechile.getEnd().getTime()));
		ResultSet set = preparedStatement.executeQuery();
		List<Vechile> list = new ArrayList<Vechile>();
		while (set.next()) {
			Vechile vechile2 = new Vechile();
			vechile2.setVechileNo(set.getString(1));
			vechile2.setVechileType(set.getString(2));
			vechile2.setKiloMeter(set.getInt(3));
			vechile2.setLiter(set.getInt(4));
			vechile2.setFuelDate(set.getDate(5));
			vechile2.setFuelAmount(set.getInt(6));
			list.add(vechile2);

		}
		return list;
	}

	public List<Vechile> paymentReportAll(Vechile vechile) throws ClassNotFoundException, SQLException {
		System.out.println("hi");
		String sql = "select vechile_no,vechile_type,kilometer,liters,date,amount from fuel where date between ? and ? order by date ASC; ";
		Connection connection = ConnectionUtil.getconnection();
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		
		preparedStatement.setDate(1, new java.sql.Date(vechile.getStart().getTime()));
		preparedStatement.setDate(2, new java.sql.Date(vechile.getEnd().getTime()));
		ResultSet set = preparedStatement.executeQuery();
		List<Vechile> list = new ArrayList<Vechile>();
		while (set.next()) {
			Vechile vechile2 = new Vechile();
			vechile2.setVechileNo(set.getString(1));
			vechile2.setVechileType(set.getString(2));
			vechile2.setKiloMeter(set.getInt(3));
			vechile2.setLiter(set.getInt(4));
			vechile2.setFuelDate(set.getDate(5));
			vechile2.setFuelAmount(set.getInt(6));
			list.add(vechile2);

		}
		return list;
	}
}
