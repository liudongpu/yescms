package com.srnpr.yescms.helper;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;

import com.srnpr.zapcom.basehelper.RegexHelper;

public class YesCmsHelper {

	public static String formatHtml(String sString)

	{
		return StringUtils.replace(
				StringUtils.replace(sString, StringUtils.substringBetween(sString, "<html", "</html>"), ">"),
				"<html></html>", "");

	}

	public static String formatLink(String sString) {
		return StringUtils.replace(sString, "/ycsite/", "/ycwap/");
	}

}
