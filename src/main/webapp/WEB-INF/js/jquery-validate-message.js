/**
 * Created by admin on 2017/3/18.
 */
    //扩展提示信息
    $.extend($.validator.messages, {
        required: "必填字段",
        number: "请输入合法的数字",
        remote: "请修正该字段",
        email: "请输入正确格式的电子邮件",
        url: "请输入合法的网址",
        date: "请输入合法的日期",
        dateISO: "请输入合法的日期 (ISO).",
        digits: "只能输入整数",
        creditcard: "请输入合法的信用卡号",
        equalTo: "请再次输入相同的值",
        accept: "请输入拥有合法后缀名的字符串",
        maxlength: $.validator.format("请输入一个长度最多是 {0} 的字符串"),
        minlength: $.validator.format("请输入一个长度最少是 {0} 的字符串"),
        rangelength: $.validator.format("请输入一个长度介于 {0} 和 {1} 之间的字符串"),
        range: $.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
        max: $.validator.format("请输入一个最大为 {0} 的值"),
        min: $.validator.format("请输入一个最小为 {0} 的值")
    });
    //封装函数校验非法字符和非空字符
    var funcCollection={
        "checkRegex":function(paramName) {
            jQuery.validator.addMethod("regex", function (value, paramName, params) {  //扩展方法示例:　　　　　　　　　　　
                var exp = new RegExp(params);//params rules的value传入的正则表达式
                var rs = "";                 //value  被验证的input传入的值
                for (var i = 0; i < value.length; i++) {
                    rs = rs + value.substr(i, 1).replace(exp, '');
                }
                var regu = "^[ ]+$";
                var re = new RegExp(regu);
                if (value.length != rs.length || re.test(value)) {
                    return false;
                }
                return true;
            }, "请勿输入非法字符");
        }
        //回调函数
        //"function3":function(callback){
        //    var param=56;
        //    callback(param);
        //}
    };
