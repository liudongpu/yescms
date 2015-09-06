package com.srnpr.yescms.comment.model;

import com.srnpr.zapcom.baseannotation.ZapcomApi;
import com.srnpr.zapweb.webapi.RootResultWeb;

public class CommentAddResult extends RootResultWeb {

	@ZapcomApi(value = "编号")
	private String infoUid = "";

	public String getInfoUid() {
		return infoUid;
	}

	public void setInfoUid(String infoUid) {
		this.infoUid = infoUid;
	}
}
