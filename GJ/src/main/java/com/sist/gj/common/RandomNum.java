package com.sist.gj.common;

import java.util.Calendar;

public class RandomNum {
	Calendar cd = Calendar.getInstance();
	
	public String makeRandom() {
		String time = "";
		time +=cd.get(Calendar.YEAR);
		time +=cd.get(Calendar.MONTH)+1;
		time +=cd.get(Calendar.DATE);
		time +=cd.get(Calendar.HOUR_OF_DAY);
		time +=cd.get(Calendar.MINUTE);
		time +=cd.get(Calendar.SECOND);
		return time;
	}
}
