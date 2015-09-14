 <#include "../../macro/macro_mobile.ftl" />

<@m_web_init_dbcall />
<@m_web_init_sessionhelper />
<#assign   a_info=a_macro_web_dbcall.upOne("yc_auction","uid",a_macro_web_sessionhelper.upRequest("u_id")) />
<#assign   a_list=a_macro_web_dbcall.queryAll("yc_special","","-time,-zid","","auction_uid",a_info["uid"]) />

<@m_site_header p_title=a_info["name"] p_lib=""  p_header=""/>

<div class="ym_auli_main">

	<#list a_list as el>
		<div class="c_item" <@m_web_event_click p_link="good_list?u_id="+el["uid"] /> >
		
			<div class="c_img">
				<@m_web_html_img p_img=el["file_url"]  p_width=640/> 
			</div>
			
			<div class="c_bottom"></div>
			<div class="c_label">
				<div class="c_title">${el["name"]}</div>
				<div class="c_desc">时间：${el["time"]}</div>
				<div class="c_desc">成交总金额：<@m_web_format_money p_money=el["success_price"]/></div>
			</div>

		</div>
		<div class="c_border">
		</div>
	</#list>

</div>



<@m_site_footer />