<#include "macro/navbar.ftl" />
<#include "macro/sidebar.ftl" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>Peso</title>

    <meta name="description" content="Static &amp; Dynamic Tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/css/jquery-ui.custom.min.css"/>
    <link rel="stylesheet" href="/css/chosen.min.css"/>
    <link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css"/>
    <link rel="stylesheet" href="/css/bootstrap-timepicker.min.css"/>
    <link rel="stylesheet" href="/css/daterangepicker.min.css"/>
    <link rel="stylesheet" href="/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="/css/bootstrap-colorpicker.min.css"/>
    <!-- <link rel="stylesheet" href="/css/fonts.googleapis.com.css"/> -->
    <link rel="stylesheet" href="/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style"/>
    <link rel="stylesheet" href="/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="/css/wangEditor.css">

    <script src="/js/jquery-2.1.4.min.js"></script>
    <script src="/js/ace-extra.min.js"></script>


</head>

<body class="no-skin">
<!--顶部导航栏-->
<@navbar />
<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.loadState('main-container')
        } catch (e) {
        }
    </script>
    <!--左边栏-->
<@sidebar menu="config_list" />

    <!--内容区-->
    <div class="main-content">
        <div class="page-content">
            <div class="main-content-inner">
                <div class="page-header">
                    <h1>
                        配置管理
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            <#if config??>
                                修改配置
                            <#else>
                                新增配置
                            </#if>
                        </small>
                    </h1>
                </div><!-- /.page-header -->
            </div>

        </div>



        <!--input-->
        <div class="col-xs-12" style="margin-top: 20px;">
            <form class="form-horizontal" role="form" id="myForm"  action=""  method="post" enctype="multipart/form-data">

                <!-- 文件名 -->
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="department_explain">文件名</label>

                    <div class="col-sm-9">
                        <input value="<#if config??>${config.title!}</#if>" type="text" id="departmentExplain" placeholder="输入文件名" class="col-xs-10 col-sm-9" name="title"/>
                    </div>
                </div>

                <!-- 配置组 -->
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 配置组 </label>
                    <div class="col-sm-9">
                        <select class="chosen-select col-xs-10 col-sm-9" name="groupName" id="sel-group" data-placeholder="选择配置组">
                            <option value="<#if config??>${config.groupName!}</#if>"><#if config??>${config.groupName!}</#if></option>
                        </select>
                        <button class="btn btn-primary btn-mini" type="button">
                            <i class="ace-icon fa fa-cog bigger-110"></i>
                            配置组管理
                        </button>
                    </div>
                </div>

                <!-- 配置环境 -->
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 配置环境 </label>
                    <div class="col-sm-9">
                        <select class="col-xs-10 col-sm-9" id="sel-config-env" name="env">
                            <option value="develop" <#if config?? && config.env=="develop">selected</#if> >develop</option>
                            <option value="master" <#if config?? && config.env=="master">selected</#if>>master</option>
                            <option value="stg" <#if config?? && config.env=="stg">selected</#if>>stg</option>
                            <option value="production" <#if config?? && config.env=="production">selected</#if>>production</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 配置内容 </label>
                    <div class="col-sm-9">
                        <textarea id="form-field-11" name="content" style="min-height: 200px; padding: 10px; line-height: 2em;" class="autosize-transition col-xs-10 col-sm-9"><#if config??>${config.content!}</#if></textarea>
                    </div>
                </div>


                <div class="clearfix form-actions no-padding-left">
                    <div class="col-md-offset-3 col-md-9 no-padding-left">
                        <button class="btn btn-info" type="submit">
                            <i class="ace-icon fa fa-check bigger-110"></i>
                            提交
                        </button>
                        <button class="btn btn-grey" type="button" onclick="javascript: window.history.back();">
                            <i class="ace-icon fa fa-backward bigger-110"></i>
                            返回
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div><!-- /.main-content -->
    <!--底栏信息-->
    <div class="footer">
        <div class="footer-inner">
            <div class="footer-content">
                <span class="bigger-120">

                </span>

                &nbsp; &nbsp;
                <span class="action-buttons">
                    <a href="#">
                        <i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
                    </a>

                    <a href="#">
                        <i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
                    </a>

                    <a href="#">
                        <i class="ace-icon fa fa-rss-square orange bigger-150"></i>
                    </a>
                </span>
            </div>
        </div>
    </div>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->
