package com.ruoyi.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	private Date date;
	
	public DateUtil() {
		super();
		this.date = new Date();
	}
	
	public DateUtil(Date date) {
		super();
		this.date = date;
	}

	public Date getDate() {
		if(date==null) {
			date = new Date();
		}
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public String format(String pattern) {
		return new SimpleDateFormat(pattern).format(getDate());
	}
	
	public String getYear() {
		return format("yyyy");
	}
	
	public String getMonth() {
		return format("MM");
	}

	public String getDay() {
		return format("dd");
	}
	
	public String getDataStr() {
		return format("yyyy-MM-dd");
	}
	
	public String getDataCnStr() {
		return format("yyyy年MM月dd日");
	}
	
}
