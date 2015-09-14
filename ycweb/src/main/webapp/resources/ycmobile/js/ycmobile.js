var ycmobile = {

	page_index_init : function() {

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
	}

}