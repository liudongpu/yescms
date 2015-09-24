
 <#include "../../macro/macro_site.ftl" />
<@m_web_init_dbcall />
<@m_web_init_sessionhelper />
<#assign   a_info=a_macro_web_dbcall.upOne("yc_people","uid",a_macro_web_sessionhelper.upRequest("u_id")) />
<#assign   a_list=a_macro_web_dbcall.queryAll("yc_good","yc_good.*,(select time  from yc_special where yc_special.uid=yc_good.special_uid) as time","-zid","","people_uid",a_info["uid"]) />
<#assign   a_count=a_macro_web_dbcall.upOneWhere("yc_good"," count(1) as v_sum,ifnull(sum(success_price),0) as v_money,ifnull(sum(success_price)/count(1),0) as v_sqrt,ifnull(max(success_price),0) as v_max ","","people_uid=:people_uid and success_price>0","people_uid",a_info["uid"]) />


<@m_site_header p_title=a_info["name"]/>
<@m_site_body_begin />
<@m_site_body_nav p_text=["正道指数","拍卖行情"] p_link=["people_list"]  />

<@m_web_init_dbcall />

<div class="ycsite_pg_info" >

	
	<div class="c_label ycbase_body_back_layout"><@m_web_html_href "good_info?u_id="+a_info["uid"] "拍卖行情" /></div>
	<div class="c_sum  ycbase_body_back_layout">
		<ul class="w_ul">                        
			<li>成交总数     <span>${a_count["v_sum"]}</span>&nbsp;&nbsp;件</li>
			<li>成交总额    <span><@m_web_format_money p_money=a_count["v_money"]/></span></li>
			<li>最高单价    <span><@m_web_format_money p_money=a_count["v_max"]/></span></li>
			<li class="c_none"> 成交均价     <span><@m_web_format_money p_money=a_count["v_sqrt"]/></span></li>
		</ul>
		<div class="w_clear"></div>
	</div>
	<div class="w_h_20"></div>

</div>


<#assign auction_list_year=(.now?date?substring(0,4)) />

<div class="ycsite_pa_box ycbase_body_back_layout" >


	<table class="yctop_table ">
		<thead>
			<tr>
				<th>
					图片
				</th>
				<th>
					作品名称
				</th>
				<th>
					估价
				</th>
				<th>
					成交价
				</th>
				<th>
					拍卖日期
				</th>
			</tr>
		</thead>
		<tbody>
			<#list a_list as el>
				<tr onclick="<@m_web_event_href p_link="good_info?u_type=people&u_id="+el["uid"] />">
					<td>
						<@m_web_html_img p_img=el["file_url"]?split('|')[0]  p_width=55/> 
					</td>
					<td>
						${el["name"]}
					</td>
					<td>
						${el["assess_price"]}
					</td>
					<td>
						${el["success_price"]}
					</td>
					<td>
						${el["time"]}
					</td>
				</tr>
				
			</#list>
		</tbody>
	</table>
	
	<div class="w_h_50"></div>
</div>

<@m_site_body_end />
<@m_site_footer/>