<#include "module/layout.ftl">
<@layout
    title="${settings.links_title}"
>
<div class="gloo-section about-us-area section-padding-lg">
    <div class="container">
        <div class="row">
            <@linkTag method="list">
            <#if links?? && links?size gt 0>
                <#list links as link>
                
                    <a class="by_link_card col-md-6" href="${link.url}" target="_blank" title="${link.name!}">
                        <div class="info" style="background: linear-gradient(to top, rgb(196, 113, 245) 0%, rgb(250, 113, 205) 100%);">
                            <img src="${link.logo!}" alt="">
                            <span>${link.name!}</span>
                        </div>
                        <div class="desc ">
                            ${link.description}
                        </div>
                    </a>
                </#list>
            <#else>
                <@empty showBg = false/>
            </#if>
            </@linkTag>
        </div>
    </div>
</div>   
</@layout>