/**
 * 
 */

var yccall = {

	member_reg : function(oEl) {
		zapapi.api_form(oEl, "com_srnpr_yescms_member_api_MemberReg",
				yccall.member_success);
	},
	member_success : function(oData) {

		zapfunc.f.cookie("member_name", oData.memberName);
		zapfunc.f.cookie("access_token", oData.accessToken);
		
		var sLink=$('#loginFrom').val();
		if(!sLink)
			{
			sLink="user_set";
			}
		
		zapfunc.f.to_url(sLink);

	},

	verify_code:function()
	{
		
		var sUqCode=$('#verifyUqcode').val();
		
		$('#ycverify_verify_image').attr('src','../../extend/image?u_uqcode='+sUqCode+'&u_r='+Math.random());
		
		
	},
	
	up_access_token : function() {
		return zapfunc.f.cookie("access_token");
	},

	member_logout : function() {
		zapfunc.f.cookie("member_name", '');
		zapfunc.f.cookie("access_token", '');
		zapfunc.f.to_url('member_login');
	},
	member_login : function(oEl) {
		zapapi.api_form(oEl, "com_srnpr_yescms_member_api_MemberLogin",
				yccall.member_success);
	},
	
	
	member_forget : function(oEl) {
		zapapi.api_form(oEl, "com_srnpr_yescms_member_api_MemberForget",
				function() {
					zapapi.m.modal({
						content : '发送邮件成功，请到邮箱继续下一步操作 '
					})
				});
	},
	member_reset : function(oEl) {
		zapapi.api_form(oEl, "com_srnpr_yescms_member_api_MemberReset",
				function() {
					zapapi.m.modal({
						content : '重置密码成功，请重新登陆系统 '
					})
				});
	},
	
	user_pass : function(oEl) {
		zapapi.api_form(oEl, "com_srnpr_yescms_member_api_UserPass",
				function() {
					zapapi.m.modal({
						content : '操作成功'
					})
				});
	},
	user_info : function(oEl) {
		zapapi.api_form(oEl, "com_srnpr_yescms_member_api_UserInfo",
				function() {
					zapapi.m.modal({
						content : '操作成功'
					})
				});
	},

	comment_init : function(sUid) {

		var sId = "yccomment_box_info_" + sUid;
		if (yccall.up_access_token() != "") {

			$('#' + sId + ' .yccomment_box_add').show();

		} else {
			$('#' + sId + ' .yccomment_box_login').show();
		}

		yccall.comment_refresh(sUid);
	},
	comment_refresh : function(sUid) {
		zapapi.api_call("com_srnpr_yescms_comment_api_CommentList", {
			infoUid : sUid
		}, function(oData) {

			if (oData.pageData.length > 0) {
				$('#' + "yccomment_box_info_" + sUid + ' .yccomment_box_none')
						.hide();
				var aHtml = [];

				for ( var i in oData.pageData) {
					var oThis = oData.pageData[i];
					aHtml.push('<div class="yccomment_box_item">'
							+ oThis["member_name"] + '<span>'
							+ oThis["comment_date"] + '</span>' + '<br/>'
							+ oThis["note"] + '</div>');
				}

				$('#' + "yccomment_box_info_" + sUid + ' .yccomment_box_list')
						.html(aHtml.join(''));
			} else {
				$('#' + "yccomment_box_info_" + sUid + ' .yccomment_box_none')
						.show();
			}

		});
	},
	comment_submit : function(oEl) {
		zapapi
				.api_form(oEl, "com_srnpr_yescms_comment_api_CommentAdd",
						function(oData) {
							yccall.comment_refresh(oData.infoUid);
							$(
									'#' + "yccomment_box_info_" + oData.infoUid
											+ ' textarea').val('');
							
							zapapi.m.popover(oEl, '发表成功');
						});
	}

};