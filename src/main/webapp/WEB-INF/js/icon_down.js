$(document).ready(function(){
	$(".sidebar .nav-list li").click(function(){

		var $sidebar = $('.sidebar');
		var $this = $(this);

		var a = $this.find('a.dropdown-toggle');
		var i = a.children("i");

		//首先判断当前sidebar是否为折叠状态
		if($sidebar.hasClass('menu-min')){ //sidebar折叠状态
			if(i.hasClass('fa-caret-down')){ //子菜单LI展开状态
				i.removeClass('fa-caret-down').addClass('fa-caret-right');
				a.parent().children('ul').hide();
			} else {
				i.removeClass('fa-caret-right').addClass('fa-caret-down');
				a.parent().children('.submenu').show();
			}

		} else { //sidebar展开状态
			if($this.hasClass('open')){//子菜单LI展开状态
				i.removeClass('fa-caret-down').addClass('fa-caret-right');
			}else{
				i.removeClass('fa-caret-right').addClass('fa-caret-down');
			}
		}

	});
});