var yclib = {

	page_news_list_init : function() {

		var $container = $('#ycsite_nl_box');

		$container.imagesLoaded(function() {
			$container.masonry({
				itemSelector : '.c_item'
			});
		});

	}

};