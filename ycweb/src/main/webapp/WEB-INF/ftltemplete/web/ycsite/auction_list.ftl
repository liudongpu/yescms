
 <#include "../../macro/macro_site.ftl" />
<@m_site_header p_title="预展及成交"/>
<@m_site_body_begin />
<@m_site_body_nav p_text=["预展及成交"]  />

<@m_web_init_dbcall />

<#assign   a_list=a_macro_web_dbcall.queryAll("yc_auction","","-time,-zid","") />

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
				
				<div class="c_border">
					
					<div class="c_title">
					<@m_web_html_href "specital_list?u_id="+el["uid"] el["name"]/>	
					</div>
					<div class="w_h_20"></div>
					<div class="c_desc">
						专场：共${el["special_num"]}个专场&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间：${el["time"]}
					</div>
					<div class="w_h_20"></div>
					<div class="c_image">
						<@m_web_html_img p_img=el["file_url"] p_link="specital_list?u_id="+el["uid"]/> 
					</div>
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