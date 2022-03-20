<#include "module/layout.ftl">
<#include 'module/aside.ftl' >
<#include "module/pagination.ftl">
<#include "module/empty.ftl">
<#include "module/post_list.ftl">
<@layout title="${settings.categories}">
<div class="cr-section section-padding-lg">
    <div class="container"> 
        <div class="row">
            <div class="col-xl-9 col-lg-8">
                <#if (posts.content)?? && posts.content?size gt 0>
                    
                    <#list posts.content as post>
                        <@post_list post=post />
                    </#list>
                    <@pagination/>
                <#else>
                    <@empty/>
                </#if>
            </div>
            <@aside />
        </div>
    </div>
</div>
</@layout>