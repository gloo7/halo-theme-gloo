<#include "module/layout.ftl">
<#include 'module/aside.ftl' >
<@layout
    title="${settings.links_title}"
>
<div class="section about-us-area section-padding-lg">
    <div class="container">
        <div class="row">
            <div class="col-xl-9 col-lg-8">
                <div class="row">
                    <@linkTag method="list">
                        <#if links?? && links?size gt 0>
                            <#list links as link>
                                <div class="archives_sort_item boxed-layout col-xs-12 col-lg-6" style="padding: 20px;margin:0;">
                                    <a href="${link.url}" class="archives_sort_item_img">
                                        <img width="100%" src="${link.logo}"/>
                                    </a>
                                    <div class="archives_sort_item_info">
                                        <a href="${link.url}" class="archives_sort_item_info_item">
                                            ${link.name!}   
                                        </a>
                                        <div class="archives_sort_item_info_title">
                                            <p>${link.description}</p>
                                        </div>
                                    </div>
                                </div>
                            </#list>
                        <#else>
                            <@empty/>
                        </#if>
                    </@linkTag>
                </div>
            </div>
            <@aside />
        </div>
    </div>
</div>   
</@layout>