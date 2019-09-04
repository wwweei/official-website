package com.wuchen.website.util;

import org.apache.commons.codec.digest.DigestUtils;

public class MD5Util {

	public static String EncoderByMD5(String pwd) {
		String md5_pwd = "";
		md5_pwd = DigestUtils.md5Hex(pwd);
		return md5_pwd;
	}
	
	public static boolean verifyPwd(String pwd, String md5_pwd) {
		if (DigestUtils.md5Hex(pwd).equals(md5_pwd))
			return true;
		return false;
	}
	
}
