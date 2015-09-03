
 <#include "../../macro/macro_site.ftl" />


<@m_web_init_dbcall />
<@m_web_init_sessionhelper />
<#assign   a_info=a_macro_web_dbcall.upOne("yc_special","uid",a_macro_web_sessionhelper.upRequest("u_id")) />
<#assign   a_list=a_macro_web_dbcall.queryAll("yc_good","","-zid","","special_uid",a_info["uid"]) />
<#assign   a_auction=a_macro_web_dbcall.upOne("yc_auction","uid",a_info["auction_uid"]) />

<@m_site_header p_title=a_info["name"]/>
<@m_site_body_begin />
<@m_site_body_nav p_text=["预展及成交",a_info["name"]]  p_link=["auction_list"] />



<div class="ycsite_gl_box ycbase_body_back_layout" >


<div class="ycsite_gl_top">
	<div class="c_back">
	
		<h1 class="yctop_h1">| ${a_info["name"]}</h1>
	</div>
	<div class="w_h_20"></div>
	<div class="c_img">
		
		<@m_web_html_img p_img=a_auction["file_url"] p_width=1100 p_link="specital_list?u_id="+a_auction["uid"]/> 
	</div>
	<div class="w_h_20"></div>
</div>
	

<div class="ycsite_gl_show">

	<#assign a_good_list_index=-1 />
	<#list a_list as el>

		<#if (el_index%4)==0>
			<#if (el_index>0) >
				<div class="w_clear"></div></div>
			</#if>
		
			<div class="c_border">
			
			<#assign a_good_list_index=1 />
			

		<#else>
			<#assign a_good_list_index=0 />
			
		</#if>

		
		<#if (el_index%4)==3 >
			<div class="c_item c_last">	
		<#else>
			<div class="c_item">
		</#if>
				<div class="c_box">
					<#if el["file_url"]!="">
					<div class="c_image">
						<@m_web_html_img p_img=el["file_url"] p_width=232 p_link="good_info?u_id="+el["uid"]/> 
					</div>
					</#if>
					
					<div class="c_title">
							
						<@m_web_html_href "good_info?u_id="+el["uid"] el["name"]/>	
					</div>
					
					<div class="c_detail">图录号：${el["code"]}</div>	
					<div class="c_detail">参考价：${el["assess_price"]} </div>
					<div class="c_detail">成交价：<span class="yctop_price">${el["success_price"]}</span></div>
					
	
				</div>
			</div>
		
	</#list>
	
	<#if a_good_list_index==0>
		<div class="w_clear"></div></div><div class="c_border"></div>

	</#if>

	<div class="w_clear w_h_50"></div>
</div>
</div>

<@m_site_body_end />
<@m_site_footer />