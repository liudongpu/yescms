 <#include "macro_web.ftl" />



<#assign a_macro_site_resources_thems_js=["lib/jquery/jquery-last.min.js","lib/jquery/jquery-site.min.js","lib/bootstrap-3.3.5/js/bootstrap.min.js","yclib/js/yclib.js"] >


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
					<li><a href="">正道公告</a></li>
					<li class="c_nav_last"><a href=""> 预展及成交</a> </li>
				</ul>
			</div>
			<div class="c_right">
				<div class="ycbase_h_14"></div>
				<div class="c_user">
					<div class="c_button ycbase_img_ycico">登陆</div>
					<div class="c_button ycbase_img_ycico">注册</div>
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




<#macro m_site_body_begin  >
<div  class="ycbase_body_show_layout">
	<div class="ycbase_body_box_layout">


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

