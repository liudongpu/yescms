
 <#include "../../macro/macro_site.ftl" />


<@m_web_init_dbcall />
<@m_web_init_sessionhelper />


<@m_site_header p_title="重置密码"/>
<@m_site_body_begin />






<div class="ycsite_member_box" >
	<div class="w_h_40">
	</div>
	<div class="c_box ycbase_body_back_layout">
		<div class="c_label">
			<div class="c_title"><@m_web_html_href "" "重置" /> 密码    </div>
			<div class="c_sub">已有账号， <@m_web_html_href "member_login" "立即登陆" />  </div>
			<div class="w_clear"></div>
		</div>
		<div class="c_form">
			<form class="form-horizontal">
	  			
				<@m_site_form_input p_id="password" p_text="密码" p_type="password"  />
				<@m_site_form_input p_id="repass" p_text="重复密码" p_type="password"  />
				
	  			<@m_web_html_hidden p_id="resetToken" p_value="${a_macro_web_sessionhelper.upRequest('u_code')}" />
	  			<div class="w_h_30"></div>
				
				
				<@m_site_form_button p_text="重置密码" p_click="yccall.member_reset(this)"/>

				
			</form>
		</div>
	</div>
	<div class="w_h_40">
	</div>
	<div class="w_h_40">
	</div>
</div>

<@m_site_body_end />
<@m_site_footer/>