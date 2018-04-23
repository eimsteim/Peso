<#include "macro/sidebar.ftl" />
<#include "macro/navbar.ftl" />
<!DOCTYPE html>
<html lang="zh-cn">
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
    <link rel="stylesheet" href="/css/bootstrap-table.css"/>
    <link rel="stylesheet" href="/css/rhtop-common.css"/>

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
        <!--input-->
        <div class="col-xs-12" style="margin-top: 20px;">
            <form class="form-horizontal" role="form" action="/market/manager/search">

                <!-- 选择课程 -->
                <div class="form-group">

                    <!-- 配置组 -->
                    <label class="col-sm-1 control-label no-padding-right" for="form-groupName"> 配置组 </label>
                    <div class="col-sm-3">
                        <select class="chosen-select col-xs-10 col-sm-12" name="groupName" id="form-groupName" data-placeholder="选择配置组">
                            <option value="">  </option>
                        </select>
                    </div>


                    <label class="col-sm-1 control-label no-padding-right" for="form-env"> 配置环境 </label>
                    <div class="col-sm-3">
                        <select class="col-xs-10 col-sm-12" id="form-env" name="env">
                            <option value="">ALL</option>
                            <option value="develop">develop</option>
                            <option value="master">master</option>
                            <option value="stg">stg</option>
                            <option value="production">production</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <#--标题查询条件-->
                    <label class="col-sm-1 control-label no-padding-right" for="form-title"> 文件名 </label>
                    <div class="col-sm-3">
                        <input type="text" id="form-title" placeholder="请输入文件名" class="col-xs-10 col-sm-12" name="title"/>
                    </div>
                </div>


                <hr class="blue"/>
            </form>

        </div>
        <!--tab-->
        <div class="main-content-inner">

            <div class="page-content">

                <div class="row">
                    <div class="col-xs-12">

                        <div class="row">
                            <div class="col-xs-12">
                                <h3 class="header smaller lighter blue">配置列表</h3>

                                <div class="table-header">
                                    <button class="btn btn-sm btn-inverse" onclick="refreshTable()">查询</button>
                                    <a class="btn btn-sm btn-primary" href="/config/add">新增</a>
                                </div>

                                <div>
                                    <table id="table">
                                        <thead>
                                        <tr>
                                            <th data-field="state" data-checkbox="true"></th>
                                            <th data-field="num" data-formatter="boot_indexFormatter">序号</th>
                                            <th data-field="id" data-visible="false">编号</th>
                                            <th data-field="title" data-formatter="ellipsisFormatter">文件名</th>
                                            <th data-field="groupName">配置组名称</th>
                                            <th data-field="env">配置组环境</th>
                                            <th data-field="content" data-formatter="operatFormatter2" data-events="operateEvents">内容</th>
                                            <th data-field="createTime">创建时间</th>
                                            <th data-field="createUser">创建人</th>
                                            <th data-field="updateTime">修改时间</th>
                                            <th data-field="" data-formatter="operatFormatter" data-events="operateEvents">操作</th>
                                        </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
    <!--底栏信息-->
    <div class="footer">
        <div class="footer-inner">
            <div class="footer-content">
                <span class="bigger-120">
                    <span class="blue bolder">rhtop.cn</span>
                    &copy; 2017-2018 &nbsp; &nbsp; All Rights Reserved
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
<#--<script src="/js/jquery-2.1.4.min.js"></script>-->
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

<script src="/js/bootstrap-table.min.js"></script>
<script src="/js/bootstrap-table-zh-CN.js"></script>
<script src="/js/rhtop.date.js"></script>
<script src="/js/bootbox.js"></script>


