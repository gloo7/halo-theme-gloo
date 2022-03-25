<#macro pagination  method='index' slug="" display = "3">
    <@paginationTag method="${method!}"  slug="${slug!}" page="${posts.number}" total="${posts.totalPages}" display="3">
    <div class="gloo-pagination mt-4 text-center">
        <ul>
            <#if pagination.hasPrev>
                <li>
                    <a href="${pagination.prevPageFullPath}"><i class="fa fa-angle-double-left" />
                </li>
            </#if>
            <#list pagination.rainbowPages as number>
                <#if number.isCurrent>
                    <li>
                        <a href="${number.fullPath}">${number.page!}</a>
                    </li>
                <#else>
                    <li>
                        <a href="${number.fullPath}">${number.page!}</a>
                    </li>
                </#if>
            </#list>
            <#if pagination.hasNext>
                <li>
                    <a href="${pagination.nextPageFullPath}"><i class="fa fa-angle-double-right" />
                </li>
            </#if>
        </ul>
    </div>
    </@paginationTag>
</#macro>