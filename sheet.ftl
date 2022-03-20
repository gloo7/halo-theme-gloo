<#include "module/layout.ftl">
<@layout title="${sheet.title!}">
<#if settings.skill_data != ''>
<div class="cr-section skills-area section-padding-bottom-lg " style="
padding-top: 110">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-7">
                <div class="section-title text-center">
                    <h2>我的成分</h2>
                    <p>这是我的主要技能 & 成分</p>
                </div>
            </div>
        </div>
        <div class="row justify-content-center" ref={pie} >
            <div class="row justify-content-center">
                <#list settings.skill_data?split('=====') as skiil_data>
                <#if (skills_index + 1) lte limit>
                    <#assign skill = skills?split('-|||-')>
                    <#assign cur_title = (skill[0]?? && skill[0]?trim!='')?then(skill[0]?replace('\n','')?replace('\r','')?trim,'')>
                    <#assign cur_value = (skill[1]?? && skill[1]!='')?then(skill[1]?replace('\n','')?replace('\r','')?trim,'')>
                    <div class="col-lg-3 col-md-5 col-sm-6 col-12">
                        <div class="radial-progress-single mt-30">
                            <div class="radial-progress">
                                <canvas ref="" height=120 width=120 ></canvas>
                            </div>
                            <h5 class="radial-progress-title">{cur_title}</h5>
                        </div>
                    </div>
                </#if>
                </#list>
            </div>
        </div>
    </div>
</div>
</#if>

<#if settings.keyword_data != ''>
<div class="cr-section counter-section section-padding-xs bg-grey" ref={countEle}>
    <div class="container">
        <div class="row justify-content-center">
            <#list settings.keywordData?split('=====') as keywords>
            <#if (keywords_index + 1) lte limit>
                <#assign keyword = keywords?split('-|||-')>
                <#assign cur_title = (keyword[0]?? && keyword[0]?trim!='')?then(keyword[0]?replace('\n','')?replace('\r','')?trim,'')>
                <#assign cur_value = (keyword[1]?? && keyword[1]!='')?then(keyword[1]?replace('\n','')?replace('\r','')?trim,'')>
                <div class="col-lg-3 col-md-5 col-sm-6 col-12">
                    <div class="single-count">
                        <h2><span class="counter-active">{cur_value}</span>+</h2>
                        <h6>{cur_title}</h6>
                    </div>    
                </div>
            </#if>
            </#list>
        </div>
    </div>
</div>
</#>
<div class="cr-section about-us-area section-padding-lg ">
    <div class="container">
        <div class="row">
            ${sheet.formatContent!}
        </div>
    </div>
</div>

<div class="cr-section about-us-area section-padding-lg"> 
    <#if settings.enable_clean_mode!=true && settings.enable_comment==true && sheet.status!='DRAFT'>
        <div class="comment">
            <#if sheet.disallowComment == true || enable_comment == 'false'>
            <div class="comment__close">
                <svg class="comment__close-icon" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" width="18" height="18">
                <path d="M512.307.973c282.317 0 511.181 201.267 511.181 449.587a402.842 402.842 0 0 1-39.27 173.26 232.448 232.448 0 0 0-52.634-45.977c16.384-39.782 25.293-82.688 25.293-127.283 0-211.098-199.117-382.157-444.621-382.157-245.555 0-444.57 171.06-444.57 382.157 0 133.427 79.514 250.88 200.039 319.18v107.982l102.041-65.127a510.157 510.157 0 0 0 142.49 20.122l19.405-.359c19.405-.716 38.758-2.508 57.958-5.427l3.584 13.415a230.607 230.607 0 0 0 22.323 50.688l-20.633 3.328a581.478 581.478 0 0 1-227.123-12.288L236.646 982.426c-19.66 15.001-35.635 7.168-35.635-17.664v-157.39C79.411 725.198 1.024 595.969 1.024 450.56 1.024 202.24 229.939.973 512.307.973zm318.464 617.011c97.485 0 176.794 80.435 176.794 179.2S928.256 976.23 830.77 976.23c-97.433 0-176.742-80.281-176.742-179.046 0-98.816 79.309-179.149 176.742-179.149zM727.757 719.002a131.174 131.174 0 0 0-25.754 78.182c0 71.885 57.805 130.406 128.768 130.406 28.877 0 55.552-9.625 77.056-26.01zm103.014-52.327c-19.712 0-39.117 4.557-56.678 13.312L946.33 854.58c8.499-17.305 13.158-36.864 13.158-57.395 0-71.987-57.805-130.509-128.717-130.509zM512.307 383.13l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43zm266.752 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072h-.051l.307-6.86a67.072 67.072 0 0 1 66.406-60.57zm-533.504 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43z" />
                </svg>
                <span>博主关闭了当前页面的评论</span>
            </div>
            <#else>
            <#include "module/comment.ftl">
            <@comment target=sheet type="sheet"/>
            </#if>
        </div>
    <#else>
        <div class="comment">
            <div class="comment__close">
            <svg class="comment__close-icon" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" width="18" height="18">
                <path d="M512.307.973c282.317 0 511.181 201.267 511.181 449.587a402.842 402.842 0 0 1-39.27 173.26 232.448 232.448 0 0 0-52.634-45.977c16.384-39.782 25.293-82.688 25.293-127.283 0-211.098-199.117-382.157-444.621-382.157-245.555 0-444.57 171.06-444.57 382.157 0 133.427 79.514 250.88 200.039 319.18v107.982l102.041-65.127a510.157 510.157 0 0 0 142.49 20.122l19.405-.359c19.405-.716 38.758-2.508 57.958-5.427l3.584 13.415a230.607 230.607 0 0 0 22.323 50.688l-20.633 3.328a581.478 581.478 0 0 1-227.123-12.288L236.646 982.426c-19.66 15.001-35.635 7.168-35.635-17.664v-157.39C79.411 725.198 1.024 595.969 1.024 450.56 1.024 202.24 229.939.973 512.307.973zm318.464 617.011c97.485 0 176.794 80.435 176.794 179.2S928.256 976.23 830.77 976.23c-97.433 0-176.742-80.281-176.742-179.046 0-98.816 79.309-179.149 176.742-179.149zM727.757 719.002a131.174 131.174 0 0 0-25.754 78.182c0 71.885 57.805 130.406 128.768 130.406 28.877 0 55.552-9.625 77.056-26.01zm103.014-52.327c-19.712 0-39.117 4.557-56.678 13.312L946.33 854.58c8.499-17.305 13.158-36.864 13.158-57.395 0-71.987-57.805-130.509-128.717-130.509zM512.307 383.13l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43zm266.752 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072h-.051l.307-6.86a67.072 67.072 0 0 1 66.406-60.57zm-533.504 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43z" />
            </svg>
            <span>${(sheet.status=='DRAFT')?then('预览状态下不可评论','博主关闭了所有页面的评论')}</span>
            </div>
        </div>
    </#if>
</div>

</@layout>