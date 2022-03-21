<#import "./post_thumbnail.ftl" as tbn>
<#macro aside>
<div class="col-xl-3 col-lg-4 sticky-sidebar-active">
    <div class="widgets">

        <section class="single-widget widget-search">
            <h5 class="widget-title">搜索</h5>
            <form method="get" action="${blog_url!}/search">
                <input type="text" placeholder="请输入关键字..." name="keyword" />
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </section>

        <@postTag method="count">
            <#assign postNum=count>
            <a href="${archives_url!}" title="文章" class="by_user_data_item">
                <div class="headline">文章</div>
                <div class="length-num">${count!0}</div>
            </a>
        </@postTag>

        <#if postNum != 0 && settings.enable_newest_post>
            <@postTag method="latest" top="${settings.newest_page_size!5}">
                <section class="single-widget widget-related-post">
                    <h5 class="widget-title">最新文章</h5>
                    <ul>
                        <#list posts?sort_by("editTime")?reverse as post>
                            <@tbn.post_thumbnail post=post />
                            <li>
                                <div class="content">
                                    <#-- <a class="thumbnail" href="${post.fullPath!}" title="${post.title!}">
                                        <img 
                                            class="lazyload"
                                            data-src="${tbn.thumbnail}"
                                            src="${lazy_img}" 
                                            onerror="this.src='${err_img}'" 
                                            alt="${post.title!}"
                                        >
                                    </a> -->
                                    <h6><a href="${post.fullPath!}">${post.title}</Link></h6>
                                    <div style="margin-top:10;">
                                        <span>
                                            <time>${post.createTime?string('yyyy-MM-dd')}</time>
                                        </span>
                                    </div>
                                </div>
                            </li>
                        </#list>
                    </ul>
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
                            <li 
                                style="cursor:pointer;"
                                href="${category.fullPath!}" title="${category.name!}"
                            >   
                                <a>${category.name!} <span>${category.postCount!}</span></a>
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
                    <#list tags as tag>
                        <li>
                            <a href="${tag.fullPath!}">
                                ${tag.name!}<span>${tag.postCount!}</span>
                            </a>
                        </li>
                    </#list>
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
