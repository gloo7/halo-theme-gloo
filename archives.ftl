<#include "module/layout.ftl">
<#include 'module/aside.ftl' >
<#include "module/pagination.ftl">
<#include "module/empty.ftl">
<#include "module/post_list.ftl">
<@layout title="${settings.archives_title}">
<div class="cr-section section-padding-lg">
    <div class="container"> 
        <div class="row">
            
            <div class="col-xl-9 col-lg-8">
                <@postTag method="count">
                <#assign tagCount = count>
                </@postTag>
                <#if count == 0>
                    <@empty />
                <#else>
                    <div class="archives_sort_title">
                        文章归档 - ${count!0}
                    </div>
                    <div class="archives_sort ">
                        <#list archives as archive>
                            <div class="archives_sort_item year">${archive.year?c}</div>
                            <#list archive.posts as post>
                                <div class="archives_sort_item ">
                                    <a href="${post.fullPath!}" title="${post.title!}" class="archives_sort_item_img">
                                        <@tbn.post_thumbnail post=post />
                                        <#--
                                        <img class="lazyload img_cover" data-src="${tbn.thumbnail}" src="${lazy_img}"
                                            onerror="this.src='${err_img}'"
                                            alt="${post.title!}"/>
                                        -->
                                    </a>
                                    <div class="archives_sort_item_info">
                                        <div class="archives_sort_item_info_item">
                                            <i class="fa fa-calendar"></i>
                                            <time class="post-meta-date-created" datetime="${post.createTime?string('yyyy-MM-dd')}"
                                                title="发表于 ${post.createTime?string('yyyy-MM-dd')}">${post.createTime?string('yyyy-MM-dd')}
                                            </time>
                                        </div>
                                        <a class="archives_sort_item_info_title" href="${post.fullPath!}" title="${post.title!}">
                                            ${post.title!}
                                        </a>
                                    </div>
                                </div>
                            </#list >
                        </#list >
                    </div>
                    <@pagination/>
                </#if>    
            </div>
            <@aside />
        </div>
    </div>
</div>
</@layout>