
<#include "../../macro/macro_mobile.ftl" />
<@m_web_init_dbcall />
<@m_web_init_membercode />
<#assign  a_info=a_macro_web_dbcall.upOne("mc_member_info","member_code",a_macro_web_membercode) />
<#assign   a_list=a_macro_web_dbcall.queryAll("mc_user_send","","-zid","","member_code",a_info["member_code"]) />
<@m_site_header p_title="在线送拍" p_lib=""  p_header=""/>

<div class="ym_usse_main">
	
	
				<div class="ym_usse_table" >
					<table class="ym_b_table ">
						<thead>
							<tr>
								<th  style="width:70%;">
									拍品名称
								</th>
								
								<th style="width:30%;">
									委托价格
								</th>
								
								
							</tr>
						</thead>
						<tbody>
							<#list a_list as el>
								<tr onclick="<@m_web_event_href p_link="user_sendinfo?u_id="+el["uid"] />">
									
									<td>
										${el["good_name"]}
									</td>
									
									<td>
										${el["good_price"]}
									</td>
									
								</tr>
								
							</#list>
						</tbody>
					</table>
					
				</div>
	
	
	<div class="w_h_40"></div>
	
	<@m_site_form_button p_text="我要送拍" p_link="user_sendok" />
	
	<div class="w_h_40"></div>
	
</div>





<@m_site_footer />