
<#include "../../macro/macro_mobile.ftl" />
<@m_web_init_dbcall />
<@m_web_init_membercode />
<#assign  a_info=a_macro_web_dbcall.upOne("mc_member_info","member_code",a_macro_web_membercode) />

<@m_site_header p_title="在线送拍流程" p_lib=""  p_header=""/>

<div class="ym_usse_ok">
	
	
				
	<div class="c_agree"></div>
	
	<div class="w_h_40"></div>
	
	<@m_site_form_button p_text="确定" p_link="user_sendadd" />
	
	<div class="w_h_40"></div>
	
</div>





<@m_site_footer />