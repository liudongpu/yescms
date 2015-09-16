 <#include "../../macro/macro_mobile.ftl" />

<@m_web_init_dbcall />
<@m_web_init_sessionhelper />
<#assign  a_info=a_macro_web_dbcall.upOne("yc_news","uid",a_macro_web_sessionhelper.upRequest("u_id")) />


<@m_site_header p_title=a_info["title"] p_lib=""  p_header=""/>

<div class="ym_nein_main">
	<div class="c_box">

		<div class="w_h_20"></div>
		<h1 class="c_title">${a_info["title"]}</h1>
		<div class="w_h_20"></div>
		<div class="c_desc">发表时间：${a_info["create_time"]}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;文章来源：正道拍卖  </div>
		<hr class="c_hr"/>

		<div class="c_info">${a_info["content"]}</div>		
		
	</div>
	<div class="w_clear w_h_50"></div>
</div>



<@m_site_footer />