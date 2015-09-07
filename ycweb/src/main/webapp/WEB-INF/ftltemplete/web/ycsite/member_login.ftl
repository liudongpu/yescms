
 <#include "../../macro/macro_site.ftl" />
<@m_site_header p_title="登录"/>
<@m_site_body_begin />


<@m_web_init_dbcall />



<div class="ycsite_member_box" >
	<div class="w_h_40">
	</div>
	<div class="c_box ycbase_body_back_layout">
		<div class="c_label">
			<div class="c_title"><@m_web_html_href "" "登录" />正道</div>
			<div class="c_sub">还没有账号， <@m_web_html_href "member_reg" "立即注册" />  </div>
			<div class="w_clear"></div>
		</div>
		<div class="c_form">
			<form class="form-horizontal">
	  			
				<@m_site_form_input p_id="loginName" p_text="邮箱/手机号" p_type="email"  />
				<@m_site_form_input p_id="loginPassword" p_text="密 码" p_type="password"  />
	  			
				
				<div class="form-group">
	    			<label class="col-sm-3 control-label"></label>
		    		<div class="col-sm-9">
		    			<div class="w_h_20"></div>
		      			<@m_web_html_href "" "忘记密码？" />
		    		</div>
	  			</div>
				<@m_site_form_button p_text="登录" p_click="yccall.member_login(this)"/>

				
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