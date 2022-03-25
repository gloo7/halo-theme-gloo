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
        <script src="${theme_base!}/plugins/lazysizes/lazysizes.min.js"></script>
        <script src="${theme_base!}/plugins/vue@2.6.10/vue.min.js"></script>
        <script src="${theme_base!}/plugins/halo-comment/halo-comment.min.js?v=1.0.9"></script>
        <script type="text/javascript">
        var setStore = function(name, content, maxAge = null) {
            if (!window || !name) {
                return
            }
            if (typeof content !== 'string') {
                content = JSON.stringify(content)
            }
            const storage = window.localStorage
            storage.setItem(name, content)
            if (maxAge && !isNaN(parseInt(maxAge))) {
                const timeout = parseInt(new Date().getTime() / 1000)
                storage.setItem(name + '_expire', timeout + maxAge)
            }
        }

        var getStore = function(name) {
            if (!window || !name) {
                return
            }
            const content = window.localStorage.getItem(name)
            const _expire = window.localStorage.getItem(name + '_expire')
            if (_expire) {
                const now = parseInt(new Date().getTime() / 1000)
                if (now > _expire) {
                return
                }
            }
            
            try {
                return JSON.parse(content)
            } catch (e) {
                return content
            }
        }
        
        var showHeader = function(e) {
            const next = e.nextElementSibling;
            if (e.classList.contains('is-active')) {
              e.classList.remove("is-active");
              next.classList.remove("is-visible");
              setStore("nav_is_active", false)
            } else {
              e.classList.add("is-active");
              next.classList.add("is-visible");
              setStore("nav_is_active", true)
            }
        }

        var navIsActive = getStore("nav_is_active");
        if (navIsActive) {
            const navElements = document.getElementsByClassName('nav')
            for (key in navElements) {
                const nav = navElements[key]
                const next = nav.nextElementSibling;
                nav.classList.add("is-active");
                next.classList.add("is-visible");
            }
        }                
        </script>
    </body>
</html>
</#macro>
