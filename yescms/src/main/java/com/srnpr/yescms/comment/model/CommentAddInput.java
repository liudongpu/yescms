package com.srnpr.yescms.comment.model;

import com.srnpr.zapcom.baseannotation.ZapcomApi;
import com.srnpr.zapcom.topapi.RootInput;

public class CommentAddInput extends RootInput {

	@ZapcomApi(value = "评论标题")
	private String infoTitle = "";
	@ZapcomApi(value = "评论链接")
	private String infoUrl = "";
	@ZapcomApi(value = "评论内容", require = 1)
	private String note = "";
	@ZapcomApi(value = "评论编号", require = 1)
	private String infoUid = "";

	public String getInfoTitle() {
		return infoTitle;
	}

	public void setInfoTitle(String infoTitle) {
		this.infoTitle = infoTitle;
	}

	public String getInfoUrl() {
		return infoUrl;
	}

	public void setInfoUrl(String infoUrl) {
		this.infoUrl = infoUrl;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getInfoUid() {
		return infoUid;
	}

	public void setInfoUid(String infoUid) {
		this.infoUid = infoUid;
	}

}
