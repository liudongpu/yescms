 <#include "macro_web.ftl" />



<#assign a_macro_site_resources_thems_js=["lib/jquery/jquery-last.min.js","lib/jquery/jquery-site.min.js","lib/bootstrap-3.3.5/js/bootstrap.min.js","zapjs/zapapi.js","zapjs/zapfunc.js","yclib/js/yccall.js","yclib/js/yclib.js"] >


<#assign a_macro_site_resources_thems_css=["lib/bootstrap-3.3.5/css/bootstrap.min.css","zapweb/css/w.css","yclib/css/ycbase.css"] >





<#macro m_site_header p_title="" >
	
	<@m_web_html_begin p_title=p_title  p_js=a_macro_site_resources_thems_js p_css=a_macro_site_resources_thems_css  />
	<link rel="shortcut icon" href="http://img.jkcdn.yxl9.cn//sfiles/ico/favicon.ico" />
	<meta name="keywords" content="正道拍卖,拍卖,正道,珠宝,玉石,机构" />
	<meta name="description" content="${p_title}-正道拍卖 - 中国珠宝玉石专业拍卖机构" />
	<@m_web_body_begin />
	
	<div class="ycbase_header_layout">
		<div class="c_box">
			<div class="c_logo ycbase_img_ycico w_pointer" onclick="location.href='index'"></div>
			<div class="c_nav">
				<div class="c_nav_h"></div>
				<ul class="w_ul">
					<li><@m_web_html_href "index"  "首&nbsp;&nbsp;&nbsp;页"/> </li>
					<li><@m_web_html_href "news_list"  "正道资讯"/>  </li>
					<li><@m_web_html_href "notice_list"  "正道公告"/>  </li>
					<li><@m_web_html_href "auction_list"  "预展及成交"/>  </li>
					<li class="c_nav_last"><@m_web_html_href "people_list"  "正道指数"/>  </li>
					
				</ul>
			</div>
			<div class="c_right">
				
				<div class="w_h_10 w_clear"></div>
				<div class="w_h_50 w_clear"></div>
				<div class="c_search ycbase_img_ycico">
					<input id="ycbase_header_layout_search" class="c_input" type="text"  placeholder="站内搜索"/>
					<span class="c_target" onclick="yclib.page_search()">&nbsp;</span>
				</div>
			</div>

			<div class="c_user" id="yc_id_top_nav_user">
					<div class="c_button ycbase_img_ycico"> <@m_web_html_href "member_login"  "登录"/></div>
					<div class="c_button ycbase_img_ycico"><@m_web_html_href "member_reg"  "注册"/></div>
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
						<li><@m_web_html_href "static_info?u_code=4653000100010001" "正道简介"/>	</li>
						<li><@m_web_html_href "static_info?u_code=4653000100010002" "竞买流程"/></li>
						<li><@m_web_html_href "static_info?u_code=4653000100010003" "竞买须知"/></li>
						<li><@m_web_html_href "static_info?u_code=4653000100010004" "委托须知"/></li>
						<li><@m_web_html_href "static_info?u_code=4653000100010005" "拍卖规则"/></li>
						<li><@m_web_html_href "static_info?u_code=4653000100010006" "联系方式"/></li>
						<li class="c_nav_last"><@m_web_html_href "static_info?u_code=4653000100010007" "友情链接"/></li>
						
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

	<div class="yctop_subtitle ycbase_img_ycico">最新资讯</div>
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
		<@m_site_user_item p_num=3 p_index=p_index p_link="user_comment?" p_text="我的评论" />

		

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





<#macro m_site_comment_list p_uid="" p_title="" p_url=""  >

<div class="ycsite_comment_info">
	<div class="yccomment_box_info" id="yccomment_box_info_${p_uid}">
		<div class="yccomment_box_label">
			文章评论
		</div>
		<div  class="yccomment_box_list">
		</div>
		<div  class="yccomment_box_none w_display ">
			暂无评论
		</div>
		
		<div class="yccomment_box_label">
			发表
		</div>
		<div  class="yccomment_box_add w_display">
			<form>
				<div class="yccomment_box_add_text">
					<@m_web_html_hidden p_id="infoUid" p_value=p_uid />
					<@m_web_html_hidden p_id="infoTitle" p_value=p_title />
					<@m_web_html_hidden p_id="infoUrl" p_value=p_url />
					<textarea id="note" name="note"></textarea>
				</div>
				<div class="yccomment_box_add_footer">
					<input class="yccomment_box_login_btn" type="button" value="发表" onclick="yccall.comment_submit(this)" />
				</div>
			</form>
		</div>
		<div  class="yccomment_box_login w_display">
			<div class="yccomment_box_login_text">
				游客您好，登录 后可以发表评论，如果您还没有帐号可以现在 <@m_web_html_href "member_reg" "注册"/>	。
			</div>
			<div class="yccomment_box_login_footer">
				<input class="yccomment_box_login_btn" type="button" value="发表" />
			</div>
		</div>
	</div>

