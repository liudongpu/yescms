package com.srnpr.yescms.member.model;

import com.srnpr.zapcom.baseannotation.ZapcomApi;
import com.srnpr.zapcom.topapi.RootInput;

public class UserInfoInput extends RootInput {

	@ZapcomApi(value = "手机号码", require = 1, verify = "base=mobile")
	private String memberPhone = "";
	@ZapcomApi(value = "真实姓名")
	private String realName = "";

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

}
