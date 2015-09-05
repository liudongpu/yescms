package com.srnpr.yescms.member.api;

import com.srnpr.yescms.member.model.MemberRegInput;
import com.srnpr.yescms.member.model.MemberResult;
import com.srnpr.yescms.support.MemberSupport;
import com.srnpr.zapcom.basemodel.MDataMap;
import com.srnpr.zapcom.topapi.RootApi;
import com.srnpr.zapweb.webapi.RootApiForManage;

public class MemberReg extends RootApi<MemberResult, MemberRegInput> {

	public MemberResult Process(MemberRegInput inputParam, MDataMap mRequestMap) {

		return new MemberSupport().memberReginster(inputParam);
	}

}
