<#include "module/layout.ftl">
<#include "module/aside.ftl">
<#include "module/empty.ftl">
<#include "module/pagination.ftl">
<@layout
    title="${settings.journals_title}"
>
<div class="section about-us-area section-padding-lg">
    <div class="container">
        <div class="row">
            <div class="col-xl-9 col-lg-8">
                <#if journals.content?? && journals.content?size gt 0>
                    <#list journals.content as journal>
                        <div class="journal-item col-12">
                            <h6 class="journal-item-title" >
                                ${journal.createTime?string('yyyy-MM-dd')}
                            </h6>
                            <p>${journal.content!}</p>
                        </div>
                    </#list>
                    <@pagination method="journals" page="${journals.number}" total="${journals.totalPages}" display="5" />
                <#else>
                    <@empty />
                </#if>
            </div>
            <@aside />
        </div>
    </div>
</div>   
</@layout>