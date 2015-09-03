
 <#include "../../macro/macro_site.ftl" />
<@m_site_header p_title="正道资讯"/>
<@m_site_body_begin />
<@m_site_body_nav p_text=["正道资讯","列表"]  />

<@m_web_init_dbcall />

<#assign   a_list=a_macro_web_dbcall.queryAll("yc_news","","-orderid,-create_time","") />


<div class="ycsite_nl_box" id="ycsite_nl_box">
	
	<#list a_list as el>
		<div class="c_item">
			<div class="c_box">
				<#if el["file_url"]!="">
				<div class="c_image">
					<@m_web_html_img p_img=el["file_url"]  p_link="news_info?u_id="+el["uid"]/> 
				</div>
				</#if>
				<div class="c_padding">
					<div class="c_title">
						
						<@m_web_html_href "news_info?u_id="+el["uid"] el["title"]/>	
					</div>
					<div class="w_h_10"></div>
					<div class="c_note">
						${el["note"]}
					</div>
				</div>
				<div class="c_footer">
					<div class="c_share ycbase_img_ycico">
						${el["create_time"]}
					</div>
				</div>

			</div>
		</div>
	</#list>
	
</div>

<@m_site_body_end />
<@m_site_footer p_initjs="yclib.page_news_list_init()"/>