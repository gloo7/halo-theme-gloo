<#macro pagination  method='index' slug="" display = "3">
    <@paginationTag method="${method!}"  slug="${slug!}" page="${posts.number}" total="${posts.totalPages}" display="3">
    <div className="cr-pagination mt-4 text-center"></div>
        <ul>
            <#if pagination.hasPrev>
                <li>
                    <a href="${pagination.prevPageFullPath}"><i className="fa fa-angle-double-left" /></a>
                </li>
            </#if>
            <#list pagination.rainbowPages as number>
                <#if number.isCurrent>
                    <li>
                        <a style="color:#ac0404;" href="${number.fullPath}">{i}</a>
                    </li>
                <#else>
                    <li>
                        <a href="${number.fullPath}">{i}</a>
                    </li>
                </#if>
            </#list>
            <#if pagination.hasNext>
                <li>
                    <a href="${pagination.nextPageFullPath}"><i className="fa fa-angle-double-right" /></a>
                </li>
            </#if>
        </ul>
    </div>
    </@paginationTag>
</#macro>