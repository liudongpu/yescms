 <#include "macro_web.ftl" />



<#assign a_macro_site_resources_thems_js=["lib/jquery/jquery-last.min.js","lib/jquery/jquery-site.min.js","lib/bootstrap-3.3.5/js/bootstrap.min.js","zapjs/zapapi.js","zapjs/zapfunc.js","yclib/js/yccall.js","ycmobile/js/ycmobile.js"] >


<#assign a_macro_site_resources_thems_css=["lib/bootstrap-3.3.5/css/bootstrap.min.css","zapweb/css/w.css"] >





<#macro m_site_header p_title="" p_header="" p_lib=""  p_back="">
	
	<@m_web_html_begin p_title=p_title  p_js=a_macro_site_resources_thems_js p_css=a_macro_site_resources_thems_css  />
	<meta name="keywords" content="正道拍卖,拍卖,正道,珠宝,玉石,机构" />
	<meta name="description" content="${p_title}-正道拍卖 - 中国珠宝玉石专业拍卖机构" />
	<meta
		content="width=640, maximum-scale=1.0, user-scalable=0"
		name="viewport" />
	<meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />
	<meta content="telephone=no" name="format-detection" />
	<meta content="email=no" name="format-detection" />
	
	
	<#--dev时使用less开发  -->
	<link rel="stylesheet/less" type="text/css" href="${a_macro_web_resources_link}resources/ycmobile/css/ycmb.less${a_macro_web_resources_version}" />
	<@m_web_html_js ["lib/less/less-last.js"] />

	
	<#if p_lib="swiper">
		<@m_web_html_js ["lib/swiper/swiper3.06.jquery.min.js"] />
		<@m_web_html_css ["lib/swiper/swiper3.06.min.css"] />
	</#if>
	
	<@m_web_body_begin />
	
	<#if p_header!="member">
	<div class="ym_layout_header">

		<div class="c_box">
			<div class="c_full">
			
				<#if p_header=="index">
				<div class="c_logo" <@m_web_event_click p_link="index" /> ></div>
				<#else>
					<#if p_back=="">
						<div class="c_back" <@m_web_event_click p_js="history.go(-1)" /> ></div>
					<#else>
						<div class="c_back" <@m_web_event_click p_link=p_back /> ></div>
					</#if>
				
				</#if>


				<#if p_header=="">
					<div class="c_title">${p_title}</div>
				</#if>

				<#if p_header=="search">
					<div class="c_search">
						<div class="input-group  input-group-lg">
					      <span class="input-group-btn">
					        <button class="btn btn-default" type="button" onclick="ycmobile.page_search(this)">
					        	<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					        </button>
					      </span>
					      <input type="text" id="ycbase_header_layout_search" class="form-control" placeholder="请输入搜索关键字" value="${p_title}"/>
					    </div>
				    </div>
				<#else>
					<div class="c_btn c_option" <@m_web_event_click p_js="ycmobile.header_nav_click(this)" />  ></div>
				</#if>
				
				
				<#if p_header=="index">
				<div class="c_btn c_user" <@m_web_event_click p_js="ycmobile.header_user_click(this)" />  ></div>
				<div class="c_btn c_search" <@m_web_event_click p_link="search_page" />  ></div>
				</#if>
			</div>
			<div class="c_menu" id="ym_id_mm_menu">
				<div class="w_h_20"></div>
				<div class="c_item"><div class="c_ico c_i0"></div><div class="c_text">分享  </div></div>
				<div class="c_item"  <@m_web_event_click p_link="index" /> ><div class="c_ico c_i1"></div><div class="c_text">回到首页  </div></div>
				<div class="c_item"><div class="c_ico c_i2"></div><div class="c_text">联系电话  </div></div>
				<div class="c_item"><div class="c_ico c_i3"></div><div class="c_text">在线送拍  </div></div>
				<div class="c_item"><div class="c_ico c_i4"></div><div class="c_text">客户服务 </div></div>
			</div>
		</div>
		
		
	</div>
	</#if>
	
	
	
</#macro>





<#macro m_site_footer p_initjs="">
	<div class="ycmb_footer_layout">
		
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

							
				    			
	<input type="${p_type}"   name="${p_id}" value="${p_value}"  id="${p_id}" placeholder="请输入${p_text}" ${p_attr}/>
					    		
				  		

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

<div class="ymwap_comment_info">
	<div class="yccomment_box_info" id="yccomment_box_info_${p_uid}">
		<div class="w_h_20"></div>
		<div class="yccomment_box_deb">
			<div class="yccomment_box_label">
				<span class="yccomment_box_tip"></span>&nbsp;&nbsp;文章评论
			</div>
			<div  class="yccomment_box_list">
			</div>
			<div  class="yccomment_box_none w_display ">
				暂无评论
			</div>
		</div>
		<div class="w_h_20"></div>
		<div class="yccomment_box_deb">
			<div class="yccomment_box_label">
				<span class="yccomment_box_tip"></span>&nbsp;&nbsp;发表
			</div>
			<div  class="yccomment_box_add w_display">
				<form>
					<div class="yccomment_box_add_text">
						<@m_web_html_hidden p_id="infoUid" p_value=p_uid />
						<@m_web_html_hidden p_id="infoTitle" p_value=p_title />
						<@m_web_html_hidden p_id="infoUrl" p_value=p_url />
						<textarea id="note" name="note"></textarea>
					</div>
					<div class="w_h_40"></div>
					<div class="yccomment_box_add_footer" <@m_web_event_click p_js="yccall.comment_submit(this)" /> >
						发表
					</div>
				</form>
			</div>
			<div  class="yccomment_box_login w_display">
				<div class="yccomment_box_login_text">
					游客您好，<@m_web_html_href "member_login" "登录"/>后可以发表评论，如果您还没有帐号可以现在 <@m_web_html_href "member_reg" "注册"/>	。
				</div>
				
			</div>
		</div>
		<div class="w_h_20"></div>
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
