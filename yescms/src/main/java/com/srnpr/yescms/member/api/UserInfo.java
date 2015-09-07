package com.srnpr.yescms.member.api;

import com.srnpr.yescms.member.model.UserInfoInput;
import com.srnpr.yescms.support.MemberSupport;
import com.srnpr.zapcom.basemodel.MDataMap;
import com.srnpr.zapdata.dbdo.DbUp;
import com.srnpr.zapweb.webapi.RootApiForToken;
import com.srnpr.zapweb.webmodel.MWebResult;

public class UserInfo extends RootApiForToken<MWebResult, UserInfoInput> {

	public MWebResult Process(UserInfoInput inputParam, MDataMap mRequestMap) {

		return new MemberSupport().userInfo(inputParam, getUserCode());
	}

}
