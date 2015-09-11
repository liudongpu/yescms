
 <#include "../../macro/macro_site.ftl" />
<@m_web_init_dbcall />
<@m_web_init_sessionhelper />
<#assign   a_keyword=a_macro_web_sessionhelper.upRequest("u_keyword") />
<#assign   a_list=a_macro_web_dbcall.queryAll("yc_good","","-zid"," `name` like :keyword or `code` like  :keyword ","keyword","%"+a_keyword+"%") />
<#assign   a_people=a_macro_web_dbcall.queryAll("yc_people","","-zid"," `name` like :keyword  ","keyword","%"+a_keyword+"%") />

<@m_site_header p_title=a_keyword/>
<@m_site_body_begin />
<@m_site_body_nav p_text=["搜索结果",a_keyword]   />

<@m_web_init_dbcall />



<div class="ycsite_sp_box">

<div  class="ycsite_sp_box_count  ycbase_body_back_layout">
<span class="c_s1">搜索结果</span> 您目前在 全站 搜索关键字“<span class="c_s2">${a_keyword}</span> ”,  共找到  <span class="c_s2">${a_list?size+a_people?size}</span> 个内容
</div>
<div class="w_h_20"></div>



<div  class="ycsite_sp_box_tab ycbase_body_back_layout">
	<div class="c_box">
		<div class="c_back"></div>
		<div class="c_tab">
			<div class="c_item c_active w_pointer " id="ycsite_sp_box_tab_nav_0" onclick="yclib.search_change(0)">
				拍品
			</div>
			<div class="c_item w_pointer" id="ycsite_sp_box_tab_nav_1"   onclick="yclib.search_change(1)">
				大师
			</div>
			
		</div>
		
	</div>


</div>

<div id="ycsite_sp_box_tab_item_0"  >
	<div class=" ycbase_body_back_layout">
	<#if (a_list?size>0)>
	<table class="yctop_table ">
		<thead>
			<tr>
				<th>
					拍品编号
				</th>
				<th>
					拍品名称
				</th>
				<th>
					拍品图片				
				</th>
				<th>
					拍品详情	
				</th>
				
			</tr>
		</thead>
		<tbody>
			<#list a_list as el>
				<tr onclick="<@m_web_event_href p_link="good_info?u_id="+el["uid"] />">
					<td>
						${el["code"]}
					</td>
					<td>
						${el["name"]}
					</td>
					<td>
						<@m_web_html_img p_img=el["file_url"]?split('|')[0]  p_width=55/> 
					</td>
					<td>
						查看详情	
					</td>
					
				</tr>
				
			</#list>
		</tbody>
	</table>
	<div class="w_h_100"></div>
	<#else>
		<div class="ycsite_sp_box_noresult">暂无搜索结果！</div>
		<div class="w_h_100"></div>
		<div class="w_h_100"></div>
		<div class="w_h_100"></div>
	</#if>
	
	</div>
</div>



<div id="ycsite_sp_box_tab_item_1" class=" w_display" >
	<#if (a_people?size>0)>
	<div class="ycsite_pel_box ycbase_body_back_layout">
	<#list a_people as el>
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
	</div>
	<#else>
		<div class="ycsite_sp_box_noresult">暂无搜索结果！</div>
		<div class="w_h_100"></div>
		<div class="w_h_100"></div>
	</#if>
	<div class="w_clear w_h_100"></div>
	
</div>


</div>
<@m_site_body_end />
<@m_site_footer/>