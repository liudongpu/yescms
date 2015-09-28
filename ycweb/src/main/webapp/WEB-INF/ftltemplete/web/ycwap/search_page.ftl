
 <#include "../../macro/macro_mobile.ftl" />
<@m_web_init_dbcall />
<@m_web_init_sessionhelper />
<#assign   a_keyword=a_macro_web_sessionhelper.upRequest("u_keyword") />



<#assign   a_addwhere="" />
<#assign a_showtext="暂无搜索结果！" />
<#if a_keyword=="">
<#assign   a_addwhere=" 1=2 and " />
<#assign a_showtext="还没有搜索内容哦~" />
</#if>


<#assign   a_list=a_macro_web_dbcall.queryAll("yc_good","","-zid",a_addwhere+" (`name` like :keyword or `code` like  :keyword) ","keyword","%"+a_keyword+"%") />
<#assign   a_people=a_macro_web_dbcall.queryAll("yc_people","","-zid",a_addwhere+" `name` like :keyword  ","keyword","%"+a_keyword+"%") />



<@m_site_header p_title=a_keyword  p_lib=""  p_header="search"  p_back="index"/>




<div class="ym_sepa_main">


<div  class="ym_sepa_tab">
	<div class="c_box">
		<div class="c_tab">
			<div class="c_item c_active c_bright " id="ycsite_sp_box_tab_nav_0" onclick="ycmobile.search_change(0)">
				拍品
			</div>
			<div class="c_item " id="ycsite_sp_box_tab_nav_1"   onclick="ycmobile.search_change(1)">
				大师
			</div>
			<div class="w_clear"></div>
		</div>
		
	</div>


</div>

<div id="ycsite_sp_box_tab_item_0"  >
	<div>
	<#if (a_list?size>0)>
	
		<div class="w_h_20"></div>
		<div class="ym_goli_main">
			
			<#list a_list as el>
				<div class="c_item" <@m_web_event_click p_link="good_info?u_id="+el["uid"] /> >
					<div class="c_detail  <#if (el_index%2==0)>c_one</#if>">
						<div class="c_img">
							<@m_web_html_img p_img=el["file_url"]?split('|')[0]  p_width=320/> 
						</div>
						
						
						<div class="c_label">
							<div class="c_title">${el["name"]}</div>
							<div class="c_desc">图录号：${el["code"]}</div>
							<div class="c_desc">估价：${el["assess_price"]}</div>
							<div class="c_desc">成交价：<span class="ym_b_money"><@m_web_format_money p_money=el["success_price"]/></span></div>
						</div>
					</div>
				</div>
				<#if (el_index%2==1)><div class="w_clear"></div></#if>
			</#list>
			<div class="w_clear w_h_50"></div>
		</div>
	
	
	
		
		<div class="w_h_100"></div>
	<#else>
		<div class="ym_sepa_noresult">
			<div class="c_no_box">
				<div class="c_no_img"></div>
				<div class="c_no_text">${a_showtext}</div>
			</div>
		
		</div>
		<div class="w_h_100"></div>
		<div class="w_h_100"></div>
		<div class="w_h_100"></div>
	</#if>
	
	</div>
</div>



<div id="ycsite_sp_box_tab_item_1" class=" w_display" >
	<#if (a_people?size>0)>
		<div class="w_h_20"></div>
		<div class="ym_peli_main">
			
			<#list a_people as el>
				<div class="c_item" <@m_web_event_click p_link="people_good?u_id="+el["uid"] /> >
					<div class="c_detail  <#if (el_index%2==0)>c_one</#if>">
						<div class="c_img">
							<@m_web_html_img p_img=el["file_url"]?split('|')[0]  p_width=320/> 
						</div>
						
						
						<div class="c_label">
							<div class="c_title">${el["name"]}</div>
							
							
						</div>
					</div>
				</div>
				<#if (el_index%2==1)><div class="w_clear"></div></#if>
			</#list>
			<div class="w_clear w_h_50"></div>
		</div>
	<#else>
		<div class="ym_sepa_noresult">
			<div class="c_no_box">
				<div class="c_no_img"></div>
				<div class="c_no_text">${a_showtext}</div>
			</div>
		
		</div>
		<div class="w_h_100"></div>
		<div class="w_h_100"></div>
	</#if>
	<div class="w_clear w_h_100"></div>
	
</div>


</div>


<@m_site_footer />