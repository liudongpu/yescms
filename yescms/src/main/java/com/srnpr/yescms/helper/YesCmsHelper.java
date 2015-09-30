package com.srnpr.yescms.helper;

import org.apache.commons.lang.StringUtils;

import com.srnpr.zapcom.basehelper.RegexHelper;

public class YesCmsHelper {

	public static String formatHtml(String sString)

	{

		return sString.replaceAll("\\<html.*html\\>", "");

	}
	
	
	
	
	public static String formatLink(String sString)
	{
		return StringUtils.replace(sString, "/ycsite/", "/ycwap/");
	}
	
	

}
