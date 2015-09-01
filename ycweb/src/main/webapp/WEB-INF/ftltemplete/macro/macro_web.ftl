<#-- 系统版本号 -->
<#assign a_macro_web_system_version="2.0.0.09">
<#-- 资源附加后缀版本 -->
<#assign a_macro_web_resources_version="?v="+a_macro_web_system_version >
<#-- 资源文件路径 -->
<#assign a_macro_web_resources_link="../../" >

<#-- 图片文件路径 -->
<#assign a_macro_web_img_link="../../" >

<#-- 项目特殊样式 -->






<#macro m_web_html_js e_list>
	<#list e_list as e>
	<script type="text/javascript" src="${a_macro_web_resources_link}resources/${e}${a_macro_web_resources_version}"></script>
	</#list>
</#macro>
<#macro m_web_html_css e_list >
    <#list e_list as e>
	<link type="text/css" href="${a_macro_web_resources_link}resources/${e}${a_macro_web_resources_version}" rel="stylesheet">
	</#list>
</#macro>

<#macro m_web_html_script  e_info >

	<script type="text/javascript">
		${e_info}
	</script>

</#macro>

<#-- 页面初始化时执行脚本 -->
<#macro m_web_html_initjs  e_js >
	<@m_web_html_script "$(function(){"+e_js+"}); " />

</#macro>










<#macro m_web_html_begin  p_title="" p_type="" p_css=[]  p_js=[]>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    
    <title>${p_title}</title>
    
  
   
	
	<@m_web_html_css    p_css />
	<@m_web_html_js p_js />
	 
	 
	
	
</#macro>



<#macro m_web_body_begin>

</head>
<body>





</#macro>

<#macro m_web_body_end   p_js=[]>



	<@m_web_html_js p_js />


</#macro>

<#macro m_web_html_end  >

</body>
</html>
</#macro>




<#-- 初始化数据操作脚本  -->
<#macro m_web_init_dbcall>
<#assign a_macro_web_dbcall=b_method.upClass("com.srnpr.zapweb.websupport.DataCallSupport") >
</#macro>

<#macro m_web_html_img p_link="" p_alt="" p_width=-1 >

<img src="${p_link}" alt="${p_alt}" /></#macro>


<#-- 基础元素  -->
<#macro m_web_html_href  p_link p_text>
<#if p_link!="">
	<#local p_link=p_link+".html">
</#if>
<a href="${p_link}" >${p_text}</a></#macro>

<#macro m_web_html_hidden p_id="" p_value="">
	<input type="hidden" name="${p_id}" id="${p_id}" value="${p_value}"/>
</#macro>
<#macro m_web_html_text p_id="" p_value="">
	<input type="text" name="${p_id}" id="${p_id}" value="${p_value}"/>
</#macro>

