package com.srnpr.yescms.member.model;

import com.srnpr.zapcom.baseannotation.ZapcomApi;
import com.srnpr.zapcom.topapi.RootInput;

public class UserPassInput extends RootInput {

	@ZapcomApi(value = "旧密码", require = 1)
	private String oldPass = "";
	@ZapcomApi(value = "新密码", require = 1)
	private String newPass = "";
	@ZapcomApi(value = "重复密码", require = 1)
	private String repPass = "";

	public String getOldPass() {
		return oldPass;
	}

	public void setOldPass(String oldPass) {
		this.oldPass = oldPass;
	}

	public String getNewPass() {
		return newPass;
	}

	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}

	public String getRepPass() {
		return repPass;
	}

	public void setRepPass(String repPass) {
		this.repPass = repPass;
	}
}
