<#include './header.ftl'>
<#include './footer.ftl'>
<#include './breadcrumb.ftl'>
<#include './rightside.ftl'>
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
        <link rel="stylesheet" href="${theme_base!}/source/css/style.min.css">
        <link rel="stylesheet" href="${theme_base!}/source/css/meanmenu.min.css">
        <link rel="preload stylesheet" as="style" href="${theme_base!}/plugins/prism/prism.min.css">
        <link rel="preload stylesheet" as="style"
              href="${theme_base!}/plugins/prism/themes/prism-${settings.code_theme!}.css">
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
            <@rightside />     
        </main>

        <@global.footer/>
        <script src="${theme_base!}/plugins/lazysizes/lazysizes.min.js"></script>
        <script src="${theme_base!}/plugins/vue@2.6.10/vue.min.js"></script>
        <script src="${theme_base!}/plugins/halo-comment/halo-comment.min.js?v=1.0.9"></script>
        <script src="${theme_base!}/plugins/prism/prism.min.js"></script>
        <script type="text/javascript">
        function setStore(name, content, maxAge = null) {
            if (!window || !name) {
                return
            }
            if (typeof content !== 'string') {
                content = JSON.stringify(content)
            }
            let storage = window.localStorage
            storage.setItem(name, content)
            if (maxAge && !isNaN(parseInt(maxAge))) {
                let timeout = parseInt(new Date().getTime() / 1000)
                storage.setItem(name + '_expire', timeout + maxAge)
            }
        }

        function getStore(name) {
            if (!window || !name) {
                return
            }
            let content = window.localStorage.getItem(name)
            let _expire = window.localStorage.getItem(name + '_expire')
            if (_expire) {
                let now = parseInt(new Date().getTime() / 1000)
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


        function wxQrTrigger() {
            let wx = document.getElementById('wx')
            if (wx.classList.contains('hidden')) {
                wx.classList.remove('hidden')
            } else {
                wx.classList.add('hidden')
            }
        }

        function showDark(e) {
            let darkIsActive;
            let head = document.getElementsByTagName("head")[0];
            let indexImage = document.getElementById("index-image");

            if (typeof(e) == "undefined") {
                darkIsActive = getStore("dark_is_active");
                e = document.getElementById("rightside")
            } else {
                darkIsActive = !e.classList.contains("is-active")
            }

            if (darkIsActive) {
                let link = document.createElement("link");
                link.id = "dark"
                link.rel = "stylesheet";
                link.type = "text/css";
                link.href = "${theme_base!}/source/css/dark-color.min.css";
                head.appendChild(link);
                indexImage && indexImage.setAttribute("src", "${theme_base!}/source/images/slider-image-2.png");
                e.classList.add("is-active");
                setStore("dark_is_active", true)
            } else {
                let link = document.getElementById("dark")
                head.removeChild(link)
                indexImage && indexImage.setAttribute("src", "${theme_base!}/source/images/slider-image-1.png");
                e.classList.remove("is-active");
                setStore("dark_is_active", false)
            }
        }
        
        function showHeader(e) {
            let navIsActive;
            
            if (typeof(e) == "undefined") {
                navIsActive = getStore("nav_is_active");
                e = document.getElementsByClassName("nav")
            } else {
                navIsActive = !e.classList.contains("is-active")
                e = [e]
            }

            for (i=0;i<e.length;i++) {
                let nav = e[i]
                let next = nav.nextElementSibling;
                if (navIsActive) {
                    nav.classList.add("is-active");
                    next.classList.add("is-visible");
                    setStore("nav_is_active", true)
                } else {
                    nav.classList.remove("is-active");
                    next.classList.remove("is-visible");
                    setStore("nav_is_active", false)
                }
            }
        }

        window.addEventListener('scroll', function(e) {
            let header = document.getElementById("header")
		    let scrollY = document.documentElement.scrollTop

            if (header) {
                if (scrollY>200) {
                    header.classList.add("is-sticky")
                }else {
                    if (header.classList.contains("is-sticky")) header.classList.remove("is-sticky")
                }	
            }
        }, true);

        showHeader();
        showDark();
            
        </script>
    </body>
</html>
</#macro>
