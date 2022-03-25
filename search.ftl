<#include "module/layout.ftl">
<#include 'module/aside.ftl' >
<#include "module/pagination.ftl">
<#include "module/empty.ftl">
<#include "module/post_list.ftl">
<@layout title="${keyword!}的搜索结果" enable_breadcrumb=false>

<div class="section section-padding-lg">
    <div class="container"> 
        <div>
            <i class="fa fa-search"></i>
            <#if keyword?? && keyword?trim!=''>
            搜索到 <span>${posts.content?size}</span> 条与 <span>${keyword} </span>
            <span>相关的文章：</span>
            <#else>
            <span>相关搜索结果如下：</span>
            </#if>
        </div>
        <#if posts.content?size gt 0>
            <#list posts.content as post>
                <@post_list post=post />
            </#list>
            <@pagination/>
        <#else>
            <#include "template/macro/empty.ftl">
            <@empty text="未找到相关文章..." />
        </#if>
    </div>
</div>
</@layout>