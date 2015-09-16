
 <#include "../../macro/macro_site.ftl" />
<@m_web_init_dbcall />
<#assign   a_list=a_macro_web_dbcall.queryAll("yc_adv","","-zid","") />

<@m_site_header p_title="首页"/>

<div class="ycsite_index_main">


<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <#list a_list as el>
		<li data-target="#carousel-example-generic" data-slide-to="${el_index}"  <#if el_index==0> class="active" </#if>></li>
	</#list>
    
  </ol>


  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
  
  	<#list a_list as el>
		<div class="item <#if el_index==0> active </#if>">
      		
      		<@m_web_html_img p_img=el["file_url"]     p_link=el["link_url"] /> 
      		<div class="carousel-caption">
        		&nbsp;
      		</div>
    	</div>
	</#list>
  
    
    
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>


<@m_site_footer />