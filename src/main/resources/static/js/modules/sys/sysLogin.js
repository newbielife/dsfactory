/*!
 * Copyright (c) 2019-Now 大山食品厂 All rights reserved.
 *
 * @author gyc_lyz_ztm
 * @version 2019-11-11
 */
$("#username, #password").on("focus blur", function () {
    var a = this;
    setTimeout(function () {
        var b = $(a).css("borderColor");
        if (b != "") {
            $(a).prev().css("color", b)
        }
    }, 100)
}).blur();
//var verifyCode = new GVerify("imgCaptcha");
var userName = localStorage.getItem("username");
var password = localStorage.getItem("password");
if(userName){
    $("#username").val(userName);
    setTimeout(function() {
        $("#rememberUserCode").parent().addClass("checked");
    },200);
}
if(password){
    $("#password").val(password);
    setTimeout(function() {
        $("#rememberMe").parent().addClass("checked");
    },200);
}

//初始化键盘enter事件
$(document).keydown(function (event) {
    //兼容 IE和firefox 事件
    var e = window.event || event;
    var k = e.keyCode || e.which || e.charCode;
    //兼容 IE,firefox 兼容
    var obj = e.srcElement ? e.srcElement : e.target;
    //绑定键盘事件为 username 和password的输入框才可以触发键盘事件 13键盘事件
    if (k == "13" && (obj.id == "username" || obj.id == "password"))
        loginFun();
});

//登录按钮绑定处理事件
$('#btnSubmit').off("click").on("click", function () {
    var rememberUserCode = $("#rememberUserCode").parent().hasClass("checked");
    var rememberMe = $("#rememberMe").parent().hasClass("checked");
    localStorage.removeItem("username");
    localStorage.removeItem("password");
    if(rememberUserCode) {
        localStorage.setItem("username",$("#username").val());
    }
    if(rememberMe) {
        localStorage.setItem("username",$("#username").val());
        localStorage.setItem("password",$("#password").val());
    }
    loginFun();
});
//检测用户输入数据
function loginFun() {
    var username = $.trim($('#username').val());
    var password = $.trim($('#password').val());
    if (null == username || 0 == username.length) {
        $("#username").val("").focus();
        return;
    }

    if (null == password || 0 == password.length) {
        $("#password").val("").focus();
        return;
    }
    if (username != null && username.length != 0
        && password != null && password.length != 0) {
        $("#username").focus();
        //&&$("#validCode").val()
        //var res = verifyCode.validate($("#validCode").val());
        //注册按钮绑定处理事件
        $.ajax({
            type: "post",
            url: "/user/login",
            dataType: "json",
            data: ({
                loginame: username,
                password:  hex_md5(password)
            }),
            success: function (res) {
                if(res) {
                    var loginInfoTip = res.data.msgTip;
                    //用户名不存在，清空输入框并定位到用户名输入框
                    if (loginInfoTip.indexOf("staff is not exist") != -1) {
                        $("#username").val("").focus();
                        $("#password").val("");
                        alert("用户名不存在");
                        return;
                    }
                    else if (loginInfoTip.indexOf("staff password error") != -1) {
                        alert("用户密码错误");
                        return;
                    }
                    else if (loginInfoTip.indexOf("access service error") != -1) {
                        alert("后台访问错误");
                        return;
                    }
                    //跳转到用户管理界面
                    else if (loginInfoTip.indexOf("staff can login") != -1 || loginInfoTip == "staff already login") {
                        $.ajax({
                            type: "get",
                            url: "/user/getUserSession",
                            dataType: "json",
                            success: function (res) {
                                if(res && res.code === 200) {
                                    if(res.data.user) {
                                        var user = res.data.user;
                                        sessionStorage.setItem("userId", user.id);
                                        top.location.href = "/index.html";
                                    }
                                }
                            },
                            //此处添加错误处理
                            error: function () {
                                alert("后台访问错误，请联系管理员!!！");
                            }
                        });
                    }
                }
            },
            //此处添加错误处理
            error: function () {
                alert("后台访问错误，请联系管理员！");
            }
        });
    }
}