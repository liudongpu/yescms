
 <#include "../../macro/macro_site.ftl" />

<@m_web_init_dbcall />
<@m_web_init_sessionhelper />

<#assign  a_code=a_macro_web_sessionhelper.upRequest("u_code") />
<#assign  a_info=a_macro_web_dbcall.upOne("yc_static","code",a_code) />

<#assign  a_list=a_macro_web_dbcall.queryAll("yc_static","","zid","","system_cid",a_info["system_cid"]) />

<@m_site_header p_title=a_info["title"]/>
<@m_site_body_begin />
<@m_site_body_nav p_text=["帮助中心",a_info["title"]]   />


<div class="ycsite_sti_box ycbase_body_back_layout" >
	<div class="ycsite_sti_box_left">
		<#list a_list as el>
		<div class="c_item  <#if el["code"]==a_code> c_active </#if>">
			<div class="c_left"></div>
			<div class="c_center"><@m_web_html_href "static_info?u_code="+el["code"] el["title"]/></div>
			<#if el["code"]==a_code><div class="c_right ycbase_img_ycico"></div></#if>
			<div class="w_clear"></div>
		</div>
		</#list>
	</div>
	<div class="ycsite_sti_box_right">
		<div class="c_title">${a_info["title"]}</div>
		<div class="c_info">${a_info["content"]}</div>
	</div>
	
	<div class="w_clear"></div>
</div>

<@m_site_body_end />
<@m_site_footer  />