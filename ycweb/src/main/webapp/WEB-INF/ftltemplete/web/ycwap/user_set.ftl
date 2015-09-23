
<#include "../../macro/macro_mobile.ftl" />
<@m_web_init_dbcall />
<@m_web_init_membercode />
<#assign  a_info=a_macro_web_dbcall.upOne("mc_member_info","member_code",a_macro_web_membercode) />

<@m_site_header p_title="账户设置" p_lib=""  p_header=""/>

<div class="ym_usse_set ym_b_form_box">
	<form class="form-horizontal">
	
		<@m_site_form_ico p_id="memberEmail" p_text="用户邮箱" p_value=a_info["member_email"] p_css="c_i0"/>
		<@m_site_form_ico p_id="memberPhone" p_text="手机号码" p_value=a_info["member_phone"] p_css="c_i1"/>
		<div class="w_h_20"></div>
		<@m_site_form_ico p_id="realName" p_text="真实姓名" p_value=a_info["real_name"] p_css="c_i4"/>
							
		<@m_site_form_button p_text="确认修改" p_js="yccall.user_info(this)"/>
							
	
	</form>
</div>





<@m_site_footer />