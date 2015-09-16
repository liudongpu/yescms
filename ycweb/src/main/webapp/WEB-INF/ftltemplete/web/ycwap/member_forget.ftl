
 <#include "../../macro/macro_mobile.ftl" />
<@m_web_init_sessionhelper />



<@m_site_header p_title="忘记密码" p_lib=""  p_header="member"/>




<div class="ym_melo_main" >
	<div class="c_box">
		<div class="c_ba_top"  <@m_web_event_click p_js="history.go(-1)" /> >
		
			忘记密码
		</div>
		
		<form class="form-horizontal">
			<div class="c_item">
			
				<div class="c_ico c_i2">
				</div>
				<div class="c_input">
					<@m_site_form_input p_id="memberEmail" p_text="邮箱" p_type="email"  />
				</div>
				<div class="w_clear"></div>
			</div>
			
			<div class="c_bordertop w_h_40"></div>
			<div class="c_btn">
				<@m_web_html_hidden p_id="resetTarget" p_value="${a_macro_web_sessionhelper.upReplaceUrl('')}" />
				<div class="ym_b_button" <@m_web_event_click p_js="yccall.member_forget(this)" /> >发送邮件</div>
			</div>
		</form>
		
		<div class="c_label">
			还没有账号?&nbsp;&nbsp;&nbsp;<span class="c_left"><@m_web_html_href "member_reg" "立即注册"/></span>
			
		</div>
		
	</div>
	

	<div class="w_h_40">
	</div>
	
	<div class="w_h_40">
	</div>
	<div class="w_h_40">
	</div>
</div>


<@m_site_footer />