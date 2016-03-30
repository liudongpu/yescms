 <#include "../../macro/macro_mobile.ftl" />

<@m_web_init_dbcall />
<@m_web_init_sessionhelper />
<#assign   a_info=a_macro_web_dbcall.upOne("yc_special","uid",a_macro_web_sessionhelper.upRequest("u_id")) />
<#assign   a_list=a_macro_web_dbcall.queryAll("yc_good","","lpad(code,20,'0')","","special_uid",a_info["uid"]) />
<#assign   a_auction=a_macro_web_dbcall.upOne("yc_auction","uid",a_info["auction_uid"]) />

<@m_site_header p_title=a_info["name"] p_lib=""  p_header=""/>

<div class="ym_goli_main">
	<div class="c_top">${a_info["name"]}</div>
	<div class="c_time">${a_info["special_remark"]}</div>
	<#list a_list as el>
		<div class="c_item" <@m_web_event_click p_link="good_info?u_id="+el["uid"] /> >
			<div class="c_detail  <#if (el_index%2==0)>c_one</#if>">
				<div class="c_img">
					<@m_web_html_img p_img=el["file_url"]?split('|')[0]  p_width=320/> 
				</div>
				
				
				<div class="c_label">
					<div class="c_title">${el["name"]}</div>
					<div class="c_desc">图录号：${el["code"]}</div>
					<div class="c_desc">估价：${el["assess_price"]}</div>
					<div class="c_desc">成交价：<span class="ym_b_money"><@m_web_format_money p_money=el["success_price"]/></span></div>
				</div>
			</div>
		</div>
		<#if (el_index%2==1)><div class="w_clear"></div></#if>
	</#list>
	<div class="w_clear w_h_50"></div>
</div>



<@m_site_footer />