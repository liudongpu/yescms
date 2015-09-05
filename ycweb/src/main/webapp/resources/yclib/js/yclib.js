var yclib = {

	page_news_list_init : function() {

		var $container = $('#ycsite_nl_box');

		$container.imagesLoaded(function() {
			$container.masonry({
				itemSelector : '.c_item'
			});
		});

	},

	init_base : function() {

		var sAccessToken = zapfunc.f.cookie("access_token");
		if (sAccessToken) {
			var sMemberName = zapfunc.f.cookie("member_name");
			zapapi.c.api_token=sAccessToken;
			$('#yc_id_top_nav_user').html(sMemberName+'【<a href="user_set">个人中心</a>】<a href="javascript:yccall.member_logout()">退出</a>');
		}
	},

	func_member_reg : function() {

	}

};

$(function() {
	yclib.init_base();
});