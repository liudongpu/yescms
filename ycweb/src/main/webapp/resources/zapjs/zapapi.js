/**
 * API调用相关
 * 
 * 
 */

var zapapi = {

	c : {

		api_key : 'jsapi',
		api_url : '../../jsonapi/',
		api_token : ''
	},
	temp : {
		last_el : null
	},

	/*
	 * APi调用类
	 */
	api_call : function(sTarget, oData, fCallBack, fError) {

		// 判断如果传入了oData则自动拼接 否则无所只传入key认证
		var defaults = oData ? {
			api_target : sTarget,
			api_input : zapapi.f.tojson(oData),
			api_key : zapapi.c.api_key,
			api_token : zapapi.c.api_token
		} : {
			api_key : zapapi.c.api_key,
			api_input : '',
			api_token : zapapi.c.api_token
		};

		// oData = $.extend({}, defaults, oData || {});

		zapapi.f.ajaxjson(zapapi.c.api_url + sTarget, defaults, function(data) {

			if (data.resultCode == "1") {

				fCallBack(data);

			} else {
				if (fError) {
					fError(data.resultMessage);
				} else {
					zapapi.f.message(data.resultMessage);
				}

			}

		});

	},

	api_form : function(oEl, sTarget, fCallBack) {
		zapapi.m.popdestory(oEl);
		var serializeObj = {};
		$($(oEl).parents('form').serializeArray()).each(function() {
			serializeObj[this.name] = this.value;
		});

		zapapi.api_call(sTarget, serializeObj, fCallBack, function(sMsg) {
			zapapi.m.popover(oEl, sMsg)
		});

	},

	m : {
		popover : function(oEl, sMsg) {
			$(oEl).popover('destroy');
			$(oEl).popover({
				content : '' + sMsg + '',
				placement : 'auto',
				html : true,
				animation : false,
				// delay: { "hide": 500 },
				trigger : 'focus'
			}).popover('show');

			setTimeout(function() {
				$(oEl).popover('destroy');
			}, 5000);
		},
		popdestory : function(oEl) {
			$(oEl).popover('destroy');
		},
		// 打开模态窗口
		modal : function(options) {

			var defaults = {
				title : '提示消息',
				content : '',
				
				id : 'zapapi_f_id_modal_box',
				cancelfunc : ''
			};
			var s = $.extend({}, defaults, options || {});

			if (zapapi.f.exist(s.id)) {

				$('#' + s.id).modal('hide');
				$('#' + s.id).remove();

				if (s.close) {
					return;
				}
			}
			
			var sModel = '<div id="' + s.id + '"  class="modal fade"  role="dialog"  aria-labelledby="myModalLabel"></div>';
			$(document.body).append(sModel);

			$('#' + s.id).html('<div class="modal-dialog" role="document"><div class="modal-content">'+
					'<div class="modal-header">'+
			        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
			        +'<h4 class="modal-title" id="myModalLabel">'+s.title+'</h4>'
			     + '</div><div class="modal-body">' + s.content + '</div></div></div>');

			

			

			$('#' + s.id).modal('show');

		}
	},
	f : {
		tojson : function(oObj) {
			return JSON.stringify(oObj);
		},
		ajaxjson : function(sTarget, data, fCallBack) {

			var options = {

				dataType : "json",
				url : sTarget,
				type : "POST",
				data : data,
				success : fCallBack,
				error : function(msg) {
					zapapi.f.message('系统异步调用出现错误，请联系技术，谢谢！');
				}
			};

			$.ajax(options);

		},
		// 判断是否存在元素
		exist : function(sId) {
			return document.getElementById(sId) ? true : false;

		},
		message : function(sMessage) {
			alert(sMessage);

		}
	}

};
