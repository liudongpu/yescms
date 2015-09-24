 <#include "../../macro/macro_mobile.ftl" />

<@m_web_init_dbcall />
<@m_web_init_sessionhelper />
<#assign   a_info=a_macro_web_dbcall.upOne("yc_people","uid",a_macro_web_sessionhelper.upRequest("u_id")) />
<#assign   a_list=a_macro_web_dbcall.queryAll("yc_good","yc_good.*,(select time  from yc_special where yc_special.uid=yc_good.special_uid) as time","-zid","","people_uid",a_info["uid"]) />
<#assign   a_count=a_macro_web_dbcall.upOneWhere("yc_good"," count(1) as v_sum,ifnull(sum(success_price),0) as v_money,ifnull(sum(success_price)/count(1),0) as v_sqrt,ifnull(max(success_price),0) as v_max ","","people_uid=:people_uid and success_price>0","people_uid",a_info["uid"]) />

<@m_site_header p_title="个人主页" p_lib=""  p_header=""/>
<div class="ym_pego_main" >
	<div class="c_t_bg">
		<div class="c_t_img">
			<div><@m_web_html_img p_img=a_info["file_url"]  p_width=160/></div>
			<div class="c_t_name">${a_info["name"]}</div>
		</div>
	
	</div>
	<div class="c_n_box">
		<div id="ym_pego_nav_id_menu_0" class="c_n_item c_n_bright c_n_active" <@m_web_event_click p_js="ycmobile.people_good_nav(0)"/> >个人简介</div>
		<div id="ym_pego_nav_id_menu_1" class="c_n_item " <@m_web_event_click p_js="ycmobile.people_good_nav(1)"/> >拍卖行情</div>
	</div>
	
	<div id="ym_pego_nav_id_info_0" class="c_u_box ">
		${a_info["note"]}
	</div>
	<div id="ym_pego_nav_id_info_1" class="c_g_box w_display">
		<div class="w_h_20"></div>
		<div class="c_g_sum  ">
			<ul class="w_ul">                        
				<li>成交总数(件)<br/>   <span>${a_count["v_sum"]}</span></li>
				<li>成交总额(元)<br/>  <span><@m_web_format_money p_money=a_count["v_money"]/></span></li>
				<li>最高单价(元)<br/>   <span><@m_web_format_money p_money=a_count["v_max"]/></span></li>
				<li class="c_none">成交均价(元)<br/>  <span><@m_web_format_money p_money=a_count["v_sqrt"]/></span></li>
			</ul>
			<div class="w_clear"></div>
		</div>
		
		<div class="c_g_list">
	
			<#list a_list as el>
				<div class="c_item" <@m_web_event_click p_link="good_info?u_type=people&u_id="+el["uid"]  /> >
					<div class="c_detail  <#if (el_index%2==0)>c_one</#if>">
						<div class="c_img">
							<@m_web_html_img p_img=el["file_url"]?split('|')[0]  p_width=295/> 
						</div>
						
						
						<div class="c_label">
							<div class="c_title">${el["name"]}</div>
							<div class="c_desc">拍卖日期：${el["time"]}</div>
							<div class="c_desc">估价：${el["assess_price"]}</div>
							<div class="c_desc">成交价：<span class="ym_b_money"><@m_web_format_money p_money=el["success_price"]/></span></div>
						</div>
					</div>
				</div>
				<#if (el_index%2==1)><div class="w_clear"></div></#if>
			</#list>
			<div class="w_clear"></div>
		</div>
		
	
	</div>
	
	<div class="w_clear w_h_50"></div>
</div>


<@m_site_footer />