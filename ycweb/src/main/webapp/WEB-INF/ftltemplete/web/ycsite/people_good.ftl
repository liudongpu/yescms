
 <#include "../../macro/macro_site.ftl" />
<@m_web_init_dbcall />
<@m_web_init_sessionhelper />
<#assign   a_info=a_macro_web_dbcall.upOne("yc_people","uid",a_macro_web_sessionhelper.upRequest("u_id")) />
<#assign   a_list=a_macro_web_dbcall.queryAll("yc_good","yc_good.*,(select time  from yc_special where yc_special.uid=yc_good.special_uid) as time","-zid","","people_uid",a_info["uid"]) />
<#assign   a_count=a_macro_web_dbcall.upOneWhere("yc_good"," count(1) as v_sum,ifnull(sum(success_price),0) as v_money,ifnull(sum(success_price)/count(1),0) as v_sqrt,ifnull(max(success_price),0) as v_max ","","","people_uid",a_info["uid"]) />


<@m_site_header p_title=a_info["name"]/>
<@m_site_body_begin />
<@m_site_body_nav p_text=["名家论道",a_info["name"]] p_link=["people_list"]  />

<@m_web_init_dbcall />

<div class="ycsite_pg_info" >

	<div class="c_info  ycbase_body_back_layout">
		<div class="c_left"><@m_web_html_img p_img=a_info["file_url"]  p_width=254/> </div>
		
		<div class="c_right"><div class="w_h_10"></div><div><h1 class="yctop_h1">${a_info["name"]} </h1></div><div class="w_h_10"></div>
<div>${a_info["note"]}</div> </div>
		<div class="w_clear"></div>
	</div>
	
	<div class="w_h_20"></div>
	<div class="c_label ycbase_body_back_layout"><@m_web_html_href "people_auction?u_id="+a_info["uid"] "拍卖行情" /></div>
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
	<div class="c_label ycbase_body_back_layout"> 作品赏析</div>
	
</div>


<#assign auction_list_year=(.now?date?substring(0,4)) />

<div class="ycsite_al_box ycbase_body_back_layout" >



	<div class="c_item">
		<div class="w_h_50">
	
		</div>
		<div class="c_buy ycbase_img_ycico">
		</div>
	</div>
	<#list a_list as el>
		<#assign auction_list_year=el["time"]?substring(0,4) />
		<div class="c_item">
			
			<div class="c_info">
				
				<div class="c_p_border">
				
					<div class="c_p_image">
						<@m_web_html_img p_img=el["file_url"] p_link="good_info?u_type=people&u_id="+el["uid"] p_width=235/> 
					</div>
					<div class="w_h_15"></div>
					<div class="c_title">
					<@m_web_html_href "good_info?u_type=people&u_id="+el["uid"] el["name"]/>	
					</div>
					<div class="w_h_10"></div>
					<div class="c_desc">
						时间：${el["time"]}
					</div>
					<div class="w_h_20"></div>
				</div>
				<div class="w_h_40">
				</div>
			</div>
			<div class="c_icon">
				<div class="c_month ycbase_img_ycico">
					<div class="c_num"><span>${el["time"]?substring(5,7)?replace("0","")}</span>月</div>
					<div class="c_year">${auction_list_year}</div>
				</div>
			</div>
		</div>
		
	</#list>

	<div class="c_item">
			
			<div class="c_info">
				<div class="w_h_30"></div>
				<div class="c_line">
				</div>
				
			</div>
			<div class="c_bot">
				<div class="c_last ycbase_img_ycico" >
					${auction_list_year}<br/>年
				</div>
			</div>
			<div class="c_cat">
				
					${auction_list_year}年
				
			</div>
			
	</div>
	
	<div class="w_clear"></div>
	<div class="w_h_100">
	
	</div>
</div>

<@m_site_body_end />
<@m_site_footer/>