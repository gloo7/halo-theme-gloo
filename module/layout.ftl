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
        <meta name="description" content="Web site created using create-react-app"/>
        <@global.head/>
        <link rel="icon" href="${theme_base!}/source/favicon.ico"/>
        <link rel="apple-touch-icon" href="${theme_base!}/source/logo.png"/>
        <link rel="manifest" href="${theme_base!}/source/manifest.json"/>
        <link rel="stylesheet" href="${theme_base!}/source/css/bootstrap.min.css">
        <link rel="stylesheet" href="${theme_base!}/source/css/plugins.css">
        <link rel="stylesheet" href="${theme_base!}/source/css/style.css">
        <title>${title}</title>
    </head>
    <body>
        <main class="page-content">
            <@header fixed_header=fixed_header/>
            <#if enable_breadcrumb>
                <@breadcrumb title="${title}"/>
            </#if>
            <#nested >        
            <@footer/>
        </main>
        <@global.footer/>
        <script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=xAdyMLfNM6jW8DGfY37AHjYP31feF1QC"></script>
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
    </body>
</html>
</#macro>
