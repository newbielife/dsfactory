//判断是否存在session，如果不存在就跳到登录界面
//# sourceURL=dynamicScript.js
$.ajax({
    type: "get",
    url: "/user/getUserSession",
    dataType: "json",
    async: false,
    success: function (res) {
        if(res && res.code === 200) {
            if(res.data.user.loginame) {
                var user = res.data.user;
                sessionStorage.setItem("userId", user.id);
                if (user.loginame) {
                    $(".main-header .user-menu .hidden-xs,.main-sidebar .info p").text(user.username);
                } else {
                    top.location.href = '/login.html';
                }
            } else {
                top.location.href = '/login.html';
            }
        }
    }
});