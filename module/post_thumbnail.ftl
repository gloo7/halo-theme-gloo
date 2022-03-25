<#macro post_thumbnail post>
    <#assign thumbnail = post.thumbnail!?trim>
    <#assign lazy_img = settings.lazyload_thumbnail!>
    <#assign err_img = settings.fallback_thumbnail!>
    <#if thumbnail == ''>
        <#if post.categories?size gt 0>
            <#assign thumbnail = post.categories[0].thumbnail!?trim>
            <#if thumbnail == ''>
                <#if post.tags?size gt 0>
                    <#assign thumbnail = post.tags[0].thumbnail!?trim>
                    <#if thumbnail == ''>
                        <#assign thumbnail = settings.post_thumbnail>
                    </#if>
                <#else>
                    <#assign thumbnail = settings.post_thumbnail>
                </#if>
            </#if>
        <#else>
            <#if post.tags?size gt 0>
                <#assign thumbnail = post.tags[0].thumbnail!?trim>
                <#if thumbnail == ''>
                    <#assign thumbnail = settings.post_thumbnail>
                </#if>
            <#else>
                <#assign thumbnail = settings.post_thumbnail>
            </#if>
        </#if>
    </#if>
</#macro>
