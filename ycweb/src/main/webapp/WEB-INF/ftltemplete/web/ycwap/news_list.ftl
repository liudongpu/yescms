 <#include "../../macro/macro_mobile.ftl" />

<@m_web_init_dbcall />

<#assign   a_list=a_macro_web_dbcall.queryAll("yc_news","","-orderid,-create_time","") />

<@m_site_header p_title="正道资讯" p_lib=""  p_header=""/>

<div class="ym_neli_main">
	
	<#list a_list as el>
		<div class="c_item" <@m_web_event_click p_link="news_info?u_id="+el["uid"] /> >
			<div class="c_detail">
				<div class="c_img">
					<@m_web_html_img p_img=el["file_url"]?split('|')[0]  p_width=640/> 
				</div>
				
				
				
			</div>
			<div class="c_bg"></div>
			<div class="c_title">${el["title"]}</div>
			
			
		</div>
		<div class="c_split"> </div>
	</#list>
	<div class="w_clear w_h_50"></div>
</div>



<@m_site_footer />