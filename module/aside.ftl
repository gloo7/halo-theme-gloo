<#import "./post_thumbnail.ftl" as tbn>
<#macro aside>
<div class="col-xl-3 col-lg-4 sticky-sidebar-active">
    <div class="widgets">

        <#if settings.site_notice!='' && settings.enable_notice>
            <section class="single-widget widget-notice">
                <h5 class="widget-title">公告</h5>
                <div>
                    ${settings.site_notice!}
                    <#if settings.site_btn != ''>
                        <#assign info =  settings.site_btn?split('||')>
                        <#assign cur_text = (info[0]?? && info[0]?trim!='')?then(info[0]?replace('\n','')?replace('\r','')?trim,'')>
                        <#assign cur_href = (info[1]?? && info[1]!='')?then(info[1]?replace('\n','')?replace('\r','')?trim,'')>
                        <a href="${cur_href}">${cur_text}</a>
                    </#if>
                </div>
            </section>
        </#if>
        
        <#if settings.enable_search>
            <section class="single-widget widget-search">
                <h5 class="widget-title">搜索</h5>
                <form method="get" action="${blog_url!}/search">
                    <input type="text" placeholder="请输入关键字..." name="keyword" />
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </section>
        </#if>

        <@postTag method="count">
            <#assign postNum=count>
        </@postTag>

        <#if postNum != 0 && settings.enable_newest_post>
            <@postTag method="latest" top="${settings.newest_page_size!5}">
                <section class="single-widget widget-related-post">
                    <h5 class="widget-title">最新文章</h5>
                    <#list posts?sort_by("editTime")?reverse as post>
                        <@tbn.post_thumbnail post=post />
                        <div class="archives_sort_item ">
                            <a href="${post.fullPath!}" title="${post.title!}" class="archives_sort_item_img" style="width:50px;height:50px;">
                                <@tbn.post_thumbnail post=post />
                                <img class="lazyload img_cover" data-src="${tbn.thumbnail}" src="${tbn.lazy_img}"
                                    onerror="this.src='${tbn.err_img}'"
                                    alt="${post.title!}"/>
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
                    </#list>
                </section>
            </@postTag>
        </#if>

        <@categoryTag method="count">
            <#if count != 0 && settings.enable_categories>
                <@categoryTag method="list">
                    <section class="single-widget widget-categories">
                        <h5 class="widget-title">分类</h5>
                        <ul>
                            <#list categories?sort_by("postCount") ? reverse as category>
                            <li>   
                                <a 
                                    href="${category.fullPath!}" 
                                    title="${category.name!}"
                                >${category.name!} <span>${category.postCount!}</span></a>
                            </li>
                            </#list>
                        </ul>
                    </section>
                </@categoryTag>
            </#if>
        </@categoryTag>
        
        <@tagTag method="count">
            <#if count != 0 && settings.enable_tags>
                <section class="single-widget widget-tags">
                <h5 class="widget-title">标签</h5>
                <@tagTag method="list">
                <ul>
                    <#list tags as tag>
                        <li>
                            <a href="${tag.fullPath!}">
                                ${tag.name!}<span>(${tag.postCount!})</span>
                            </a>
                        </li>
                    </#list>
                </ul>
                </@tagTag>
                </section>
            </#if>
        </@tagTag>

        <#if settings.qrcode_wxpay != ''>
        <section class="single-widget">
            <h5 class="widget-title">支持一下</h5>
            <img src="${settings.qrcode_wxpay}" />
        </section>
        </#if>
    </div>
</div>
</#macro>
