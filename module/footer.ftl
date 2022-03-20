<#macro footer>
<footer id="footer" class="footer-area ">
    <div class="container">
        <ul class="footer-inner">
            <li>总浏览量：${count!'0'}<br/> ${settings.country}，${settings.province}</li>
            <li>
                <a href="tel://${settings.telphone}">+${settings.telphone}</a><br/>
                <a target="_blank" href="http://www.beian.miit.gov.cn/">${settings.icp}</a>
            </li>
            <li><a href="mailto://${settings.email}">${settings.email}</a></li>
            <li>Copyright &copy; ${settings.copyright}</li>
        </ul>
    </div>
</footer>
</#macro>