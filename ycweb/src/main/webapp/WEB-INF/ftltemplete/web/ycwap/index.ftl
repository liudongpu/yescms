 <#include "../../macro/macro_mobile.ftl" />


<@m_web_init_dbcall />


<#assign   a_list=a_macro_web_dbcall.queryAll("yc_adv","","-zid"," wap_url!='' ") />
<#assign a_yes_helper=b_method.upClass("com.srnpr.yescms.helper.YesCmsHelper") />


<@m_site_header p_title="首页" p_lib="swiper"  p_header="index"/>


<div class="ym_index_main">
	<div class="c_box">
		<div class="c_adv">
			
			
				<div class="swiper-container  mobile_mindex_adv_box">
					<div class="swiper-wrapper">
						
							<#list a_list as el>
								<div class="swiper-slide">
						      		
						      		<@m_web_html_img p_img=el["wap_url"]    p_width=640  p_link=a_yes_helper.formatLink(el["link_url"]) /> 
						      		
						    	</div>
							</#list>

					</div>
					
					<div class="swiper-pagination"></div>

				</div>

			</div>
	</div>
	<div class="w_h_10"></div>
</div>

<div class="ym_index_nav">
	<div class="c_box">
	
		<div class="c_item" <@m_web_event_click p_link="auction_list" /> >
			<div class="c_ico c_i0"></div>
			<div class="c_label">预展/成交</div>
		</div>
		<div class="c_item" <@m_web_event_click p_link="news_list" /> >
			<div class="c_ico c_i1"></div>
			<div class="c_label">正道资讯</div>
		</div>
		<div class="c_item"  <@m_web_event_click p_js="ycmobile.check_login_href('user_send')" /> >
			<div class="c_ico c_i2"></div>
			<div class="c_label">在线送拍</div>
		</div>
		<div class="c_item"><a href="tel:01064608966">
			<div class="c_ico c_i3"></div>
			<div class="c_label">联系电话</div></a>
		</div>
	
	
		
	</div>

</div>


<@m_site_footer p_initjs="ycmobile.page_index_init()"/>