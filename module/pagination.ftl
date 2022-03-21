<#macro pagination  method='index' slug="" display = "3">
    <@paginationTag method="${method!}"  slug="${slug!}" page="${posts.number}" total="${posts.totalPages}" display="3">
    <div class="cr-pagination mt-4 text-center"></div>
        <ul>
            <#if pagination.hasPrev>
                <li>
                    <a href="${pagination.prevPageFullPath}"><i class="fa fa-angle-double-left" /></a>
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
                    <a href="${pagination.nextPageFullPath}"><i class="fa fa-angle-double-right" /></a>
                </li>
            </#if>
        </ul>
    </div>
    </@paginationTag>
</#macro>