<script src="/js/icon_down.js"></script>
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery-ui.custom.min.js"></script>
<script src="/js/jquery.ui.touch-punch.min.js"></script>
<script src="/js/chosen.jquery.min.js"></script>
<script src="/js/spinbox.min.js"></script>
<script src="/js/bootstrap-datepicker.min.js"></script>
<script src="/js/bootstrap-timepicker.min.js"></script>
<script src="/js/moment.min.js"></script>
<script src="/js/daterangepicker.min.js"></script>
<script src="/js/bootstrap-datetimepicker.min.js"></script>
<script src="/js/bootstrap-colorpicker.min.js"></script>
<script src="/js/jquery.knob.min.js"></script>
<script src="/js/autosize.min.js"></script>
<script src="/js/jquery.inputlimiter.min.js"></script>
<script src="/js/jquery.maskedinput.min.js"></script>
<script src="/js/bootstrap-tag.min.js"></script>
<script src="/js/ace-elements.min.js"></script>
<script src="/js/ace.min.js"></script>


<script src="/js/jquery.dataTables.min.js"></script>
<script src="/js/jquery.dataTables.bootstrap.min.js"></script>
<script src="/js/dataTables.buttons.min.js"></script>
<script src="/js/buttons.flash.min.js"></script>
<script src="/js/buttons.html5.min.js"></script>
<script src="/js/buttons.print.min.js"></script>
<script src="/js/buttons.colVis.min.js"></script>
<script src="/js/dataTables.select.min.js"></script>

<script src="/js/wangEditor.js"></script>
<script src="/js/bootbox.js"></script>
<script src="/js/jquery.validate.min.js"></script>
<script src="/js/jquery.form.js"></script>
<script src="/js/jquery-validate-message.js"></script>

<script type="text/javascript">
    function showResponse(responseText,statusText) {
        bootbox.alert({
            message: "保存成功",
            callback: function () {
                window.location.href = "/config";
            }
        })
    }

    function showRequest(formData,jqForm,options){
        return $("#myForm").valid();
    }

    $(document).ready(function() {
        $('#myForm').submit(function(){
            $(this).ajaxSubmit({
                type:"post",
                url:"/config/save",
                //beforeSubmit:showRequest,
                success:showResponse
            });
            return false; //此处必须返回false，阻止常规的form提交
        });

//        $("#myForm").validate({
//            focusCleanup:true,
//            focusInvalid:false,
//            errorClass: "unchecked",
//            validClass: "checked",
//            errorElement: "label",
//            errorPlacement:function(error,element){
//                var s=element.parent().find("span[htmlFor='" + element.attr("id") + "']");
//                if(s!=null){
//                    s.remove();
//                }
//                error.appendTo(element.parent());
//            },
//            rules: {
//                departmentName: {
//                    required: true,
//                    minlength:1,  //设置最小长度
//                    maxlength:50,
//                    regex:"[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]"
//                },
//                type:{
//                    required: true,
//                    number:true,
//                    range:[0,100]
//                }
//            }
//        });

        $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true
        });

        autosize($('textarea[class*=autosize]'));

        $.getJSON('/group/list', function (data) {

            var groupName = $('#sel-group').val();


            //动态插入配置项
            $.each(data, function (i, g) {

                if(groupName !== g.groupName){
                    $('#sel-group').append('<option value="'+g.groupName+'" >'+g.groupName+'</option>');
                }

            });

            $('.chosen-select').chosen({allow_single_deselect:true});

        });

    });
    //调用jquery-validate-message.js
    //    funcCollection.checkRegex(departmentName);


</script>

</body>
</html>
