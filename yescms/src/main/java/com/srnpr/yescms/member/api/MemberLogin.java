package com.srnpr.yescms.member.api;

import com.srnpr.yescms.member.model.MemberLoginInput;
import com.srnpr.yescms.member.model.MemberRegInput;
import com.srnpr.yescms.member.model.MemberResult;
import com.srnpr.yescms.support.MemberSupport;
import com.srnpr.zapcom.basemodel.MDataMap;
import com.srnpr.zapcom.topapi.RootApi;

public class MemberLogin extends RootApi<MemberResult, MemberLoginInput> {

	public MemberResult Process(MemberLoginInput inputParam,
			MDataMap mRequestMap) {

		return new MemberSupport().memberLogin(inputParam);
	}

}
