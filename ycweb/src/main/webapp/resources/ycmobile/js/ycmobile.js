var ycmobile = {

	init_base : function() {

		var sAccessToken = yccall.up_access_token();
		if (sAccessToken) {
			// var sMemberName = zapfunc.f.cookie("member_name");
			zapapi.c.api_token = sAccessToken;

		}
	},

	page_index_init : function() {

		var mySwiper = new Swiper('.swiper-container', {
			// direction: 'vertical',
			loop : true,

			// 如果需要分页器
			pagination : '.swiper-pagination',
			autoplay : 5000

		});

	},

	page_good_info_init : function() {

		var mySwiper = new Swiper('.swiper-container', {
			// direction: 'vertical',
			loop : true,

			// 如果需要分页器
			pagination : '.swiper-pagination',
			autoplay : 5000

		});

	},

	header_nav_click : function(oTarget) {

		if ($(oTarget).hasClass('c_active')) {

			$(oTarget).removeClass('c_active');
			$('#ym_id_mm_menu').hide();
		} else {
			$(oTarget).addClass('c_active');
			$('#ym_id_mm_menu').show();
		}
	},

	header_user_click : function() {
		if (yccall.up_access_token()) {
			zapfunc.f.to_url('user_center');
		} else {
			zapfunc.f.to_url('member_login');
		}

	},
	page_search : function() {
		var sKeyWord = $('#ycbase_header_layout_search').val();
		zapfunc.f.to_url('search_page?u_keyword=' + sKeyWord);
	},
	search_change : function(iIndex) {
		for (var i = 0; i < 2; i++) {
			if (i == iIndex) {
				$('#ycsite_sp_box_tab_nav_' + i).addClass('c_active');
				$('#ycsite_sp_box_tab_item_' + i).show();
			} else {
				$('#ycsite_sp_box_tab_nav_' + i).removeClass('c_active');
				$('#ycsite_sp_box_tab_item_' + i).hide();
			}
		}

	}

};

$(function() {
	ycmobile.init_base();
});
