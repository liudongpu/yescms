
<#include "../../macro/macro_mobile.ftl" />
<@m_web_init_dbcall />
<@m_web_init_membercode />
<#assign  a_info=a_macro_web_dbcall.upOne("mc_member_info","member_code",a_macro_web_membercode) />

<@m_site_header p_title="在线送拍" p_lib="upload"  p_header=""/>

<div class="ym_usse_add ym_b_form_box">
	
	
		<div class="c_title">填写委托人信息</div>
		<@m_site_form_add p_id="user_name" p_text="姓名" />
		<@m_site_form_add p_id="user_phone" p_text="电话" />
		<@m_site_form_add p_id="user_email" p_text="邮箱" />
		<div class="c_title">填写拍品信息</div>
		<@m_site_form_add p_id="good_name" p_text="名称" />
		<@m_site_form_add p_id="good_author" p_text="作者" />
		<@m_site_form_add p_id="good_size" p_text="尺寸" />
		<@m_site_form_add p_id="good_weight" p_text="重量" />
		<@m_site_form_add p_id="good_price" p_text="委托底价" />
		<@m_site_form_upload p_id="photo_one"  p_text="拍品照片1"/>
		<@m_site_form_upload p_id="photo_two"  p_text="拍品照片2" />
		<@m_site_form_upload p_id="photo_three"  p_text="拍品照片3" />
	
</div>





<@m_site_footer />