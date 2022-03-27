<#import "module/post_thumbnail.ftl" as tbn>
<#include "module/layout.ftl">
<#include 'module/aside.ftl' >
<#include "module/pagination.ftl">
<#include "module/empty.ftl">
<#include "module/post_list.ftl">
<@layout title="${settings.archives_title}">
<div class="section section-padding-lg">
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
                                    <@tbn.post_thumbnail post=post />
                                    <a href="${post.fullPath!}" title="${post.title!}" class="archives_sort_item_img">
                                        <img class="lazyload img_cover" data-src="${tbn.thumbnail}" src="${tbn.lazy_img}"
                                            onerror="this.src='${tbn.err_img}'"
                                            alt="${post.title!}"/>
                                    </a>
                                    <div class="archives_sort_item_info">
                                        <div class="archives_sort_item_info_item">
                                            <svg t="1642762307873" class="icon" viewBox="0 0 1024 1024" version="1.1"
                                                xmlns="http://www.w3.org/2000/svg" p-id="17052" width="200" height="200">
                                                <path d="M766 960.4H259.6c-85.1 0-154.1-69-154.1-154.1V354.2c0-85.1 69-154.1 154.1-154.1H766c85.1 0 154.1 69 154.1 154.1v452.1c-0.1 85.1-69 154.1-154.1 154.1z"
                                                    fill="#83A4FF" p-id="17053"></path>
                                                <path d="M766 933.2H259.6c-85.1 0-154.1-69-154.1-154.1v-452c0-85.1 69-154.1 154.1-154.1H766c85.1 0 154.1 69 154.1 154.1v452.1c-0.1 85-69 154-154.1 154z"
                                                    fill="#5B79FB" p-id="17054"></path>
                                                <path d="M766 906.1H259.6c-85.1 0-154.1-69-154.1-154.1V299.9c0-85.1 69-154.1 154.1-154.1H766c85.1 0 154.1 69 154.1 154.1V752c-0.1 85.1-69 154.1-154.1 154.1z"
                                                    fill="#83A4FF" p-id="17055"></path>
                                                <path d="M739 381.2H286.5c-12.4 0-22.6-10.2-22.6-22.6 0-12.4 10.2-22.6 22.6-22.6H739c12.4 0 22.6 10.2 22.6 22.6 0.1 12.4-10.1 22.6-22.6 22.6z"
                                                    fill="#5B79FB" p-id="17056"></path>
                                                <path d="M523.4 815.6H312.1c-12.4 0-22.6-10.2-22.6-22.6 0-12.4 10.2-22.6 22.6-22.6h211.3c12.4 0 22.6 10.2 22.6 22.6 0 12.4-10.2 22.6-22.6 22.6zM685.5 815.6h-83c-12.4 0-22.6-10.2-22.6-22.6 0-12.4 10.2-22.6 22.6-22.6h83c12.4 0 22.6 10.2 22.6 22.6 0 12.4-10.1 22.6-22.6 22.6z"
                                                    fill="#E5ECFF" p-id="17057"></path>
                                                <path d="M349.3 659.1c54.7-49.7 91.4-89.4 91.4-121.1 0-20-11.2-30.9-28.5-30.9-15 0-26.8 10-37 21.2L346.7 500c21.5-22.6 41.5-33.8 72.6-33.8 42.3 0 71.7 27 71.7 68.8 0 37.6-32.3 79.1-65.9 112.9 10.9-1.5 25.9-2.9 35.6-2.9H501v44.1H349.3v-30zM523 662.6l24.1-32.9c13.2 12.6 28.5 21.2 45.6 21.2 20.3 0 33.5-8.5 33.5-25 0-18.8-10-30-55.9-30v-36.8c37.3 0 49.1-11.5 49.1-28.8 0-15-8.8-23.2-25-23.2-14.7 0-25.9 6.8-39.1 18.2l-26.5-32c20.3-17.1 42-27 67.9-27 45.3 0 75 21.2 75 60.3 0 21.8-11.8 38.8-35.3 48.2v1.5c24.4 7.3 42.3 25 42.3 53.2 0 40.9-37.3 63.8-80.9 63.8-34.5-0.1-58.9-12.1-74.8-30.7z"
                                                    fill="#FFFFFF" p-id="17058"></path>
                                                <path d="M368 245.4m-63.4 0a63.4 63.4 0 1 0 126.8 0 63.4 63.4 0 1 0-126.8 0Z" fill="#5B79FB"
                                                    p-id="17059"></path>
                                                <path d="M648.5 245.4m-63.4 0a63.4 63.4 0 1 0 126.8 0 63.4 63.4 0 1 0-126.8 0Z"
                                                    fill="#5B79FB" p-id="17060"></path>
                                                <path d="M368 290.7c-30 0-54.3-24.3-54.3-54.3V118.7c0-30 24.3-54.3 54.3-54.3 30 0 54.3 24.3 54.3 54.3v117.7c0 29.9-24.3 54.3-54.3 54.3z"
                                                    fill="#FF7E71" p-id="17061"></path>
                                                <path d="M368 254.5c-30 0-54.3-24.3-54.3-54.3v36.2c0 30 24.3 54.3 54.3 54.3s54.3-24.3 54.3-54.3v-36.2c0 29.9-24.3 54.3-54.3 54.3z"
                                                    fill="#F7554D" p-id="17062"></path>
                                                <path d="M648.5 290.7c-30 0-54.3-24.3-54.3-54.3V118.7c0-30 24.3-54.3 54.3-54.3 30 0 54.3 24.3 54.3 54.3v117.7c0 29.9-24.3 54.3-54.3 54.3z"
                                                    fill="#FF7E71" p-id="17063"></path>
                                                <path d="M648.5 254.5c-30 0-54.3-24.3-54.3-54.3v36.2c0 30 24.3 54.3 54.3 54.3s54.3-24.3 54.3-54.3v-36.2c0 29.9-24.3 54.3-54.3 54.3z"
                                                    fill="#F7554D" p-id="17064"></path>
                                            </svg>
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
                    <@pagination method="archives" display="5" />
                </#if>    
            </div>
            <@aside />
        </div>
    </div>
</div>
</@layout>