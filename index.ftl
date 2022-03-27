<#include "module/layout.ftl">
<@layout fixed_header=true enable_breadcrumb=false>
    <div class="hero-area ">
        <div class="container">
            <div class="hero-area-inner">
                <div class="hero-area-text">
                    <h1>
                        HELLO, <br/>
                        I AM  ${user.nickname!}...
                    </h1>

                    <h5${settings.job}</h5>
                    <a href="/s/about" class="readmore">关于我</a>
                </div>
                <div class="hero-area-image">
                    <img id="index-image" src="${theme_base!}/source/images/slider-image-1.png" alt="man mask" />
                </div>
                <div class="social-icons">
                    <ul>
                        <#if settings.qrcode_wx != ''>
                            <svg onclick="wxQrTrigger()" class="icon" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" width="26" height="26">
                                <path d="M334.848 334.336a33.792 33.792 0 0 0-36.352 30.72 33.792 33.792 0 0 0 36.352 30.72 28.672 28.672 0 0 0 30.208-30.72 28.672 28.672 0 0 0-30.208-30.72zM581.12 512a24.576 24.576 0 0 0 0 51.2 27.648 27.648 0 0 0 30.208-24.576 27.648 27.648 0 0 0-30.208-26.624zM502.784 395.776a28.672 28.672 0 0 0 30.208-30.72 28.672 28.672 0 0 0-30.208-30.72 33.792 33.792 0 0 0-35.84 30.72 33.792 33.792 0 0 0 35.84 30.72zM713.216 512a24.576 24.576 0 0 0 0 51.2 27.648 27.648 0 0 0 30.208-24.576 27.648 27.648 0 0 0-30.208-26.624z"
                                    ></path>
                                <path d="M512 0a512 512 0 1 0 512 512A512 512 0 0 0 512 0zM412.672 646.656a403.456 403.456 0 0 1-83.968-12.288l-83.968 43.008 24.064-73.728a201.216 201.216 0 0 1-96.256-165.376c0-116.224 108.032-207.872 240.128-207.872a240.128 240.128 0 0 1 242.688 172.032h-23.04a198.144 198.144 0 0 0-204.8 193.536 185.344 185.344 0 0 0 7.168 51.2zM768 732.672l17.92 60.928-66.048-36.864a296.96 296.96 0 0 1-72.192 12.288 191.488 191.488 0 0 1-204.8-177.664 191.488 191.488 0 0 1 204.8-177.664c108.032 0 204.8 79.872 204.8 177.664A185.856 185.856 0 0 1 768 732.672z"
                                    ></path>
                            </svg>
                        </#if>
                    </ul>
                </div>
            </div>
        </div>
        
        <#if settings.qrcode_wx != ''>
        <div id="wx" class="hidden" style="
            position:fixed;
            top:0;
            right:0;
            bottom:0;
            left:0;
            z-index:1050;
            overflow:hidden;
            outline:0;"
            onclick=""
        >
            <div class="modal-dialog " style="
                position:absolute;
                top:50%;
                left:50%;
                transform:translate(-50%,-50%);
                min-width:300px;
                margin:0;
            ">
                <div class="modal-content">
                    <div class="modal-header">
                        <button onclick="wxQrTrigger()" type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <img src="${settings.qrcode_wx}" art="wx"/>
                    </div>
                </div>
            </div>
        </div>
        </#if>

        <#if settings.provide_data != ''>
        <div class="section services-area section-padding-bottom-lg section-padding-top-lg">
            
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="section-title text-center">
                            <h2>我提供的</h2>
                            <p>我一直知道且提供的服务</p>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <#list settings.provide_data?split('=====') as provides>
                        <#assign provide = provides?split('-|||-')>
                        <#assign cur_title = (provide[0]?? && provide[0]?trim!='')?then(provide[0]?replace('\n','')?replace('\r','')?trim,'')>
                        <#assign cur_value = (provide[1]?? && provide[1]!='')?then(provide[1]?replace('\n','')?replace('\r','')?trim,'')>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="service text-center boxed-layout">
                                <h5>${cur_title}</h5>
                                <p>${cur_value}</p>
                            </div>
                        </div>
                    </#list>
                </div>
            </div>
        </div>
        </#if>    
    </div>
</@layout>