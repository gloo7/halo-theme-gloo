<#include "module/layout.ftl">
<@layout title="${sheet.title!}">
<#if settings.skill_data != ''>
<div class="section skills-area section-padding-lg">
    <div class="container">
        <div class="row justify-content-center">
            <div class="section-title text-center">
                <h2>我的成分</h2>
                <p>这是我的主要技能 & 成分</p>
            </div>
        </div>
        <div class="row justify-content-center">
            <#list settings.skill_data?split('=====') as skills>
                <#assign skill = skills?split('-|||-')>
                <#assign cur_title = (skill[0]?? && skill[0]?trim!='')?then(skill[0]?replace('\n','')?replace('\r','')?trim,'')>
                <#assign cur_value = (skill[1]?? && skill[1]!='')?then(skill[1]?replace('\n','')?replace('\r','')?trim,'')>
                <div class="col-lg-3 col-md-5 col-sm-6 col-12">
                    <div class="radial-progress-single mt-30">
                        <div class="radial-progress">
                            <canvas class="radial-progress-canvas" height=120 width=120 value="${cur_value}" ></canvas>
                        </div>
                        <h5 class="radial-progress-title">${cur_title}</h5>
                    </div>
                </div>
            </#list>
        </div>
    </div>
</div>
<script type="text/javascript">
    var playAnimate = function (percent, drawing_elem) {
        const lineWidth = 3;
        const forecolor = "#333333"
        const bgcolor = '#f0f0f0';

        var context = drawing_elem.getContext("2d");
        var center_x = drawing_elem.width / 2;
        var center_y = drawing_elem.height / 2;
        var rad = Math.PI*2/100;
        var speed = 0;
        // 绘制背景圆圈
        const backgroundCircle = function() {
            context.save();
            context.beginPath();
            context.lineWidth = lineWidth; //设置线宽
            var radius = center_x - context.lineWidth;
            context.lineCap = "round";
            context.strokeStyle = bgcolor;
            context.arc(center_x, center_y, radius, 0, Math.PI*2, false);
            context.stroke();
            context.closePath();
            context.restore();
        }

        //绘制运动圆环
        const foregroundCircle = function(n) {
            context.save();
            context.strokeStyle = forecolor;
            context.lineWidth = lineWidth;
            context.lineCap = "round";
            var radius = center_x - context.lineWidth;
            context.beginPath();
            context.arc(center_x, center_y, radius , -Math.PI/2, -Math.PI/2 +n*rad, false); //用于绘制圆弧context.arc(x坐标，y坐标，半径，起始角度，终止角度，顺时针/逆时针)
            context.stroke();
            context.closePath();
            context.restore();
        }

        //绘制文字
        const text = function(n) {
            context.save(); //save和restore可以保证样式属性只运用于该段canvas元素
            context.fillStyle = forecolor;
            var font_size = 18;
            context.font = font_size + "px Helvetica";
            var text_width = context.measureText(n.toFixed(0)+"%").width;
            context.fillText(n.toFixed(0)+"%", center_x-text_width/2, center_y + font_size/2);
            context.restore();
        }

        //执行动画
        const drawFrame = function() {
            window.requestAnimationFrame(drawFrame);
            context.clearRect(0, 0, drawing_elem.width, drawing_elem.height);
            backgroundCircle();
            text(speed);
            foregroundCircle(speed);
            if(speed >= percent) return;
            speed += 1;
        };
        drawFrame();
    }
    var radialElements = document.getElementsByClassName("radial-progress-canvas")
    for (key in radialElements) {
        const radial = radialElements[key]
        const value = radial.getAttribute("value")
        playAnimate(value || 100, radial)
    }
    
</script>
</#if>

<#if settings.keyword_data != ''>
<div class="section counter-section section-padding-xs bg-grey" ref={countEle}>
    <div class="container">
        <div class="row justify-content-center">
            <#list settings.keyword_data?split('=====') as keywords>
                <#assign keyword = keywords?split('-|||-')>
                <#assign cur_title = (keyword[0]?? && keyword[0]?trim!='')?then(keyword[0]?replace('\n','')?replace('\r','')?trim,'')>
                <#assign cur_value = (keyword[1]?? && keyword[1]!='')?then(keyword[1]?replace('\n','')?replace('\r','')?trim,'')>
                <div class="col-lg-3 col-md-5 col-sm-6 col-12">
                    <div class="single-count">
                        <h2><span class="counter-active">${cur_value}</span>+</h2>
                        <h6>${cur_title}</h6>
                    </div>    
                </div>
            </#list>
        </div>
    </div>
