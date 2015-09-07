
 <#include "../../macro/macro_site.ftl" />


<@m_web_init_dbcall />
<@m_web_init_sessionhelper />


<@m_site_header p_title="忘记密码"/>
<@m_site_body_begin />






<div class="ycsite_member_box" >
	<div class="w_h_40">
	</div>
	<div class="c_box ycbase_body_back_layout">
		<div class="c_label">
			<div class="c_title"><@m_web_html_href "" "忘记" /> 密码    </div>
			<div class="c_sub">还没有账号， <@m_web_html_href "member_reg" "立即注册" />  </div>
			<div class="w_clear"></div>
		</div>
		<div class="c_form">
			<form class="form-horizontal">
	  			
				<@m_site_form_input p_id="memberEmail" p_text="邮箱" p_type="email"  />

				
	  			<@m_web_html_hidden p_id="resetTarget" p_value="${a_macro_web_sessionhelper.upReplaceUrl('')}" />
	  			<div class="w_h_30"></div>
				
				
				<@m_site_form_button p_text="发送邮件" p_click="yccall.member_forget(this)"/>

				
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