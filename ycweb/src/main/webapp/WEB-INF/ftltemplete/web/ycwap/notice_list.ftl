 <#include "../../macro/macro_mobile.ftl" />

<@m_web_init_dbcall />

<#assign   a_list=a_macro_web_dbcall.queryAll("yc_notice","","-orderid,-create_time","") />
<#assign a_yes_helper=b_method.upClass("com.srnpr.yescms.helper.YesCmsHelper") />



<@m_site_header p_title="公告列表" p_lib=""  p_header=""/>

<div class="ym_noli_main">
	<div class="w_clear w_h_20"></div>
	<#list a_list as el>
		<div class="c_item"  >
			<div class="c_title">${el["title"]}</div>
			<div class="w_h_20"></div>
			<div class="c_date">发表时间：${el["create_time"]}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;文章来源：正道拍卖  </div>
			<div class="w_h_20"></div>
			<div class="c_info">${a_yes_helper.formatHtml(el["content"])}</div>		

		</div>
		<div class="w_h_20"></div>
	</#list>
	<div class="w_clear w_h_50"></div>
</div>



<@m_site_footer />