package com.srnpr.yescms;

import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.srnpr.zapcom.basehelper.EncodeHelper;
import com.srnpr.zapcom.basehelper.TestHelper;
import com.srnpr.zapcom.basemodel.MDataMap;
import com.srnpr.zapweb.webmethod.WebUpload;
import com.srnpr.zapweb.webmodel.MWebField;
import com.srnpr.zapweb.webmodel.MWebResult;
import com.srnpr.zapweb.websupport.ExcelSupport;
import com.srnpr.zapweb.websupport.ImageMagicSupport;
import com.srnpr.zapweb.websupport.ZipSupport;

/**
 * Unit test for simple App.
 */
public class AppTest extends TestHelper

{

	public void testBase() {
		bLogTest(EncodeHelper.urlEncode(
				"http://image.sycdn.ichsy.com/cfiles/staticfiles/upload/24d86/68ed0bcbde134f29ab2d0ce90fb650c9.jpg||"));

	}

	public void testImage() {

		try {

			ImageMagicSupport imageMagicSupport = new ImageMagicSupport();
			bLogTest(imageMagicSupport.zoomImage(
					"http://image.sycdn.ichsy.com/cfiles/staticfiles/upload/24d86/68ed0bcbde134f29ab2d0ce90fb650c9.jpg",
					640, 90).getFileUrl());

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	public void testZip() {

		try {
			Map<String, byte[]> map = new ZipSupport().upFilesFromZip(
					"http://img.jkcdn.yxl9.cn/sfiles/upload/24d7e/4f3bd298a98849ed983d41891eeed91d.zip");

			for (String sKey : map.keySet()) {

				/*
				 * MWebResult mResult = WebUpload.create() .remoteUpload("xx",
				 * "xx.jpg", map.get(sKey));
				 * 
				 * bLogTest(mResult.getResultObject().toString());
				 * 
				 */

				bLogTest(sKey);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	public void testExcel() {

		try {
			List<MDataMap> listMaps = new ExcelSupport().upExcelFromUrl(
					"http://img.jkcdn.yxl9.cn/sfiles/upload/24d7e/acfa0b4eabc343e59bd54b7d0017206f.xls");

			bLogTest(listMaps.get(0).get("表头2"));

			bLogTest(listMaps);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
