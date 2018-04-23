<#--
    边栏的macro宏，可直接在需要的页面引入，并传入menu参数来确定当前菜单。
    具体用法：
    <@sidebar menu='order_list' />
    注意事项：
    1. JS脚本依赖jQuery，请保证在父页面引入了jq，
    2. 由于绝大多数情况下，一个页面只需要一个边栏，因此暂不支持多导入，请保证每个页面只有一个@sidebar
-->
<#macro sidebar menu>
<script>
    $(document).ready(function () {
        var curr_menu_id = '${menu}';
        var curr_menu = document.getElementById(curr_menu_id);
        //展开sidebar菜单 
        if(curr_menu) {
            $(curr_menu).addClass('active')
                    .parent('ul.submenu').css('display', 'block');
            $(curr_menu).parent('ul.submenu').parent('li').addClass('open');
            $(curr_menu).parent('ul.submenu').siblings('a')
                    .children('.fa-caret-right').removeClass('fa-caret-right').addClass('fa-caret-down');
        }
    })
</script>
<div id="sidebar" class="sidebar   responsive   ace-save-state"
     style="position: fixed;top: 44px;float: none!important;z-index: 1027;">
    <script type="text/javascript">
        try {
            ace.settings.loadState('sidebar')
        } catch (e) {
        }
    </script>
    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <!--<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left glyphicon-th-list" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>-->
        <i id="sidebar-toggle-icon" class="ace-icon glyphicon glyphicon-align-justify"
           style="border: none;border-radius: 0;"></i>
    </div>
    <ul class="nav nav-list">
        <#--<li>-->
            <#--<a href="/console/index" class="tooltip-success" data-rel="tooltip" data-placement="right"-->
               <#--title="Dashboard">-->
                <#--<i class="menu-icon fa fa-tachometer"></i>-->
                <#--<span class="menu-text"> Dashboard </span>-->
            <#--</a>-->
            <#--<b class="arrow"></b>-->
        <#--</li>-->
        <li id="" class="">
            <a id="" href="#" class="dropdown-toggle tooltip-success" data-rel="tooltip"
               data-placement="right" title="配置管理">
                <i class="menu-icon fa fa-caret-right"></i>
                <span class="menu-text">
                    配置中心
                </span>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li id="config_list" class="">
                    <a href="/config" class="tooltip-success" data-rel="tooltip" data-placement="right"
                       title="配置列表">
                        <i class="menu-icon fa fa-connectdevelop"></i>
                        <span class="menu-text">配置管理</span>
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
    </ul>
</div>
</#macro>