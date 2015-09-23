 <#include "../../macro/macro_mobile.ftl" />

<@m_web_init_dbcall />
<@m_web_init_sessionhelper />
<#assign   a_list=a_macro_web_dbcall.queryAll("yc_people","yc_people.*,(select count(1) from yc_good where yc_good.people_uid=yc_people.uid and yc_good.success_price>0) as v_count,(select ifnull(sum(success_price),0) from yc_good where yc_good.people_uid=yc_people.uid) as v_success ","-v_success,convert(`name` USING gbk) COLLATE gbk_chinese_ci","") />

<@m_site_header p_title="正道指数" p_lib=""  p_header=""/>

<div class="ym_peli_main">
	
	<#list a_list as el>
		<div class="c_item" <@m_web_event_click p_link="people_good?u_id="+el["uid"] /> >
			<div class="c_detail  <#if (el_index%2==0)>c_one</#if>">
				<div class="c_img">
					<@m_web_html_img p_img=el["file_url"]?split('|')[0]  p_width=295/> 
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



<@m_site_footer />