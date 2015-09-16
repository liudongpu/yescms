
 <#include "../../macro/macro_mobile.ftl" />




<@m_site_header p_title="登录" p_lib=""  p_header="member"/>




<div class="ym_melo_main" >
	<div class="c_box">
		<div class="c_login_top"  <@m_web_event_click p_js="history.go(-1)" /> >
		
			
		</div>
		
		<form class="form-horizontal">
			<div class="c_item">
			
				<div class="c_ico c_i0">
				</div>
				<div class="c_input">
					<@m_site_form_input p_id="loginName" p_text="邮箱/手机号" p_type="email"  />
				</div>
				<div class="w_clear"></div>
			</div>
			<div class="c_item">
			
				<div class="c_ico c_i1">
				</div>
				<div class="c_input">
					<@m_site_form_input p_id="loginPassword" p_text="密 码" p_type="password"  />
				</div>
				<div class="w_clear"></div>
			</div>
			<div class="c_bordertop w_h_40"></div>
			<div class="c_btn">
				<@m_web_html_hidden p_id="loginFrom" p_value="user_center" />
				<div class="ym_b_button" <@m_web_event_click p_js="yccall.member_login(this)" /> >登录</div>
			</div>
		</form>
		
		<div class="c_label">
			<span class="c_left"><@m_web_html_href "member_reg" "免费注册"/></span>
			<span class="c_right"><@m_web_html_href "member_forget" "忘记密码?"/></span>
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