package com.zzx.Utils;

import java.util.Date; 
import java.text.SimpleDateFormat; 

public class Tools {
	
	public String get_current_date() {
		
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = dateFormat.format( now ); 
		return currentDate;

	}
	
	public static void main(String[] args) {
		Tools tools = new Tools();
		System.out.println(tools.get_current_date());
	}

}
