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
		zapfunc.f.to_url('user_set');

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
	user_pass : function(oEl) {
		zapapi.api_form(oEl, "com_srnpr_yescms_member_api_UserPass",
				function(){zapapi.m.modal({content:'操作成功'})});
	},
	user_info : function(oEl) {
		zapapi.api_form(oEl, "com_srnpr_yescms_member_api_UserInfo",
				function(){zapapi.m.modal({content:'操作成功'})});
	}
	

};