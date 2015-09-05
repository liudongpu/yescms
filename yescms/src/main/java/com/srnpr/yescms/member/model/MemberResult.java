package com.srnpr.yescms.member.model;

import com.srnpr.zapcom.baseannotation.ZapcomApi;
import com.srnpr.zapweb.webapi.RootResultWeb;

public class MemberResult extends RootResultWeb {

	@ZapcomApi(value = "用户名")
	private String memberName = "";
	@ZapcomApi(value = "授权码")
	private String accessToken = "";

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

}
