package com.srnpr.yescms.member.api;

import com.srnpr.yescms.member.model.UserInfoInput;
import com.srnpr.zapcom.basemodel.MDataMap;
import com.srnpr.zapdata.dbdo.DbUp;
import com.srnpr.zapweb.webapi.RootApiForToken;
import com.srnpr.zapweb.webmodel.MWebResult;

public class UserInfo extends RootApiForToken<MWebResult, UserInfoInput> {

	public MWebResult Process(UserInfoInput inputParam, MDataMap mRequestMap) {

		MDataMap mDataMap = new MDataMap("member_phone",
				inputParam.getMemberPhone(), "real_name",
				inputParam.getRealName(), "member_code", getUserCode());

		DbUp.upTable("mc_member_info").dataUpdate(mDataMap,
				"member_phone,real_name", "member_code");

		return new MWebResult();
	}

}
