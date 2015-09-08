package com.srnpr.yescms.component;

import com.srnpr.zapcom.basemodel.MDataMap;
import com.srnpr.zapweb.webcomponent.ComponentWindowSingle;
import com.srnpr.zapweb.webmodel.MWebField;

public class MemberSingleSelect extends ComponentWindowSingle {

	public String upText(MWebField mWebField, MDataMap mDataMap, int iType) {

		mWebField
				.setSourceParam("zw_s_max_select=1&zw_s_source_tableinfo=mc_member_info|member_code|member_email&zw_s_source_page=page_chart_w_mc_member_info");

		return upShowText(mWebField, mDataMap, iType);
	}

}
