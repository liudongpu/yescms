package com.srnpr.yescms.comment.model;

import com.srnpr.zapcom.baseannotation.ZapcomApi;
import com.srnpr.zapcom.topapi.RootInput;

public class CommentListInput extends RootInput {

	@ZapcomApi(value = "内容编号")
	private String infoUid = "";

	public String getInfoUid() {
		return infoUid;
	}

	public void setInfoUid(String infoUid) {
		this.infoUid = infoUid;
	}

}