</div>
</#if>

<div class="section about-us-area section-padding-lg ">
    <div class="container">
        ${sheet.formatContent!}
    </div>
</div>

<div class="section about-us-area section-padding-bottom-lg">
    <div class="container">
        <#if settings.enable_comment==true && sheet.status!='DRAFT'>
            <#if sheet.disallowComment == true>
                <div class="comment__close">
                    <svg class="comment__close-icon" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" width="18" height="18">
                    <path d="M512.307.973c282.317 0 511.181 201.267 511.181 449.587a402.842 402.842 0 0 1-39.27 173.26 232.448 232.448 0 0 0-52.634-45.977c16.384-39.782 25.293-82.688 25.293-127.283 0-211.098-199.117-382.157-444.621-382.157-245.555 0-444.57 171.06-444.57 382.157 0 133.427 79.514 250.88 200.039 319.18v107.982l102.041-65.127a510.157 510.157 0 0 0 142.49 20.122l19.405-.359c19.405-.716 38.758-2.508 57.958-5.427l3.584 13.415a230.607 230.607 0 0 0 22.323 50.688l-20.633 3.328a581.478 581.478 0 0 1-227.123-12.288L236.646 982.426c-19.66 15.001-35.635 7.168-35.635-17.664v-157.39C79.411 725.198 1.024 595.969 1.024 450.56 1.024 202.24 229.939.973 512.307.973zm318.464 617.011c97.485 0 176.794 80.435 176.794 179.2S928.256 976.23 830.77 976.23c-97.433 0-176.742-80.281-176.742-179.046 0-98.816 79.309-179.149 176.742-179.149zM727.757 719.002a131.174 131.174 0 0 0-25.754 78.182c0 71.885 57.805 130.406 128.768 130.406 28.877 0 55.552-9.625 77.056-26.01zm103.014-52.327c-19.712 0-39.117 4.557-56.678 13.312L946.33 854.58c8.499-17.305 13.158-36.864 13.158-57.395 0-71.987-57.805-130.509-128.717-130.509zM512.307 383.13l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43zm266.752 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072h-.051l.307-6.86a67.072 67.072 0 0 1 66.406-60.57zm-533.504 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43z" />
                    </svg>
                    <span>博主关闭了当前页面的评论</span>
                </div>
            <#else>
                <#include "module/comment.ftl">
                <@comment target=sheet type="sheet"/>
            </#if>
        <#else>
            <div class="comment__close">
            <svg class="comment__close-icon" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" width="18" height="18">
                <path d="M512.307.973c282.317 0 511.181 201.267 511.181 449.587a402.842 402.842 0 0 1-39.27 173.26 232.448 232.448 0 0 0-52.634-45.977c16.384-39.782 25.293-82.688 25.293-127.283 0-211.098-199.117-382.157-444.621-382.157-245.555 0-444.57 171.06-444.57 382.157 0 133.427 79.514 250.88 200.039 319.18v107.982l102.041-65.127a510.157 510.157 0 0 0 142.49 20.122l19.405-.359c19.405-.716 38.758-2.508 57.958-5.427l3.584 13.415a230.607 230.607 0 0 0 22.323 50.688l-20.633 3.328a581.478 581.478 0 0 1-227.123-12.288L236.646 982.426c-19.66 15.001-35.635 7.168-35.635-17.664v-157.39C79.411 725.198 1.024 595.969 1.024 450.56 1.024 202.24 229.939.973 512.307.973zm318.464 617.011c97.485 0 176.794 80.435 176.794 179.2S928.256 976.23 830.77 976.23c-97.433 0-176.742-80.281-176.742-179.046 0-98.816 79.309-179.149 176.742-179.149zM727.757 719.002a131.174 131.174 0 0 0-25.754 78.182c0 71.885 57.805 130.406 128.768 130.406 28.877 0 55.552-9.625 77.056-26.01zm103.014-52.327c-19.712 0-39.117 4.557-56.678 13.312L946.33 854.58c8.499-17.305 13.158-36.864 13.158-57.395 0-71.987-57.805-130.509-128.717-130.509zM512.307 383.13l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43zm266.752 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072h-.051l.307-6.86a67.072 67.072 0 0 1 66.406-60.57zm-533.504 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43z" />
            </svg>
            <span>${(sheet.status=='DRAFT')?then('预览状态下不可评论','博主关闭了所有页面的评论')}</span>
            </div>
        </#if>
    </div>
</div>

</@layout>