
<#include "../../macro/macro_site.ftl" />

<@m_web_init_dbcall />
<@m_web_init_sessionhelper />


<#assign   a_pagedata=a_macro_web_dbcall.upPageData("yc_notice","","-orderid,-create_time","",a_macro_web_sessionhelper.upRequest(a_macro_web_pagenav_pageindex),"10") />


<@m_site_header p_title="正道公告"/>
<@m_site_body_begin />
<@m_site_body_nav p_text=["正道公告","列表"]  />


<div class="ycsite_ni_box ycbase_body_back_layout" >
	<div class="ycsite_common_info_left">
		<div class="w_h_30"></div>
		<#list a_pagedata.getPageData() as el>
			<h1 class="yctop_h1"><@m_web_html_href "notice_info?u_id="+el["uid"] el["title"]/></h1>
			<div class="w_h_20"></div>
			<div class="yctop_desc">发表时间：${el["create_time"]}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;文章来源：正道拍卖  </div>
			<div class="w_h_30"></div>
			<div class="yctop_info">${el["content"]}</div>		
			<hr class="yctop_hr"/>
			<div class="w_h_20"></div>
		</#list>

		<@m_site_pagenav a_pagedata.getPageInfo() />
	</div>
	
	<div class="ycsite_common_info_right">
		<@m_site_sub_list />
	</div>
	<div class="w_clear"></div>
</div>




<@m_site_body_end />
<@m_site_footer/>