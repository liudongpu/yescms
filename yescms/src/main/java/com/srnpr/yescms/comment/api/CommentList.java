package com.srnpr.yescms.comment.api;

import org.apache.commons.lang.StringUtils;

import com.srnpr.yescms.comment.model.CommentListInput;
import com.srnpr.zapcom.basemodel.MDataMap;
import com.srnpr.zapcom.topapi.RootApi;
import com.srnpr.zapweb.webapi.RootPageDataResult;
import com.srnpr.zapweb.websupport.DataApiSupport;

public class CommentList extends RootApi<RootPageDataResult, CommentListInput> {

	public RootPageDataResult Process(CommentListInput inputParam,
			MDataMap mRequestMap) {
		RootPageDataResult result = new DataApiSupport().upData(
				"mc_user_comment", "member_name,note,comment_date", "-zid", "",
				new MDataMap("info_uid", inputParam.getInfoUid()), -1, -1);

		for (MDataMap map : result.getPageData()) {

			if (map.get("member_name").length() > 5) {

				map.put("member_name", StringUtils.replace(
						map.get("member_name"),
						StringUtils.substring(map.get("member_name"), 2, 5),
						"****"));
			}

		}

		return result;
	}

}
