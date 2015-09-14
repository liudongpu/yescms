 <#include "../../macro/macro_mobile.ftl" />

<@m_web_init_dbcall />

<#assign   a_list=a_macro_web_dbcall.queryAll("yc_auction","","-time,-zid","wap_url!='' ") />

<@m_site_header p_title="预展/成交" p_lib=""  p_header=""/>

<div class="ym_auli_main">

	<#list a_list as el>
		<div class="c_item" <@m_web_event_click p_link="specital_list?u_id="+el["uid"] /> >
		
			<div class="c_img">
				<@m_web_html_img p_img=el["wap_url"]  p_width=640/> 
			</div>
			<div class="c_time">${el["time"]?substring(0,7)?replace('-','年')}月</div>
			<#if el["auction_type_cid"]=="4653000200010001"><div class="c_fix c_green">预展</div><#else><div class="c_fix c_red">成交</div></#if>
			
			<div class="c_bottom"></div>
			<div class="c_label">
				<div class="c_title">${el["name"]}</div>
				<div class="c_desc">专场：共${el["special_num"]}个专场&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间：${el["time"]}</div>
			</div>

		</div>
		<div class="c_border">
		</div>
	</#list>

</div>



<@m_site_footer />