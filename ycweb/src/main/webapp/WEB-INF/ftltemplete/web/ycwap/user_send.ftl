
<#include "../../macro/macro_mobile.ftl" />
<@m_web_init_dbcall />
<@m_web_init_membercode />
<#assign  a_info=a_macro_web_dbcall.upOne("mc_member_info","member_code",a_macro_web_membercode) />

<@m_site_header p_title="在线送拍" p_lib=""  p_header=""/>

<div class="ym_usse_main">
	
	
	<div class="c_btn">
				
				<div class="ym_b_button" <@m_web_event_click p_link="user_sendadd" /> >我要送拍</div>
			</div>
	
	
</div>





<@m_site_footer />