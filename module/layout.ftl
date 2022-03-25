<#include './header.ftl'>
<#include './footer.ftl'>
<#include './breadcrumb.ftl'>
<#macro layout title="${blog_title!}" fixed_header=false enable_breadcrumb=true>
<!DOCTYPE html>
<html lang="zh-CN" data-theme="light">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width,initial-scale=1"/>
        <meta name="theme-color" content="#000000"/>
        <title>${title}</title>
        <meta name="description" content="Web site created using create-react-app"/>
        <@global.head/>
        <link rel="icon" href="${theme_base!}/source/favicon.ico"/>
        <link rel="apple-touch-icon" href="${theme_base!}/source/logo.png"/>
        <link rel="manifest" href="${theme_base!}/source/manifest.json"/>
        <link rel="stylesheet" href="${theme_base!}/source/css/bootstrap.min.css">
        <link rel="stylesheet" href="${theme_base!}/source/css/plugins.css">
        <link rel="stylesheet" href="${theme_base!}/source/css/style.css">
        <script type="text/javascript">
            if (!!window.ActiveXObject || "ActiveXObject" in window) {
                alert('请抛弃万恶的IE系列浏览器吧。');
            }
        </script>
    </head>
    <body>
        <main class="page-content">
            <@header fixed_header=fixed_header/>
            <#if enable_breadcrumb>
                <@breadcrumb title=title/>
            </#if>
            <#nested />
            <@footer/>       
        </main>

        <@global.footer/>
        <script type="text/javascript">
        var showHeader = function(e) {
            const next = e.nextElementSibling;
            if (e.classList.contains('is-active')) {
              e.classList.remove("is-active");
              next.classList.remove("is-visible");
            } else {
              e.classList.add("is-active");
              next.classList.add("is-visible");
            }
        }                
        </script>
                <script src="${theme_base!}/plugins/vue@2.6.10/vue.min.js"></script>
                <script src="${theme_base!}/plugins/halo-comment/halo-comment.min.js?v=1.0.9"></script>
    </body>
</html>
</#macro>
