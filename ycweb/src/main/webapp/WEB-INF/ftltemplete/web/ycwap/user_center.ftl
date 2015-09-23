
<#include "../../macro/macro_mobile.ftl" />
<@m_web_init_dbcall />
<@m_web_init_membercode />
<#assign  a_info=a_macro_web_dbcall.upOne("mc_member_info","member_code",a_macro_web_membercode) />

<@m_site_header p_title="个人中心" p_lib=""  p_header=""/>

<div class="ym_usce_main">
	<div class="c_item">
	
		<div class="c_user">
		
		</div>
		<div class="c_welcome">
			<span>${a_info["member_email"]}</span><br/>
			欢迎来到正道拍卖！
		</div>
		<div class="w_clear">
		</div>
	</div>
	<div class="w_clear w_h_20"></div>
	<div class="c_item" >
		<div  <@m_web_event_click  p_link="user_set"/>>
			<div class="c_ico c_i0"></div>
			<div class="c_text">账户设置</div>
			<div class="c_to">&gt;</div>
			<div class="w_clear"></div>
		</div>
		<hr/>
		<div  <@m_web_event_click  p_link="user_password"/>>
			<div class="c_ico c_i1"></div>
			<div class="c_text">密码设置</div>
			<div class="c_to">&gt;</div>
			<div class="w_clear"></div>
		</div>
	</div>

	<div class="w_clear w_h_20"></div>
	<div class="c_item">
		<div  <@m_web_event_click  p_link="user_collect"/>>
			<div class="c_ico c_i2"></div>
			<div class="c_text">我的收藏</div>
			<div class="c_to">&gt;</div>
			<div class="w_clear"></div>
		</div>
		
	</div>
	<div class="w_clear w_h_20"></div>
	<div class="c_item">
		<div  <@m_web_event_click  p_link="user_comment"/>>
			<div class="c_ico c_i3"></div>
			<div class="c_text">我的评论</div>
			<div class="c_to">&gt;</div>
			<div class="w_clear"></div>
		</div>
	</div>

	<div class="w_clear w_h_50">
	</div>
	
	<div class="c_btn">
		<div class="ym_b_button">退出登录</div>
	</div>
	<div class="w_clear w_h_50">
	</div>
</div>





<@m_site_footer />