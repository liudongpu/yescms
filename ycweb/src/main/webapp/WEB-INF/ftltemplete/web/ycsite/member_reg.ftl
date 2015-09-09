
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
	  			<div class="form-group">
	    			<label for="memberEmail" class="col-sm-3 control-label">邮箱：</label>
		    		<div class="col-sm-9">
		      			<input type="email" class="form-control" name="memberEmail"  id="memberEmail" placeholder="请输入邮箱"/>
		    		</div>
	  			</div>
				<div class="form-group">
	    			<label for="memberPhone" class="col-sm-3 control-label">手机号码：</label>
		    		<div class="col-sm-9">
		      			<input type="text" class="form-control" name="memberPhone" id="memberPhone" placeholder="请输入手机号码"/>
		    		</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="memberPassword" class="col-sm-3 control-label">密   码：</label>
		    		<div class="col-sm-9">
		      			<input type="password" class="form-control" name="memberPassword"  id="memberPassword" placeholder="请输入密码"/>
		    		</div>
	  			</div>
				<div class="form-group">
	    			<label for="memberRepass" class="col-sm-3 control-label">重复密码：</label>
		    		<div class="col-sm-9">
		      			<input type="password" class="form-control" name="memberRepass"  id="memberRepass" placeholder="请再次输入密码"/>
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
<@m_site_footer/>