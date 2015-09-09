package com.srnpr.yescms.component;

import com.srnpr.zapcom.basemodel.MDataMap;
import com.srnpr.zapweb.webcomponent.ComponentWindowSingle;
import com.srnpr.zapweb.webmodel.MWebField;

public class PeopleSingleSelect extends ComponentWindowSingle {

	public String upText(MWebField mWebField, MDataMap mDataMap, int iType) {

		mWebField.setSourceParam(
				"zw_s_max_select=1&zw_s_source_tableinfo=yc_people|uid|name&zw_s_source_page=page_chart_w_yc_people");

		return upShowText(mWebField, mDataMap, iType);
	}

}
