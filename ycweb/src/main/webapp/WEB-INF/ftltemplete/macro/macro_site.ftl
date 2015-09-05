 <#include "macro_web.ftl" />



<#assign a_macro_site_resources_thems_js=["lib/jquery/jquery-last.min.js","lib/jquery/jquery-site.min.js","lib/bootstrap-3.3.5/js/bootstrap.min.js","zapjs/zapapi.js","zapjs/zapfunc.js","yclib/js/yccall.js","yclib/js/yclib.js"] >


<#assign a_macro_site_resources_thems_css=["lib/bootstrap-3.3.5/css/bootstrap.min.css","zapweb/css/w.css","yclib/css/ycbase.css"] >





<#macro m_site_header p_title="" >
	
	<@m_web_html_begin p_title=p_title  p_js=a_macro_site_resources_thems_js p_css=a_macro_site_resources_thems_css  />

	<@m_web_body_begin />
	
	<div class="ycbase_header_layout">
		<div class="c_box">
			<div class="c_logo ycbase_img_ycico"></div>
			<div class="c_nav">
				<div class="c_nav_h"></div>
				<ul class="w_ul">
					<li><@m_web_html_href "index"  "首&nbsp;&nbsp;&nbsp;页"/> </li>
					<li><@m_web_html_href "news_list"  "正道资讯"/>  </li>
					<li><@m_web_html_href "notice_list"  "正道公告"/>  </li>
					<li><@m_web_html_href "auction_list"  "预展及成交"/>  </li>
					<li class="c_nav_last"><@m_web_html_href "people_list"  "名家论道"/>  </li>
					
				</ul>
			</div>
			<div class="c_right">
				<div class="ycbase_h_14"></div>
				<div class="c_user" id="yc_id_top_nav_user">
					<div class="c_button ycbase_img_ycico"> <@m_web_html_href "member_login"  "登录"/></div>
					<div class="c_button ycbase_img_ycico"><@m_web_html_href "member_reg"  "注册"/></div>
				</div>
				<div class="w_h_20 w_clear"></div>
				<div class="c_search ycbase_img_ycico">
					<input class="c_input" type="text"/>
				</div>
			</div>
		</div>
	</div>
	
</#macro>





<#macro m_site_footer p_initjs="">
	<div class="ycbase_footer_layout">
		<div class="c_box">
			<div class="ycbase_h_30"></div>
			<div class="c_left">
				<div class="c_nav">
					<ul class="w_ul">
						<li><a href="">正道简介</a></li>
						<li><a href="">竞买流程</a></li>
						<li><a href="">竞买须知</a></li>
						<li><a href="">委托须知</a></li>
						<li><a href="">拍卖规则</a></li>
						<li><a href="">联系方式</a></li>
						<li class="c_nav_last"><a href="">友情链接</a></li>
						
					</ul>
				</div>
				<div class="w_h_10 w_clear"></div>
				<div class="c_info">
					   贵宾专线：86-10-65760069\65769969          传真：86-10-65760969         邮箱：pm@boguanpaimai.com
				</div>
				<div class="w_h_10"></div>
				<div class="c_info">
					   北京市朝阳区三间房东路1号（懋隆文化产业创意园）10栋    京ICP备14007245号-1
				</div>
			</div>
			
			<div class="c_right">
				<div class="c_qrcode ycbase_img_ycico"></div>
			</div>
		</div>
	</div>
	
	<@m_web_body_end   />
	
	<#if p_initjs!="">
		<@m_web_html_initjs p_initjs/>
	</#if>
	
	
	<@m_web_html_end />
</#macro>




<#macro m_site_body_begin p_bg="" >
<div  class="ycbase_body_show_layout">
	<div class="ycbase_body_box_layout ${p_bg}">


</#macro>
<#macro m_site_body_end  >
	</div>
</div>
<div class="w_clear"></div>

</#macro>



<#macro m_site_body_nav  p_text=[] p_link=[]>
<div class="ycbase_body_nav_box">
	<div class="w_h_15"></div>
	<div class="c_icon ycbase_img_ycico">
	</div>
	<div class="c_link">
		<@m_web_html_href "index" "首页"/>
		<#list p_text as  ex >
			<#local l_link="" />
				<#list p_link as  ey >
					<#if ey_index==ex_index>
						<#local l_link=ey />
					</#if>
				</#list>
			&gt;&nbsp;<@m_web_html_href l_link ex/>
		</#list>
	</div>
	<div class="w_h_15 w_clear"></div>
	 
</div>
</#macro>


<#macro m_site_sub_list>

	<div class="yctop_subtitle ycbase_img_ycico">最新文章</div>
		<div class="w_h_10"></div>
		<div class="yctop_subinfo">
			<ul>
				<#list a_macro_web_dbcall.query("yc_news","","-orderid,-create_time","",0,10) as  el >
					<li>
						<@m_web_html_href "news_info?u_id="+el["uid"] el["title"]/>	
					</li>
				</#list>
			</ul>
		</div>
		<div class="w_h_40"></div>
		<div class="yctop_subtitle ycbase_img_ycico">最新公告</div>
		<div class="w_h_10"></div>
		<div class="yctop_subinfo">
			<ul>
				<#list a_macro_web_dbcall.query("yc_notice","","-orderid,-create_time","",0,10) as  el >
					<li>
						<@m_web_html_href "notice_info?u_id="+el["uid"] el["title"]/>	
					</li>
				</#list>
			</ul>
		</div>
		<div class="w_h_40"></div>

</#macro>




<#macro m_site_user_menu p_index=0>

	<div class="ycsite_user_left">
		<div class="c_head">个人中心</div>
		
		<@m_site_user_item p_num=0 p_index=p_index p_link="user_set?" p_text="账户设置" />
		<@m_site_user_item p_num=1 p_index=p_index p_link="user_password?" p_text="密码设置" />
		<@m_site_user_item p_num=2 p_index=p_index p_link="user_collect?" p_text="我的收藏" />
		<@m_site_user_item p_num=3 p_index=p_index p_link="" p_text="我的评论" />
		

	</div>
</#macro>

<#macro m_site_user_item p_num=0 p_index=0 p_link="" p_text="">

		<div class="c_item c_num_${p_num} <#if p_index==p_num> c_active </#if>">
			<div class="c_left ycbase_img_ycico"></div>
			<div class="c_center"><@m_web_html_href p_link p_text/></div>
			<#if p_index==p_num><div class="c_right ycbase_img_ycico"></div></#if>
			<div class="w_clear"></div>
		</div>

</#macro>



<#macro m_site_form_input p_id="" p_text="" p_value="" p_type="text" p_attr="" >

							<div class="form-group">
				    			<label for="${p_id}" class="col-sm-3 control-label">${p_text}： </label>
					    		<div class="col-sm-9">
					      			<input type="${p_type}" class="form-control"  name="${p_id}" value="${p_value}"  id="${p_id}" placeholder="请输入${p_text}" ${p_attr}/>
					    		</div>
				  			</div>

</#macro>

<#macro m_site_form_button p_text="" p_click="">
							<div class="form-group">
				    			<label class="col-sm-3 control-label"></label>
					    		<div class="col-sm-9">
					      			<button type="button" onclick="${p_click}" class="btn btn-default btn-lg btn-block">${p_text}</button>
					    		</div>
				  			</div>
</#macro>