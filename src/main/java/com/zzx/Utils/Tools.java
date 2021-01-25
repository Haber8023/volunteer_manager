package com.zzx.Utils;

import java.util.Date; 
import java.text.SimpleDateFormat; 
import java.util.zip.CRC32;

public class Tools {
	
	public String get_current_date() {
		
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = dateFormat.format( now ); 
		return currentDate;

	}
	
	public static String stringToCRC32(String str) {
		byte[] tx_buff = str.getBytes();
		CRC32 crc32 = new CRC32();
        crc32.update(tx_buff);
        int valueTen = (int)crc32.getValue();
        return Integer.toHexString(valueTen);
	}
	
	public static void main(String[] args) {
		// Tools tools = new Tools();
		// System.out.println(tools.get_current_date());
		String str = "1234567890";
		
		System.out.println(stringToCRC32(str));
	}

}
