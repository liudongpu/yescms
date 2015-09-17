
 <#include "../../macro/macro_site.ftl" />
<@m_site_header p_title="注册"/>
<@m_site_body_begin />


<@m_web_init_dbcall />



<div class="ycsite_member_box" >
	<div class="w_h_40">
	</div>
	<div class="c_box ycbase_body_back_layout">
		<div class="c_label">
			<div class="c_title"><@m_web_html_href "" "注册" />正道</div>
			<div class="c_sub">已有账户 ，<@m_web_html_href "member_login" "立即登录" />  </div>
			<div class="w_clear"></div>
		</div>
		<div class="c_form">
			<form class="form-horizontal">
	  			
	  			
	  			<@m_site_form_input p_id="memberEmail" p_text="邮箱" p_type="email"  />
	  			<@m_site_form_input p_id="memberPhone" p_text="手机号码" />
				<@m_site_form_input p_id="memberPassword" p_text="密码" p_type="password"  />
				<@m_site_form_input p_id="memberRepass" p_text="重复密码" p_type="password"  />
				
	  			
	  			<div class="form-group">
	    			<label for="memberRepass" class="col-sm-3 control-label">验证码：</label>
		    		<div class="col-sm-5">
		    			<@m_web_html_hidden p_id="verifyUqcode" p_value=b_method.upClass("com.srnpr.zapweb.helper.WebHelper").upUuid()   />
		      			<input type="text" class="form-control" name="memberVerify"  id="memberVerify" placeholder="请输入验证码"/>
		    		</div>
		    		<div class="col-sm-4">
		    			<img id="ycverify_verify_image" src="" onclick="yccall.verify_code()" class="w_pointer"/>
		    		</div>
	  			</div>
	  			
				<div class="form-group">
	    			<label class="col-sm-3 control-label"></label>
		    		<div class="col-sm-9">
		    			<div class="w_h_20"></div>
		      			<input type="checkbox" checked="checked"> <span class="c_small"><@m_web_html_href p_link="static_info?u_code=4653000100020001" p_text="《注册用户协议》" p_target="_blank" /></span>
		    		</div>
	  			</div>
				<div class="form-group">
	    			<label class="col-sm-3 control-label"></label>
		    		<div class="col-sm-9">
		      			<button type="button" onclick="yccall.member_reg(this)" class="btn btn-default btn-lg btn-block">注册</button>
		    		</div>
	  			</div>
			</form>
		</div>
	</div>
	<div class="w_h_40">
	</div>
	<div class="w_h_40">
	</div>
</div>

<@m_site_body_end />
<@m_site_footer  p_initjs="yccall.verify_code()"/>