<#macro breadcrumb title>
<div class="gloo-breadcrumb bg-grey">
    <div class="container">
        <div class="gloo-breadcrumb">
            <h2>${title!}</h2>
            <ul>
                <li><a href="/">主页</a></li>
                <li>${title!}</li>
            </ul>
        </div>
    </div>
</div>
</#macro>
