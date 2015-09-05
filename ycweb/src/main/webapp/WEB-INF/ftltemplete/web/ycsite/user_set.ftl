
 <#include "../../macro/macro_site.ftl" />
<@m_web_init_dbcall />
<@m_web_init_membercode />
<#assign  a_info=a_macro_web_dbcall.upOne("mc_member_info","member_code",a_macro_web_membercode) />

<@m_site_header p_title="账户设置"/>
<@m_site_body_begin />
<@m_site_body_nav p_text=["个人中心","账户设置"] p_link=["user_set?"] />

<div class="ycsite_user_box  ycbase_body_back_layout">

	<@m_site_user_menu p_index=0 />
	
	<div class="ycsite_user_right">
		<div class="c_u_title">账户设置</div>
		<div class="">
				<div class="ycsite_member_box" >
					<div class="c_form">
						<form class="form-horizontal">
						
						
							<@m_site_form_input p_id="memberEmail" p_text="用户邮箱" p_attr="disabled" p_value=a_info["member_email"] />
							<@m_site_form_input p_id="memberPhone" p_text="手机号码" p_value=a_info["member_phone"]/>
							<@m_site_form_input p_id="realName" p_text="真实姓名" p_value=a_info["real_name"]/>
							
				  			<@m_site_form_button p_text="确认修改" p_click="yccall.user_info(this)"/>
							
						
						
				  			
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