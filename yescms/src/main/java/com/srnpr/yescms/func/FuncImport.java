package com.srnpr.yescms.func;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.lang.StringUtils;

import com.srnpr.zapcom.basemodel.MDataMap;
import com.srnpr.zapdata.dbdo.DbUp;
import com.srnpr.zapweb.helper.WebHelper;
import com.srnpr.zapweb.webdo.WebConst;
import com.srnpr.zapweb.webfunc.FuncAdd;
import com.srnpr.zapweb.webfunc.RootFunc;
import com.srnpr.zapweb.webmethod.WebUpload;
import com.srnpr.zapweb.webmodel.MWebResult;
import com.srnpr.zapweb.websupport.ExcelSupport;
import com.srnpr.zapweb.websupport.ZipSupport;

import freemarker.ext.beans.BeansWrapper.MethodAppearanceDecision;

public class FuncImport extends RootFunc {

	public MWebResult funcDo(String sOperateUid, MDataMap mDataMap) {
		MWebResult mWebResult = new MWebResult();
		MDataMap mAddMaps = mDataMap.upSubMap(WebConst.CONST_WEB_FIELD_NAME);

		if (mWebResult.upFlagTrue()) {
			mWebResult = new FuncAdd().funcDo(sOperateUid, mDataMap);

		}

		List<String> listError = new ArrayList<String>();

		if (mWebResult.upFlagTrue()) {

			String sFileExcel = mAddMaps.get("file_excel");

			if (StringUtils.isNotBlank(sFileExcel)) {

				try {
					List<MDataMap> listMaps = new ExcelSupport().upExcelFromUrl(sFileExcel);

					if (listMaps.size() > 0) {

						for (int iNowIndex = 0, jLength = listMaps.size(); iNowIndex < jLength; iNowIndex++) {

							MDataMap mExcelMap = listMaps.get(iNowIndex);

							int iTipNumber = iNowIndex + 2;

							MDataMap mInsertMap = new MDataMap();

							mInsertMap.put("code", StringUtils.defaultIfBlank(mExcelMap.get("图录号"), ""));
							

							mInsertMap.put("name", StringUtils.defaultIfBlank(mExcelMap.get("名称"), ""));
							mInsertMap.put("special_uid", mAddMaps.get("special_uid"));

							mInsertMap.put("size", StringUtils.defaultIfBlank(mExcelMap.get("尺寸"), ""));
							mInsertMap.put("assess_price", StringUtils.defaultIfBlank(mExcelMap.get("估价"), ""));
							mInsertMap.put("success_price", StringUtils.defaultIfBlank(mExcelMap.get("成交价"), "0"));
							mInsertMap.put("note", StringUtils.defaultIfBlank(mExcelMap.get("拍品介绍"), ""));
							mInsertMap.put("people_uid", StringUtils.defaultIfBlank(mExcelMap.get("所属名家"), ""));

							boolean bFlagInsert = true;
							if (StringUtils.isNotBlank(mInsertMap.get("code"))) {

							} else {

								listError.add(bInfo(965305017, iTipNumber));

								bFlagInsert = false;
							}

							if (StringUtils.isNotBlank(mInsertMap.get("people_uid"))) {
								MDataMap map = DbUp.upTable("yc_people").one("name",
										mInsertMap.get("people_uid").trim());

								if (map != null && map.size() > 0) {
									mInsertMap.put("people_uid", map.get("uid"));
								} else {
									bFlagInsert = false;
									listError.add(bInfo(965305015, iTipNumber));
								}

							}

							if (!StringUtils.isNumeric(mInsertMap.get("success_price"))) {
								listError.add(bInfo(965305016, iTipNumber));
							}

							if (bFlagInsert) {
								DbUp.upTable("yc_good").dataInsert(mInsertMap);
							}

						}

					}

				} catch (Exception e) {
					// TODO Auto-generated catch block
					listError.add(e.getMessage());
					e.printStackTrace();
				}

			}

		}

		if (mWebResult.upFlagTrue()) {
			String sFileZip = mAddMaps.get("file_zip");

			if (StringUtils.isNotBlank(sFileZip)) {

				try {
					Map<String, byte[]> map = new ZipSupport().upFilesFromZip(sFileZip);

					List<MDataMap> listMaps = DbUp.upTable("yc_good").queryByWhere("special_uid",
							mAddMaps.get("special_uid"));

					Map<String, TreeMap<String, String>> mUpdateMap = new HashMap<String, TreeMap<String, String>>();

					for (String sKey : map.keySet()) {

						if (sKey.contains("/")) {
							sKey = StringUtils.substringAfterLast(sKey, "/");
						}

						String sName = sKey;
						String sIndex = "0";
						sName = StringUtils.substringBefore(sName, ".");

						if (sName.contains("_")) {
							sName = StringUtils.substringBefore(sName, "_");

							sIndex = StringUtils.substringBetween(sKey, "_", ".");
						}

						if (!mUpdateMap.containsKey(sName)) {
							mUpdateMap.put(sName, new TreeMap<String, String>());
						}

						for (MDataMap mGoodMap : listMaps) {

							if (mGoodMap.get("code").equals(sName)) {
								MWebResult mUpload = WebUpload.create().remoteUpload("xx",
										WebHelper.upUuid() + "." + StringUtils.substringAfter(sKey, "."),
										map.get(sKey));

								mUpdateMap.get(sName).put(sIndex, mUpload.getResultObject().toString());

							}

						}

					}

					// 开始插入
					for (String sKey : mUpdateMap.keySet()) {

						MDataMap mU = new MDataMap("code", sKey, "file_url",
								StringUtils.join(mUpdateMap.get(sKey).values(), "|"));

						DbUp.upTable("yc_good").dataUpdate(mU, "file_url", "code");

					}

				} catch (Exception e) {
					listError.add(e.getMessage());
					e.printStackTrace();
				}

			}

		}

		if (listError.size() > 0) {
			mWebResult.inErrorMessage(965305014, StringUtils.join(listError, ";"));
		}

		return mWebResult;

	}

}
