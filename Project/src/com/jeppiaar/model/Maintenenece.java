package com.jeppiaar.model;

import java.util.Date;

public class Maintenenece {
String vechileNo,vechileType,amount,reason;
Date date=new Date();
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
public String getAmount() {
	return amount;
}
@Override
public String toString() {
	return "Maintenenece [vechileNo=" + vechileNo + ", vechileType=" + vechileType + ", amount=" + amount + ", reason="
			+ reason + ", date=" + date + "]";
}
public void setAmount(String amount) {
	this.amount = amount;
}
public String getReason() {
	return reason;
}
public void setReason(String reason) {
	this.reason = reason;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}

}
