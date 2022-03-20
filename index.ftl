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
                    <Link to="/about" class="readmore">关于我</Link>
                </div>
                <div class="hero-area-image">
                    <img src="${theme_base!}/source/images/slider-image-1.png" alt="man mask" />
                </div>
                <div class="social-icons">
                    <ul>
                        <li><a><i class="fa fa-weixin"></i></a></li>
                        <li><a><i class="fa fa-qq"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>

        <#if settings.qrcode_qq != ''>
        <div style="
            position:fixed;
            top:0;
            right:0;
            bottom:0;
            left:0;
            z-index:1050;
            overflow:hidden;
            display:none;
            outline:0;
        ">
            <div class="modal-dialog" style="
                position:absolute;
                top:50%;
                left:50%;
                transform:translate(-50%,-50%);
                min-width:300px;
                margin:0;
            ">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">QQ</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <img src="${settings.qrcode_qq}" art="QQ"/>
                    </div>
                </div>
            </div>
        </div>
        </#if>
        
        <#if settings.qrcode_wx != ''>
        <div style="
            position:fixed;
            top:0;
            right:0;
            bottom:0;
            left:0;
            z-index:1050;
            overflow:hidden;
            display:none;
            outline:0;
        ">
            <div class="modal-dialog" style="
                position:absolute;
                top:50%;
                left:50%;
                transform:translate(-50%,-50%);
                min-width:300px;
                margin:0;
            ">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">微信</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <img src="${settings.qrcode_wx}" art="wx"/>
                    </div>
                </div>
            </div>
        </div>
        </#if>

        <#if settings.provide_data != ''>
        <div class="cr-section services-area section-padding-bottom-lg section-padding-top-lg">
            
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
                            <div class="service text-center">
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