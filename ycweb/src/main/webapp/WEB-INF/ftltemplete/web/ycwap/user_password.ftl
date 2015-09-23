
<#include "../../macro/macro_mobile.ftl" />
<@m_web_init_dbcall />
<@m_web_init_membercode />
<#assign  a_info=a_macro_web_dbcall.upOne("mc_member_info","member_code",a_macro_web_membercode) />

<@m_site_header p_title="密码设置" p_lib=""  p_header=""/>

<div class="ym_usse_set ym_b_form_box">
	<form class="form-horizontal">
	
		
							
							<@m_site_form_ico p_id="oldPass" p_text="旧密码" p_type="password"  p_css="c_i1"/>
							<div class="w_h_20"></div>
							<@m_site_form_ico p_id="newPass" p_text="新密码" p_type="password"  p_css="c_i1"/>
							<@m_site_form_ico p_id="repPass" p_text="重复密码" p_type="password"  p_css="c_i1"/>
							
				  			<@m_site_form_button p_text="确认提交" p_js="yccall.user_pass(this)"/>
	</form>
</div>





<@m_site_footer />