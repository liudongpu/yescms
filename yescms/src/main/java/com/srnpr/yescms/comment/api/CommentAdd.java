package com.srnpr.yescms.comment.api;

import com.srnpr.yescms.comment.model.CommentAddInput;
import com.srnpr.yescms.comment.model.CommentAddResult;
import com.srnpr.zapcom.basehelper.FormatHelper;
import com.srnpr.zapcom.basemodel.MDataMap;
import com.srnpr.zapdata.dbdo.DbUp;
import com.srnpr.zapweb.webapi.RootApiForToken;
import com.srnpr.zapweb.webmodel.MWebResult;

public class CommentAdd extends
		RootApiForToken<CommentAddResult, CommentAddInput> {

	public CommentAddResult Process(CommentAddInput inputParam, MDataMap mRequestMap) {

		DbUp.upTable("mc_user_comment").insert("member_code", getUserCode(),
				"info_title", inputParam.getInfoTitle(), "info_url",
				inputParam.getInfoUrl(), "comment_date",
				FormatHelper.upDateTime(), "note", inputParam.getNote(),
				"member_name", getOauthInfo().getLoginName(), "info_uid",
				inputParam.getInfoUid());

		CommentAddResult result = new CommentAddResult();

		result.setInfoUid(inputParam.getInfoUid());
		return result;

	}

}
