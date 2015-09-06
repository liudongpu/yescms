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

		var sAccessToken = yccall.up_access_token();
		if (sAccessToken) {
			var sMemberName = zapfunc.f.cookie("member_name");
			zapapi.c.api_token=sAccessToken;
			$('#yc_id_top_nav_user').html(sMemberName+'【<a href="user_set">个人中心</a>】<a href="javascript:yccall.member_logout()">退出</a>');
		}
	},

	func_member_reg : function() {

	},
	page_search:function()
	{
		var sKeyWord=$('#ycbase_header_layout_search').val();
		zapfunc.f.to_url('search_page?u_keyword='+sKeyWord);
	},
	search_change:function(iIndex)
	{
		for(var i=0;i<2;i++)
			{
			if(i==iIndex)
				{
			$('#ycsite_sp_box_tab_nav_'+i).addClass('c_active');
			$('#ycsite_sp_box_tab_item_'+i).show();
				}
			else
				{
				$('#ycsite_sp_box_tab_nav_'+i).removeClass('c_active');
				$('#ycsite_sp_box_tab_item_'+i).hide();
				}
			}
		
	}

};

$(function() {
	yclib.init_base();
});