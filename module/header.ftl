
<#macro header fixed_header>
<header id="header" class="header sticky-header <#if fixed_header>fixed-header</#if>">
    <div class="container">
        <div class="header-inner d-none d-lg-flex">
            <div class="header-logo">
                <a href="/">
                </a>
            </div>
            <div class="header-navigation">
                <a id="nav" onclick="showHeader(this)" class="header-navigation-trigger nav">
                    <span></span>
                    <span></span>
                    <span></span>
                </a>
                <nav class="main-navigation">
                    <ul>
                        <@menuTag method="list">
                            <#list menus?sort_by('priority') as menu>
                                <li><a href="${menu.url!}" target="${menu.target!}">${menu.name!} </a></li>
                            </#list>
                        </@menuTag>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="mobile-menu-wrapper d-block d-lg-none">
            <div class="mobile-menu clearfix">
                <a href="/" class="mobile-logo">
                </a>
                <div class="mobile-menu-wrapper d-block d-lg-none">
                    <div class="mobile-menu clearfix mean-container">
                        <div class="mean-bar">
                            <a
                                class="meanmenu-reveal nav"
                                onclick="showHeader(this)"
                            >
                                <span></span>
                                <span></span>
                                <span></span>
                            </a>
                            <nav class="mean-nav">
                                <ul>
                                    <@menuTag method="list">
                                        <#list menus?sort_by('priority') as menu>
                                            <li><a href="${menu.url!}" target="${menu.target!}">${menu.name!} </a></li>
                                        </#list>
                                    </@menuTag>
                                </ul>
                            </nav>
                        </div>
                        <a class="mobile-logo" href="/">
                            <img src="${theme_base!}/source/images/logo-dark.png" alt="mobile logo" />
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
</#macro>