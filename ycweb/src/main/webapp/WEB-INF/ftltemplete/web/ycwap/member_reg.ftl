
 <#include "../../macro/macro_mobile.ftl" />




<@m_site_header p_title="注册" p_lib=""  p_header="member"/>




<div class="ym_melo_main" >
	<div class="c_box">
		<div class="c_ba_top"  <@m_web_event_click p_js="history.go(-1)" /> >
		
			手机快速注册
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
			<div class="c_item">
			
				<div class="c_ico c_i3">
				</div>
				<div class="c_input">
					<@m_site_form_input p_id="memberPhone" p_text="手机号码" p_type="number"  />
				</div>
				<div class="w_clear"></div>
			</div>
			<div class="c_item">
			
				<div class="c_ico c_i1">
				</div>
				<div class="c_input">
					<@m_site_form_input p_id="memberPassword" p_text="密 码" p_type="password"  />
				</div>
				<div class="w_clear"></div>
			</div>
			<div class="c_item">
			
				<div class="c_ico c_i1">
				</div>
				<div class="c_input">
					<@m_site_form_input p_id="memberRepass" p_text="重复密码" p_type="password"  />
				</div>
				<div class="w_clear"></div>
			</div>
			<div class="c_bordertop w_h_40"></div>
			<div class="c_btn">
				<@m_web_html_hidden p_id="loginFrom" p_value="user_center" />
				<div class="ym_b_button" <@m_web_event_click p_js="yccall.member_reg(this)" /> >注册</div>
			</div>
		</form>
		
		<div class="c_label">
			注册即视为同意<span class="c_left"><@m_web_html_href "static_info?u_code=4653000100020001" "《正道用户服务协议》"/></span>
			
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