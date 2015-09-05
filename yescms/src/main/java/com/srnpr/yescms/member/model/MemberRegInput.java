package com.srnpr.yescms.member.model;

import com.srnpr.zapcom.baseannotation.ZapcomApi;
import com.srnpr.zapcom.topapi.RootInput;

public class MemberRegInput extends RootInput {

	@ZapcomApi(value = "邮箱", require = 1, verify = "base=email")
	private String memberEmail = "";

	@ZapcomApi(value = "手机号码", require = 1, verify = "base=mobile")
	private String memberPhone = "";

	@ZapcomApi(value = "密 码", require = 1)
	private String memberPassword = "";
	@ZapcomApi(value = "重复密码", require = 1)
	private String memberRepass = "";

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberRepass() {
		return memberRepass;
	}

	public void setMemberRepass(String memberRepass) {
		this.memberRepass = memberRepass;
	}

}
