
<#include "../../macro/macro_mobile.ftl" />
<@m_web_init_dbcall />
<@m_web_init_sessionhelper />
<#assign  a_info=a_macro_web_dbcall.upOne("mc_user_send","uid",a_macro_web_sessionhelper.upRequest("u_id")) />

<@m_site_header p_title="送拍品详情" p_lib=""  p_header=""/>

<div class="ym_usse_info">
	
	
				
	<div class="c_title">${a_info["good_name"]}</div>
	<div class="c_info">
		名称：${a_info["good_name"]}
		  <br/>
		作者：${a_info["good_author"]}
		 <br/>
		尺寸：${a_info["good_size"]}
		<br/>
		重量：${a_info["good_weight"]}
		 <br/>
		委托底价：${a_info["good_price"]}
	
	</div>
	<div class="w_h_20"></div>
	<div class="c_img">
		<div class="c_label">图片展示</div>
		<div class="w_h_40"></div>
		<@m_web_html_img p_img=a_info["photo_one"] p_width=580 /> 
		<div class="w_h_20"></div>
		<@m_web_html_img p_img=a_info["photo_two"] p_width=580 /> 
		<div class="w_h_20"></div>
		<@m_web_html_img p_img=a_info["photo_three"] p_width=580 /> 
		<div class="w_h_40"></div>
	</div>
	
</div>





<@m_site_footer />