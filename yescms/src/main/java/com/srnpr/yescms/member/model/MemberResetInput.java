package com.srnpr.yescms.member.model;

import com.srnpr.zapcom.baseannotation.ZapcomApi;
import com.srnpr.zapcom.topapi.RootInput;

public class MemberResetInput extends RootInput {

	@ZapcomApi(value = "重置编码")
	private String resetToken = "";
	@ZapcomApi(value = "密码", require = 1)
	private String password = "";
	@ZapcomApi(value = "重复密码", require = 1)
	private String repass = "";

	public String getResetToken() {
		return resetToken;
	}

	public void setResetToken(String resetToken) {
		this.resetToken = resetToken;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepass() {
		return repass;
	}

	public void setRepass(String repass) {
		this.repass = repass;
	}

}
