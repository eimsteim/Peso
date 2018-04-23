<#macro navbar>
<div id="navbar" class="navbar navbar-default ace-save-state navbar-fixed-top">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <div class="navbar-header pull-left" id="navbar-brand-wrapper">
            <a href="/index" class="navbar-brand">
                <small>
                    <#--<i class="fa fa-leaf rh-logo"></i>-->
                    <span class="title">
                        Peso
                    </span>
                </small>
            </a>
            <#--<#list permission as perm>-->
            <#--<a href="javascript:void(0);" class="navbar-brand rh-module" module="${perm.no}">-->
                <#--<small>-->
                    <#--<span class="title">-->
                        <#--${perm.menuName}-->
                    <#--</span>-->
                <#--</small>-->
            <#--</a>-->
            <#--</#list>-->
        </div>
        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue dropdown-modal">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <!--<img class="nav-user-photo" src="/images/avatars/user.jpg" alt="Jason's Photo" />-->
                        <span class="user-info">
                            <#--${user.username}-->
                        </span>
                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>
                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                       <#-- <li>
                            <a href="#">
                                <i class="ace-icon fa fa-cog"></i>
                                Settings
                            </a>
                        </li>-->
                        <li>
                            <a href="/modifyUserPassWord">
                                <i class="ace-icon fa fa-user"></i>
                                修改密码
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="/logout">
                                <i class="ace-icon fa fa-power-off"></i>
                                退出登录
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div><!-- /.navbar-container -->
</div>

<script>
    $(document).ready(function () {

        $('#navbar-brand-wrapper').on('click', '.rh-module', function(){
            var permNo = $(this).attr('module');
            $.cookie('extrade_back_menu_no', permNo, {expires: 1});
        });

    });

</script>
</#macro>