
<#include "../../macro/macro_site.ftl" />

<@m_web_init_dbcall />
<@m_web_init_sessionhelper />
<#assign   a_info=a_macro_web_dbcall.upOne("yc_auction","uid",a_macro_web_sessionhelper.upRequest("u_id")) />
<#assign   a_list=a_macro_web_dbcall.queryAll("yc_special","","-time,-zid","","auction_uid",a_info["uid"]) />


<@m_site_header p_title=a_info["name"] />
<@m_site_body_begin />
<@m_site_body_nav p_text=["预展及成交",a_info["name"]] p_link=["auction_list"] />




<div class="ycsite_sl_box ycbase_body_back_layout" >
	<div class="c_box" >
		<div class="w_h_40"></div>
		<div><h1 class="yctop_h1">${a_info["name"]}</h1> </div>
		<div class="w_h_20"></div>
		<div class="c_desc">时间：${a_info["time"]}       <span  class="yctop_price">成交总金额：<@m_web_format_money p_money=a_info["success_price"] /></span></div>
		<div class="w_h_30"></div>
		<div class="c_aucimg"><@m_web_html_img p_img=a_info["file_url"]  p_width=960/> </div>
		<div class="w_h_30"></div>
	</div>
	<div class="c_line" >
	</div>
	<div class="c_box" >
		<#list a_list as el>	

			<div class="c_item c_line">
				<div class="w_clear w_h_30"></div>
				<div class="c_left">
					<@m_web_html_img p_img=el["file_url"]  p_link="good_list?u_id="+el["uid"]  p_width=235/> 
				</div>
				<div class="c_right">
					<div class="c_title"><@m_web_html_href "good_list?u_id="+el["uid"] el["name"]/></div>
					<div class="w_h_20"></div>
					<div class="c_fix">时间：${el["time"]}</div>
					<div class="c_fix">成交总金额：<span  class="yctop_price"><@m_web_format_money p_money=el["success_price"]/></span></div>
				</div>
				<div class="w_clear w_h_30"></div>
			</div>
			
		</#list>
	</div>
	<div class="w_h_100"></div>
</div>

<@m_site_body_end />
<@m_site_footer />