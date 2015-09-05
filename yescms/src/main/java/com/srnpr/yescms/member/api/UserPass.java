package com.srnpr.yescms.member.api;

import org.apache.commons.lang.StringUtils;

import com.srnpr.yescms.member.model.UserPassInput;
import com.srnpr.yescms.support.MemberSupport;
import com.srnpr.zapcom.basemodel.MDataMap;
import com.srnpr.zapweb.webapi.RootApiForToken;
import com.srnpr.zapweb.webmodel.MWebResult;

public class UserPass extends RootApiForToken<MWebResult, UserPassInput> {

	public MWebResult Process(UserPassInput inputParam, MDataMap mRequestMap) {

		return new MemberSupport().userPass(inputParam, getUserCode());
	}

}
