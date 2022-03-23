<#include "module/layout.ftl">
<#include 'module/aside.ftl' >
<#include "module/post_list.ftl">
<#include "module/empty.ftl">
<#include "module/pagination.ftl">
<@layout
    title="${category.name!}"
>
<div class="cr-section section-padding-lg">
    <div class="container"> 
        <div class="row">
            <div class="col-xl-9 col-lg-8">
                <#if posts.content?size gt 0>
                    <#list posts.content as post>
                        <@post_list post=post />
                    </#list>
                    <@pagination  method="categoryPosts" slug="${category.slug}" display="5" />
                <#else>
                    <@empty/>
                </#if>    
            </div>
            <@aside />
        </div>
    </div>
</div> 
</@layout>
