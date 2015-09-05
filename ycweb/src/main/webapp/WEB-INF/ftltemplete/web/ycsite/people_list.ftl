
 <#include "../../macro/macro_site.ftl" />
<@m_site_header p_title="名家论道"/>
<@m_site_body_begin />
<@m_site_body_nav p_text=["名家论道","列表"]  />

<@m_web_init_dbcall />

<#assign   a_list=a_macro_web_dbcall.queryAll("yc_people","","-zid","") />


<div class="ycsite_pel_box" >
	
	<#list a_list as el>
		<div class="c_item">
			<div class="c_box">
				<#if el["file_url"]!="">
				<div class="c_image">
					<@m_web_html_img p_img=el["file_url"]  p_link="people_good?u_id="+el["uid"]  p_width=246/> 
				</div>
				</#if>
				<div class="c_name">
					
					<@m_web_html_href "people_good?u_id="+el["uid"] el["name"]/>	
				</div>
				<div class="w_h_30"></div>
			</div>
		</div>
	</#list>
	<div class="w_clear w_h_50"></div>
</div>

<@m_site_body_end />
<@m_site_footer/>