package com.srnpr.yescms.member.model;

import com.srnpr.zapcom.baseannotation.ZapcomApi;
import com.srnpr.zapcom.topapi.RootInput;

public class MemberLoginInput extends RootInput {

	@ZapcomApi(value = "用户名", require = 1)
	private String loginName = "";
	@ZapcomApi(value = "密 码", require = 1)
	private String loginPassword = "";

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginPassword() {
		return loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

}
