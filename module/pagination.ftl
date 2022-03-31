<#macro pagination  method='index' page="${posts.number}" total="${posts.totalPages}" slug="" display = "3">
    <@paginationTag method="${method!}"  slug="${slug!}" page="${page!}" total="${total!}" display="${display!}">
    <div class="pagination mt-4 text-center">
        <ul>
            <#if pagination.hasPrev>
                <li>
                    <a href="${pagination.prevPageFullPath}">
                    <svg t="1648410855925" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2865" width="200" height="200"><path d="M204.8 506.667l472.064-512 142.336 153.6-330.752 358.4 330.752 358.4-142.336 153.6-472.064-512z" p-id="2866"></path></svg>
                    </a>
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
                    <a href="${pagination.nextPageFullPath}">
                    <svg t="1648410884487" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3660" width="200" height="200"><path d="M819.2 512l-472.064 512L204.8 870.4 535.552 512 204.8 153.6 347.136 0 819.2 512z" p-id="3661"></path></svg>
                    </a>
                </li>
            </#if>
        </ul>
    </div>
    </@paginationTag>
</#macro>