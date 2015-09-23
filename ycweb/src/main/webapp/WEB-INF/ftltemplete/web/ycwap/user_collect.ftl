
<#include "../../macro/macro_mobile.ftl" />
<@m_web_init_dbcall />
<@m_web_init_membercode />
<#assign  a_info=a_macro_web_dbcall.upOne("mc_member_info","member_code",a_macro_web_membercode) />

<@m_site_header p_title="我的收藏" p_lib=""  p_header=""/>

<div class="ym_usse_set ym_b_form_box">
	<div class="w_h_20"></div>
	<div class="ym_b_message">
		<div class="c_msg">暂无相关信息</div>
	</div>

</div>





<@m_site_footer />