
 <#include "../../macro/macro_site.ftl" />
<@m_web_init_dbcall />
<@m_web_init_membercode />
<#assign  a_list=a_macro_web_dbcall.queryAll("mc_user_collect","","-zid","","member_code",a_macro_web_membercode) />

<@m_site_header p_title="我的收藏"/>
<@m_site_body_begin />
<@m_site_body_nav p_text=["个人中心","我的收藏"] p_link=["user_set?"] />

<div class="ycsite_user_box  ycbase_body_back_layout">

	<@m_site_user_menu p_index=2 />
	
	<div class="ycsite_user_right">
		<div class="c_u_title">我的收藏</div>
		<div class="">
				<div class="ycsite_member_table" >
					<table class="yctop_table ">
						<thead>
							<tr>
								<th  style="width:30%;">
									标题
								</th>
								
								<th style="width:20%;">
									收藏时间
								</th>
								<th  style="width:10%;">
									查看
								</th>
								
							</tr>
						</thead>
						<tbody>
							<#list a_list as el>
								<tr onclick="<@m_web_event_href p_link=el["info_url"] />">
									
									<td>
										${el["info_title"]}
									</td>
									
									<td>
										${el["collect_date"]}
									</td>
									<td>
										查看
									</td>
								</tr>
								
							</#list>
						</tbody>
					</table>
				</div>
		</div>
	</div>

	<div class="w_clear">
	</div>
</div>





<@m_site_body_end />
<@m_site_footer/>