package com.srnpr.yescms.member.api;

import com.srnpr.yescms.member.model.MemberForgetInput;
import com.srnpr.yescms.support.MemberSupport;
import com.srnpr.zapcom.basemodel.MDataMap;
import com.srnpr.zapcom.topapi.RootApi;
import com.srnpr.zapweb.webmodel.MWebResult;

public class MemberForget extends RootApi<MWebResult, MemberForgetInput> {

	public MWebResult Process(MemberForgetInput inputParam, MDataMap mRequestMap) {

		return new MemberSupport().memberForget(inputParam);
	}

}
