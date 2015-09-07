package com.srnpr.yescms.member.api;

import com.srnpr.yescms.member.model.MemberResetInput;
import com.srnpr.yescms.support.MemberSupport;
import com.srnpr.zapcom.basemodel.MDataMap;
import com.srnpr.zapcom.topapi.RootApi;
import com.srnpr.zapweb.webmodel.MWebResult;

public class MemberReset extends RootApi<MWebResult, MemberResetInput> {

	public MWebResult Process(MemberResetInput inputParam, MDataMap mRequestMap) {

		return new MemberSupport().memberReset(inputParam);
	}

}
