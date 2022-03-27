<#include "module/layout.ftl">
<#include 'module/aside.ftl' >
<#include "module/pagination.ftl">
<#include "module/empty.ftl">
<#include "module/post_list.ftl">
<@layout title="${keyword!}的搜索结果" enable_breadcrumb=false>

<div class="section section-padding-lg">
    <div class="container"> 
        <div>
            <svg t="1648366498468" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2219" width="200" height="200"><path d="M469.333 192c153.174 0 277.334 124.16 277.334 277.333 0 68.054-24.534 130.411-65.216 178.688L846.336 818.24l-48.341 49.877L630.4 695.125a276.053 276.053 0 0 1-161.067 51.542C316.16 746.667 192 622.507 192 469.333S316.16 192 469.333 192z m0 64C351.51 256 256 351.51 256 469.333s95.51 213.334 213.333 213.334 213.334-95.51 213.334-213.334S587.157 256 469.333 256z" p-id="2220" fill="#ffffff"></path></svg>
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