<script type="text/javascript">

    $('#table').bootstrapTable({
        url: '/config/list',
        pagination: true,
        pageSize: 10,
        sidePagination: 'server',
        method: 'get',
        queryParamsType: 'limit',
        //offsetField: 'pageIndex',
        limitField: 'pageSize',
        locale: 'zh-CN',
        queryParams: 'addQueryParams',
        buttonsClass: 'white',
        onRefreshOptions: function(options) {
            //console.log(options);
        }
    });


    var queryParamCache = {}
    function addQueryParams(params){

        params = $.extend(params, queryParamCache);

        return params;
    }

    /**
     * 刷新表格内容
     *
     */
    function refreshTable() {

        if($("#form-title").val() != "" ) {
            queryParamCache.title = encodeURI($.trim($("#form-title").val()));
        } else {
            delete queryParamCache.title;
        }


        if($("#form-groupName").val()!=""){
            queryParamCache.groupName = encodeURI($.trim($("#form-groupName").val()));
        } else {
            delete queryParamCache.groupName;
        }

        if($("#form-env").val()!=""){
            queryParamCache.env = encodeURI($.trim($("#form-env").val()));
        } else {
            delete queryParamCache.env;
        }

        $('#table').bootstrapTable('refreshOptions', {offset: 0, pageNumber: 1}); //通过这种方式在点击查询按钮时每次都能返回第一页

    }

    /*显示标题表格宽度*/
    function ellipsisFormatter(value, row, index){
        return ['<div class="ellipsis_title" title="'+value+'">'+value+'</div>'];
    }

    //调用： var time1 = new Date().Format("yyyy-MM-dd");var time2 = new Date().Format("yyyy-MM-dd HH:mm:ss");
    /*function dateFormatter(value, row, index){
        return value?(new Date(value).Format('yyyy-MM-dd hh:mm:ss')):'-';
    }*/
    /**
     * 定义 操作 列的格式
     * @param value
     * @param row
     * @param index
     * @returns {string}
     */
    function operatFormatter2(value, row, index) {
        if(row.account != 'root'){

            return [
                '<button class="see-row btn btn-minier btn-white btn-info" title="预览">预览</button>'
            ].join('<div style="width:5px; display:inline-block;" />');
        }
    }
    function operatFormatter(value, row, index) {
        if(row.account != 'root'){
            return [
                '<a class="edit-row btn btn-minier btn-white btn-info" href="/config/edit/'+row.id+'" title="编辑">编辑</a>',
                '<button class="delete-row btn btn-minier btn-white btn-info"  title="删除">删除</button>'
            ].join('<div style="width:5px; display:inline-block;" />');
        }
    }


    jQuery(function ($) {
        window.operateEvents = {
            'click .delete-row': function(e, value, row, index) {
                bootbox.confirm("确定删除吗？", function(result) {
                    if(result==true){
                        $.getJSON('/config/del/'+row.id, function(data) {

                            if(data.stat == "success"){
                                refreshTable();

                            } else {
                                bootbox.alert({
                                    message: "删除失败",
                                    callback: function () {
                                        window.location.href = "/config";
                                    }
                                })
                            }

                        });
                    }
                });

            },
//            news的预览功能
            'click .see-row': function (e, value, row, index) {
                $.getJSON('/config/get/' + row.id, function (data) {
                    if (data.content == undefined || data.content == null || data.content == '') {
                        bootbox.alert('暂无内容');
                        return false;
                    }
                    console.log('data.content=' + data.content);
                    var dialog = bootbox.dialog({
                        title: "内容预览",
                        message: '<div class="preview-table"><textarea style="width:100%; min-height: 200px; padding: 10px; line-height: 2em;" class="autosize-transition" readonly="true">' + data.content + '</textarea></div>'
                    });
                    dialog.init(function () {
                        dialog.find('bootbox-body').html('');
                    });


                    autosize($('textarea[class*=autosize]'));

                });
            }
        }
    });
</script>


<script type="text/javascript">
    jQuery(function ($) {
        $('#id-disable-check').on('click', function () {
            var inp = $('#form-input-readonly').get(0);
            if (inp.hasAttribute('disabled')) {
                inp.setAttribute('readonly', 'true');
                inp.removeAttribute('disabled');
                inp.value = "This text field is readonly!";
            }
            else {
                inp.setAttribute('disabled', 'disabled');
                inp.removeAttribute('readonly');
                inp.value = "This text field is disabled!";
            }
        });


        if ($('.sidebar').hasClass('menu-min')) {
            $('a[data-rel=tooltip]').tooltip({container: 'body'});
        }


        $('#id-file-format').removeAttr('checked').on('change', function () {
            var whitelist_ext, whitelist_mime;
            var btn_choose
            var no_icon
            if (this.checked) {
                btn_choose = "Drop images here or click to choose";
                no_icon = "ace-icon fa fa-picture-o";

                whitelist_ext = ["jpeg", "jpg", "png", "gif", "bmp"];
                whitelist_mime = ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"];
            }
            else {
                btn_choose = "Drop files here or click to choose";
                no_icon = "ace-icon fa fa-cloud-upload";

                whitelist_ext = null;
                whitelist_mime = null;
            }

            var file_input = $('#id-input-file-3');
            file_input
                    .ace_file_input('update_settings',
                            {
                                'btn_choose': btn_choose,
                                'no_icon': no_icon,
                                'allowExt': whitelist_ext,
                                'allowMime': whitelist_mime
                            })
            file_input.ace_file_input('reset_input');

            file_input
                    .off('file.error.ace')
                    .on('file.error.ace', function (e, info) {
                    });

        });


//				选择时间段
        $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true
        })
                .next().on(ace.click_event, function () {
            $(this).prev().focus();
        });

        $('.input-daterange').datepicker({autoclose: true});


        $('input[name=date-range-picker]').daterangepicker({
            'applyClass': 'btn-sm btn-success',
            'cancelClass': 'btn-sm btn-default',
            locale: {
                applyLabel: 'Apply',
                cancelLabel: 'Cancel',
            }
        })
                .prev().on(ace.click_event, function () {
            $(this).next().focus();
        });

        $.getJSON('/group/list', function (data) {
            //动态插入配置项
            $.each(data, function (i, g) {
                $('#form-groupName').append('<option value="'+g.groupName+'" >'+g.groupName+'</option>')
            });

            $('.chosen-select').chosen({allow_single_deselect:true});

        });
    });

</script>

</body>
</html>
