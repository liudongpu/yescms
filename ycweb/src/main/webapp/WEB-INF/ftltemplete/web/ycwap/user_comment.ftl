
<#include "../../macro/macro_mobile.ftl" />
<@m_web_init_dbcall />
<@m_web_init_membercode />

<#assign   a_list=a_macro_web_dbcall.queryAll("mc_user_comment","","-zid","","member_code",a_macro_web_membercode) />
<@m_site_header p_title="我的评论" p_lib=""  p_header=""/>

<div class="ym_usco_comment">
	<div class="w_h_20"></div>
	
	<#if a_list?size==0>
	<div class="ym_b_message">
		<div class="c_msg">暂无相关信息</div>
	</div>
	</#if>
	<#list a_list as el>
		<div class="c_item" <@m_web_event_click  p_link=el["info_url"] />>
			<div class="c_title">${el["info_title"]}</div>
			<div>
				<div class="c_info">${el["note"]}</div>
				<div class="c_date">${el["comment_date"]}</div>
			</div>
		</div>
		<div class="w_h_20"></div>
	</#list>
	

</div>





<@m_site_footer />