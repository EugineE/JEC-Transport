package com.jeppiaar.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Vechile {
	String vechileNo, vechileType, fcAmount, insureneceAmount, roadtaxAmount, permitAmount;
	int kiloMeter, liter, fuelAmount;
	Date fcDate = null, insurenceDate = null, permitDate = null, roadtaxDate = null, fuelDate = null, start = null,
			end = null;

	public int getKiloMeter() {
		return kiloMeter;
	}

	public void setKiloMeter(int kiloMeter) {
		this.kiloMeter = kiloMeter;
	}

	public int getLiter() {
		return liter;
	}

	public void setLiter(int liter) {
		this.liter = liter;
	}

	public int getFuelAmount() {
		return fuelAmount;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public void setFuelAmount(int fuelAmount) {
		this.fuelAmount = fuelAmount;
	}

	public Date getFuelDate() {
		return fuelDate;
	}

	public void setFuelDate(Date fuelDate) {
		this.fuelDate = fuelDate;
	}

	@Override
	public String toString() {
		return "Vechile [vechileNo=" + vechileNo + ", vechileT ype=" + vechileType + ", fcAmount=" + fcAmount
				+ ", insureneceAmount=" + insureneceAmount + ", roadtaxAmount=" + roadtaxAmount + ", permitAmount="
				+ permitAmount + ", fcDate=" + fcDate + ", insurenceDate=" + insurenceDate + ", permitDate="
				+ permitDate + ", roadtaxDate=" + roadtaxDate + "]";
	}

	public String getInsureneceAmount() {
		return insureneceAmount;
	}

	public void setInsureneceAmount(String insureneceAmount) {
		this.insureneceAmount = insureneceAmount;
	}

	public String getRoadtaxAmount() {
		return roadtaxAmount;
	}

	public void setRoadtaxAmount(String roadtaxAmount) {
		this.roadtaxAmount = roadtaxAmount;
	}

	public String getPermitAmount() {
		return permitAmount;
	}

	public void setPermitAmount(String permitAmount) {
		this.permitAmount = permitAmount;
	}

	public Date getInsurenceDate() {
		return insurenceDate;
	}

	public void setInsurenceDate(Date insurenceDate) {
		this.insurenceDate = insurenceDate;
	}

	public Date getPermitDate() {
		return permitDate;
	}

	public void setPermitDate(Date permitDate) {
		this.permitDate = permitDate;
	}

	public Date getRoadtaxDate() {
		return roadtaxDate;
	}

	public void setRoadtaxDate(Date roadtaxDate) {
		this.roadtaxDate = roadtaxDate;
	}

	public String getVechileNo() {
		return vechileNo;
	}

	public void setVechileNo(String vechileNo) {
		this.vechileNo = vechileNo;
	}

	public String getVechileType() {
		return vechileType;
	}

	public void setVechileType(String vechileType) {
		this.vechileType = vechileType;
	}

	public String getFcAmount() {
		return fcAmount;
	}

	public void setFcAmount(String fcAmount) {
		this.fcAmount = fcAmount;
	}

	public Date getFcDate() {
		return fcDate;
	}

	public void setFcDate(Date fcDate) {
		this.fcDate = fcDate;
	}

}