</div>

<@m_web_html_script "yccall.comment_init('${p_uid}')" />

</#macro>





<#macro m_site_share>
<div class="w_h_50"></div>
<!-- JiaThis Button BEGIN -->
<div class="jiathis_style"><span class="jiathis_txt">分享到：</span>
<a class="jiathis_button_qzone"></a>
<a class="jiathis_button_tsina"></a>
<a class="jiathis_button_weixin"></a>
<a class="jiathis_button_renren"></a>
<a class="jiathis_button_copy"></a>
<a class="jiathis_button_email"></a>
<a class="jiathis_button_cqq"></a>
<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank"></a>
</div>
<div class="w_h_50"></div>
<script type="text/javascript" >
var jiathis_config={
	siteNum:6,
	sm:"qzone,weixin,tsina,cqq,copy,email",
	summary:"",
	shortUrl:true,
	hideMore:false
}
</script>
<script type="text/javascript" src="http://v3.jiathis.com/code_mini/jia.js" charset="utf-8"></script>
<!-- JiaThis Button END -->


</#macro>



<#macro m_site_pagenav  p_page_info>

<#local l_number=2 />
<div class="yctop_pagenav">
	<div class="w_clear w_h_50"></div>
	<div class="yctop_pagenav_box" >
	<#if (p_page_info.getPageSize()>0)>
	  <ul>
		<#if (p_page_info.getPageIndex()>1)>
			<li  class="c_item"><a href="${a_macro_web_sessionhelper.upReplaceUrl("",a_macro_web_pagenav_pageindex,(p_page_info.getPageIndex()-1)?string)}">上一页</a></li>
		<#else>
			<li class="c_disabled"><a>上一页</a></li>
		</#if>


		<#local max=(p_page_info.getPageIndex()+l_number)>
	    <#if (max>p_page_info.getPageMax())><#local max=p_page_info.getPageMax()></#if>
	    
	    <#local min=(p_page_info.getPageIndex()-(l_number+p_page_info.getPageIndex()-max))>
	    <#if (min<1)><#local min=1></#if>
	    
	    
	    
		<#if ((p_page_info.getPageIndex()>1)&&(max>l_number+1))>
			
			<li class="c_item"><a href="${a_macro_web_sessionhelper.upReplaceUrl("",a_macro_web_pagenav_pageindex,"1"  ) }">1</a></li>
			<li ><a>...</a></li>
		</#if>

	
	    
		<#list min..max as e>
			<#if (e>0)>
			<li  class="c_item <#if e==p_page_info.getPageIndex()> c_active</#if>" ><a href="${a_macro_web_sessionhelper.upReplaceUrl("",a_macro_web_pagenav_pageindex,e?c   ) }">${e}</a></li>
			</#if>
		</#list>

		<#if ((p_page_info.getPageIndex()+l_number)<p_page_info.getPageMax())>
			<li ><a>...</a></li>
			<li class="c_item"><a href="${a_macro_web_sessionhelper.upReplaceUrl("",a_macro_web_pagenav_pageindex,p_page_info.getPageMax()?c   ) }">${p_page_info.getPageMax()}</a></li>
			
		</#if>
	
	    <#if (p_page_info.getPageIndex()<p_page_info.getPageMax())>
			<li  class="c_item"><a href="${a_macro_web_sessionhelper.upReplaceUrl("",a_macro_web_pagenav_pageindex,(p_page_info.getPageIndex()+1)?c)}">下一页</a></li>
		<#else>
			<li class="c_disabled"><a>下一页</a></li>
		</#if>
	  </ul>
	</#if>
  	</div>
  	<div class="w_clear w_h_50"></div>
  
	
</div>



</#macro>
