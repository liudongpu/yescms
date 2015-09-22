
 <#include "../../macro/macro_site.ftl" />
<@m_site_header p_title="正道指数"/>
<@m_site_body_begin />
<@m_site_body_nav p_text=["正道指数","列表"]  />

<@m_web_init_dbcall />

<#assign   a_list=a_macro_web_dbcall.queryAll("yc_people","yc_people.*,(select count(1) from yc_good where yc_good.people_uid=yc_people.uid and yc_good.success_price>0) as v_count,(select ifnull(sum(success_price),0) from yc_good where yc_good.people_uid=yc_people.uid) as v_success ","-v_success,convert(`name` USING gbk) COLLATE gbk_chinese_ci","") />


<div class="ycsite_pel_box" >
	
	<#list a_list as el>
		<div class="c_item">
			<div class="c_box">
				<#if el["file_url"]!="">
				<div class="c_image">
					<@m_web_html_img p_img=el["file_url"]  p_link="people_good?u_id="+el["uid"]  p_width=246/> 
				</div>
				</#if>
				<div class="c_act">
					成交数量：${el["v_count"]}</br>
					成交总额：<@m_web_format_money p_money=el["v_success"] />
				</div>
				<div class="w_h_30"></div>
				<div class="w_opacity_90 c_pos"></div>
				<div class="c_pzin"><@m_web_html_href "people_good?u_id="+el["uid"] el["name"]/></div>
			</div>
		</div>
	</#list>
	<div class="w_clear w_h_50"></div>
</div>

<@m_site_body_end />
<@m_site_footer/>