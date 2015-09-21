package com.srnpr.yescms.bu.api;

import com.srnpr.yescms.bu.model.UserSendAddInput;
import com.srnpr.zapcom.basehelper.FormatHelper;
import com.srnpr.zapcom.basehelper.MapHelper;
import com.srnpr.zapcom.basemodel.MDataMap;
import com.srnpr.zapcom.basesupport.MapSupport;
import com.srnpr.zapcom.basesupport.SerializeSupport;
import com.srnpr.zapdata.dbdo.DbUp;
import com.srnpr.zapweb.webapi.RootApiForToken;
import com.srnpr.zapweb.webapi.RootResultWeb;

public class UserSendAdd extends RootApiForToken<RootResultWeb, UserSendAddInput> {

	public RootResultWeb Process(UserSendAddInput inputParam, MDataMap mRequestMap) {
		RootResultWeb result = new RootResultWeb();

		MDataMap map = new MapSupport().formatObject(inputParam);

		map.inAllValues("member_code", getUserCode(), "login_name", getOauthInfo().getLoginName(), "create_time",
				FormatHelper.upDateTime());
		DbUp.upTable("mc_user_send").dataInsert(map);

		return result;
	}

}
