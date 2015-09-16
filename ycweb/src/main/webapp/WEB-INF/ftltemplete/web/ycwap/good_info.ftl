 <#include "../../macro/macro_mobile.ftl" />

<@m_web_init_dbcall />
<@m_web_init_sessionhelper />
<#assign  a_info=a_macro_web_dbcall.upOne("yc_good","uid",a_macro_web_sessionhelper.upRequest("u_id")) />
<#assign  a_special=a_macro_web_dbcall.upOne("yc_special","uid",a_info["special_uid"]) />

<#assign   a_image=a_info["file_url"]?split('|')  />
<@m_site_header p_title=a_info["name"]  p_lib="swiper"  p_header=""/>

<div class="ym_goin_main">
	
	
	<div class="c_box">
		<div class="c_img">
				<div class="swiper-container  mobile_mindex_adv_box">
					<div class="swiper-wrapper">
						
							<#list a_image as el>
								<div class="swiper-slide">
						      		
						      		<@m_web_html_img p_img=el    p_width=640   /> 
						      		
						    	</div>
							</#list>

					</div>
					
					<div class="swiper-pagination"></div>

				</div>
	
		</div>
		
		<div class="c_show">
			<div class="c_title">${a_info["name"]}</div>
			<div class="c_desc">
				图录号：${a_info["code"]} <br/>质地：${a_info["texture"]}<br/> 尺寸：${a_info["size"]}  <br/>参考价：${a_info["assess_price"]} <br/>成交价：<span class="ym_b_money"><@m_web_format_money p_money=a_info["success_price"]/></span>
			</div>
			<div class="w_h_40"></div>
			<div class="c_desc">
				拍品介绍
			</div>
			<div class="w_h_40"></div>
			<div class="c_info">
				${a_info["note"]}
			</div>
			
		</div>
		
		
	</div>
	
	
	
	
	<div class="w_clear w_h_50"></div>
	
	
</div>

<@m_site_comment_list p_uid=a_info["uid"] p_title=a_info["title"] p_url="good_info?u_id="+a_info["uid"] />



<#if (a_image?size>1)>
	<@m_site_footer  p_initjs="ycmobile.page_good_info_init()"/>
<#else>
	<@m_site_footer />
</#if>
