 <#include "../../macro/macro_mobile.ftl" />

<@m_web_init_dbcall />
<@m_web_init_sessionhelper />

<#assign  a_code=a_macro_web_sessionhelper.upRequest("u_code") />
<#assign  a_info=a_macro_web_dbcall.upOne("yc_static","code",a_code) />


<@m_site_header p_title=a_info["title"] p_lib=""  p_header=""/>

<div class="ym_stin_main">

	<div class="c_info">
		${a_info["content"]}
	</div>
	
	
</div>

<div class="w_clear w_h_50"></div>

<@m_site_footer />