
 <#include "../../macro/macro_site.ftl" />
<@m_web_init_dbcall />
<@m_web_init_membercode />
<#assign  a_info=a_macro_web_dbcall.upOne("mc_member_info","member_code",a_macro_web_membercode) />

<@m_site_header p_title="密码设置"/>
<@m_site_body_begin />
<@m_site_body_nav p_text=["个人中心","密码设置"] p_link=["user_set?"] />

<div class="ycsite_user_box  ycbase_body_back_layout">

	<@m_site_user_menu p_index=1 />
	
	<div class="ycsite_user_right">
		<div class="c_u_title">密码设置</div>
		<div class="">
				<div class="ycsite_member_box" >
					<div class="c_form">
						<form class="form-horizontal">
				  			
				  			<@m_site_form_input p_id="oldPass" p_text="旧密码" p_type="password" />
							<@m_site_form_input p_id="newPass" p_text="新密码" p_type="password" />
							<@m_site_form_input p_id="repPass" p_text="重复密码" p_type="password" />
							
				  			<@m_site_form_button p_text="确认提交" p_click="yccall.user_pass(this)"/>
							
						</form>
					</div>
				</div>
		</div>
	</div>

	<div class="w_clear">
	</div>
</div>





<@m_site_body_end />
<@m_site_footer/>