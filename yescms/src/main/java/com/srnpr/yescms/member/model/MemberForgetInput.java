package com.srnpr.yescms.member.model;

import com.srnpr.zapcom.baseannotation.ZapcomApi;
import com.srnpr.zapcom.topapi.RootInput;

public class MemberForgetInput extends RootInput {

	@ZapcomApi(value = "邮箱", require = 1, verify = "base=email")
	private String memberEmail = "";

	@ZapcomApi(value = "页面链接地址", remark = "域名校验比较困难，因此将域名传递给后台解析,格式为http://xxxx/xxxx?u_code=", require = 1)
	private String resetTarget = "";

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getResetTarget() {
		return resetTarget;
	}

	public void setResetTarget(String resetTarget) {
		this.resetTarget = resetTarget;
	}

}
