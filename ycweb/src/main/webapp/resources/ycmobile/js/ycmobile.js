var ycmobile = {

	temp : {
		share_show : false
	},
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

	check_login_href : function(sUrl) {

		if (yccall.up_access_token()) {
			zapfunc.f.to_url(sUrl);
		} else {
			zapfunc.f.to_url('member_login');
		}
	},

	page_search : function() {
		var sKeyWord = $('#u_keyword').val();
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

	},

	people_good_nav : function(iIndex) {

		for (var i = 0; i < 2; i++) {
			if (i == iIndex) {
				$('#ym_pego_nav_id_menu_' + i).addClass('c_n_active');
				$('#ym_pego_nav_id_info_' + i).show();
			} else {
				$('#ym_pego_nav_id_menu_' + i).removeClass('c_n_active');
				$('#ym_pego_nav_id_info_' + i).hide();
			}
		}
	},
	share_baidu : function() {
		if (ycmobile.temp.share_show) {
			$('#mobile_share_box').hide();
			ycmobile.temp.share_show = false;
		} else {
			$('#mobile_share_box').show();
			ycmobile.temp.share_show = true;
		}
		/*
		 * window._bd_share_config = { "common" : { "bdSnsKey" : {}, "bdText" :
		 * "", "bdMini" : "2", "bdMiniList" : false, "bdPic" : "", "bdStyle" :
		 * "0", "bdSize" : "32" }, "share" : {} }; with (document)
		 * 0[(getElementsByTagName('head')[0] || body)
		 * .appendChild(createElement('script')).src =
		 * 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' +
		 * ~(-new Date() / 36e5)];
		 */
		$('#mobile_share_box_js')
				.html(
						'<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1406793959846526" charset="utf-8"></script>');

	}

};

$(function() {
	ycmobile.init_base();
});
