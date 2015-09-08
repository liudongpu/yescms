 <#include "../../macro/macro_mobile.ftl" />


<@m_web_init_dbcall />


<#assign   a_list=a_macro_web_dbcall.queryAll("yc_adv","","-zid","") />

<@m_site_header p_title="首页"/>