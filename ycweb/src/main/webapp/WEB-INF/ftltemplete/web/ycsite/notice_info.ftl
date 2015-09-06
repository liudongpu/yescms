
 <#include "../../macro/macro_site.ftl" />

<@m_web_init_dbcall />
<@m_web_init_sessionhelper />
<#assign   a_info=a_macro_web_dbcall.upOne("yc_notice","uid",a_macro_web_sessionhelper.upRequest("u_id")) />

<@m_site_header p_title=a_info["title"]/>
<@m_site_body_begin />
<@m_site_body_nav p_text=["正道公告",a_info["title"]] p_link=["notice_list"]  />


<div class="ycsite_ni_box ycbase_body_back_layout" >
	<div class="ycsite_common_info_left">
		<div class="w_h_30"></div>
		<h1 class="yctop_h1">${a_info["title"]}</h1>
		<div class="w_h_20"></div>
		<div class="yctop_desc">发表时间：${a_info["create_time"]}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;文章来源：正道拍卖  </div>
		<hr class="yctop_hr"/>

		<div class="yctop_info">${a_info["content"]}</div>		


		<@m_site_comment_list p_uid=a_info["uid"] p_title=a_info["title"] p_url="notice_info?u_id="+a_info["uid"] />
		
	</div>	
	<div class="ycsite_common_info_right">
		<@m_site_sub_list />
	</div>
	<div class="w_clear"></div>
</div>

<@m_site_body_end />
<@m_site_footer p_initjs=""/>