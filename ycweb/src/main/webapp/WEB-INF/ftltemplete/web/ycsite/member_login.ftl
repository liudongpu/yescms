
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
	  			<div class="form-group">
	    			<label for="loginName" class="col-sm-3 control-label">用户名：</label>
		    		<div class="col-sm-9">
		      			<input type="email" class="form-control" name="loginName"  id="loginName" placeholder="请输入用户名"/>
		    		</div>
	  			</div>
				
	  			<div class="form-group">
	    			<label for="loginPassword" class="col-sm-3 control-label">密   码：</label>
		    		<div class="col-sm-9">
		      			<input type="password" class="form-control" name="loginPassword"  id="loginPassword" placeholder="请输入密码"/>
		    		</div>
	  			</div>
				
				<div class="form-group">
	    			<label class="col-sm-3 control-label"></label>
		    		<div class="col-sm-9">
		    			<div class="w_h_20"></div>
		      			<@m_web_html_href "" "忘记密码？" />
		    		</div>
	  			</div>
				<div class="form-group">
	    			<label class="col-sm-3 control-label"></label>
		    		<div class="col-sm-9">
		      			<button type="button" onclick="yccall.member_login(this)" class="btn btn-default btn-lg btn-block">登录</button>
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