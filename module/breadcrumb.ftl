<#macro title>
<div className="container">
    <div className="cr-breadcrumb">
        <h2>${title!}</h2>
        <ul>
            <li><a to="/index">主页</a></li>
            <li>${title!}</li>
        </ul>
    </div>
</div>
</#macro>
