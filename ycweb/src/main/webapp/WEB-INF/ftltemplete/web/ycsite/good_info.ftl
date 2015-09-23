
 <#include "../../macro/macro_site.ftl" />

<@m_web_init_dbcall />
<@m_web_init_sessionhelper />
<#assign  a_info=a_macro_web_dbcall.upOne("yc_good","uid",a_macro_web_sessionhelper.upRequest("u_id")) />
<#assign  a_special=a_macro_web_dbcall.upOne("yc_special","uid",a_info["special_uid"]) />
<#assign  a_auction=a_macro_web_dbcall.upOne("yc_auction","uid",a_special["auction_uid"]) />

<#assign   a_where=" special_uid='"+a_info["special_uid"]+"' " />

<#assign   a_url="good_info?u_id="  />
<#assign   a_last=a_macro_web_dbcall.query("yc_good","","-zid",a_where+" and zid<:zid" ,0,6,"zid",a_info["zid"])  />

<#assign   a_next=a_macro_web_dbcall.query("yc_good","","zid",a_where+" and zid>=:zid" ,0,7,"zid",a_info["zid"])  />

<#assign   a_image=a_info["file_url"]?split('|')  />
<#assign   a_img_size=a_image?size  />
<#assign   a_l_size=a_last?size  />
<#assign   a_n_size=a_next?size  />

<@m_site_header p_title=a_info["title"]/>
<@m_site_body_begin />
<@m_site_body_nav p_text=["预展及成交",a_info["name"]] p_link=["auction_list"]  />


<div class="ycsite_gi_box ycbase_body_back_layout" >
	<div class="c_top">
		<div class="c_box">
		
			<div class="c_img">
			
				
				
				
				
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				 
				
				
				  <!-- Wrapper for slides -->
				  <div class="carousel-inner" role="listbox">
				  
				  	<#list a_image as el>
						<div class="item <#if el_index==0> active </#if>">
				      		
				      		<@m_web_html_img p_img=el   /> 
				      		<div class="carousel-caption">
				        		&nbsp;
				      		</div>
				    	</div>
					</#list>
				  
				    
				    
				  </div>
				<#if (a_img_size>1)>
					  <!-- Controls -->
					  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
				  </#if>
				</div>
				
				
				
			</div>
			<div class="w_h_10"></div>
			<div class="c_nav">
				<div class="c_click  ycbase_img_ycico">
					<span class="c_click_label">上一拍品</span><br/>
					<#if (a_l_size>0)>
						
						<@m_web_html_href a_url+a_last[0]["uid"] a_last[0]["name"] />
					</#if>
				</div>
				<div class="c_select">
					

					
						<div id="ycsite_gi_box_select_last" class="c_select_to "><@m_web_html_href "javascript:yclib.page_good_change('l',"+a_img_size+")" "&lt;"/></div>
					
					
					
						<div class="c_select_box">
							<div id="ycsite_gi_box_select_box"  class="c_select_fix">
							<#list a_image as el>
								
									<div class="c_select_item">
										<div class="c_select_image" >
											<@m_web_html_img p_img=el p_width=103 p_link="javascript:$('#carousel-example-generic').carousel("+el_index+")" /> 
										</div>
									</div>
								
							</#list>
							</div>
						</div>
					

					<#if (a_img_size>6)>
						<div id="ycsite_gi_box_select_next" class="c_select_to c_select_right c_select_active"><@m_web_html_href "javascript:yclib.page_good_change('n',"+a_img_size+")" "&gt;"/></div>
					<#else>
						<div class="c_select_to  c_select_right">&gt;</div>
					</#if>

					
				</div>
				<div class="c_click  ycbase_img_ycico">
				
					<span class="c_click_label">下一拍品</span><br/>
					<#if (a_n_size>1)>
						<@m_web_html_href a_url+a_next[1]["uid"] a_next[1]["name"] />
					</#if>
				</div>
			</div>
			<div class="w_h_40"></div>
			
		</div>
	</div>
	<div class="c_center">
		<div class="c_name">
			<h1 class="yctop_h1">${a_info["name"]}</h1>
		</div>
		<div class="c_box c_bb ">
			<div class="c_c_left">
				图录号：${a_info["code"]} <br/>质地：${a_info["texture"]}<br/> 尺寸：${a_info["size"]}  <br/>参考价：${a_info["assess_price"]} <br/>成交价：<span class="yctop_price"><@m_web_format_money p_money=a_info["success_price"]/></span>
			</div>
			<div class="c_c_right">
				<div class="c_auction"><@m_web_html_href "specital_list?u_id="+a_auction["uid"] "拍卖会："+a_auction["name"]/>	</div>
				<div class="w_h_10"></div>
				<@m_web_html_href "good_list?u_id="+a_special["uid"] "专场："+a_special["name"]/>
				 <br/>  时间：${a_special["time"]}
			</div>
			<div class="w_clear"></div>
		</div>
		<div class="c_box c_bb">
			<div class="w_fw_b w_fs_14 yctop_c_7">拍品介绍：</div>
			<div class="yctop_c_5">${a_info["note"]}</div>
		</div>
		<div class="c_box c_bb">
			<div class="w_fw_b w_fs_14 yctop_c_7">相关信息：</div>
			<div><ul class="w_ul"><li><a href="static_info?u_code=4653000100010002" >竞买流程</a></li>
						<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
						<li><a href="static_info?u_code=4653000100010003" >竞买须知</a></li>
						<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
						<li><a href="static_info?u_code=4653000100010004" >委托须知</a></li>
						<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
						<li><a href="static_info?u_code=4653000100010005" >拍卖规则</a></li></ul>
			</div>
		</div>
		
		
	</div>
	<div class="c_bottom">
		<@m_site_comment_list p_uid=a_info["uid"] p_title=a_info["title"] p_url="good_info?u_id="+a_info["uid"] />
	</div>
	<div class="w_h_100"></div>
</div>

<@m_site_body_end />
<@m_site_footer p_initjs=""/>