package com.ds.factory.controller;

import com.ds.factory.datasource.entities.Staff;
import com.ds.factory.service.Service.StaffService;
import com.ds.factory.utils.BaseResponseInfo;
import com.ds.factory.utils.ExceptionCodeConstants;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;


@RestController
@RequestMapping(value = "/user")
public class UserController {

    @Resource
    private StaffService staffService;


    private static String message = "成功";
    private static final String HTTP = "http://";
    private static final String CODE_OK = "200";

    @PostMapping(value = "/login")
    public BaseResponseInfo login(@RequestParam(value = "loginame", required = false) String loginame,
                                  @RequestParam(value = "password", required = false) String password,
                                  HttpServletRequest request)throws Exception {
        String msgTip = "";
        Staff staff =null;
        BaseResponseInfo res = new BaseResponseInfo();
        try {
            String username = loginame.trim();
            password = password.trim();
            //判断用户是否已经登录过，登录过不再处理
            Object userInfo = request.getSession().getAttribute("staff");
            Staff sessionStaff = new Staff();
            if (userInfo != null) {
                sessionStaff = (Staff) userInfo;
            }
            if (sessionStaff != null && username.equalsIgnoreCase(sessionStaff.getLoginame())) {
                msgTip = "staff already login";
            }
            //获取用户状态
            int userStatus = -1;
            try {
                userStatus = staffService.validateUser(username, password);
            } catch (Exception e) {
                e.printStackTrace();
                msgTip = "access service exception";
            }
            switch (userStatus) {
                case ExceptionCodeConstants.UserExceptionCode.USER_NOT_EXIST:
                    msgTip = "staff is not exist";
                    break;
                case ExceptionCodeConstants.UserExceptionCode.USER_PASSWORD_ERROR:
                    msgTip = "staff password error";
                    break;
                case ExceptionCodeConstants.UserExceptionCode.BLACK_USER:
                    msgTip = "staff is black";
                    break;
                case ExceptionCodeConstants.UserExceptionCode.USER_ACCESS_EXCEPTION:
                    msgTip = "access service error";
                    break;
                default:
                    try {
                        msgTip = "staff can login";
                        staff=new Staff();
                        staff.setLoginame(loginame);
                        request.getSession().setAttribute("user", staff);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;
            }
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("msgTip", msgTip);
            /**
             * 在IE模式下，无法获取到user数据，
             * 在此处明确添加上user信息
             * */
            if(staff !=null){
                data.put("user", staff);
            }
            res.code = 200;
            res.data = data;
        } catch(Exception e){
            e.printStackTrace();
            res.code = 500;
            res.data = "用户登录失败";
        }
        return res;
    }

    @GetMapping(value = "/getUserSession")
    public @ResponseBody BaseResponseInfo getSessionUser(HttpServletRequest request)throws Exception {
        BaseResponseInfo res = new BaseResponseInfo();
        try {
            Map<String, Object> data = new HashMap<String, Object>();
            Object userInfo = request.getSession().getAttribute("user");
            if(userInfo!=null) {
                Staff user = (Staff) userInfo;
                user.setPassword(null);
                data.put("user", user);
            }
            res.code = 200;
            res.data = data;
        } catch(Exception e){
            e.printStackTrace();
            res.code = 500;
            res.data = "获取session失败";
        }
        return res;
    }

    @PostMapping(value = "/registerUser")
    public Object registerUser(@RequestParam(value = "loginame", required = false) String loginame,
                               @RequestParam(value = "password", required = false) String password,
                               HttpServletRequest request)throws Exception{
        BaseResponseInfo res = new BaseResponseInfo();
        boolean exist=staffService.checkLoginName(loginame); //检查用户名和登录名
        if (!exist){
            int state=staffService.Register_new_Staff(loginame,password);
            if(state==6){
                res.code=200;
                res.data=loginame;
            }else{
                res.code=500;
            }
        }else{
            res.code=500;
        }
        return res;
    }

    @GetMapping(value = "/getAllStaff")
    public @ResponseBody BaseResponseInfo getAllStaff(HttpServletRequest request)throws Exception {
        BaseResponseInfo res = new BaseResponseInfo();
        try {
            Map<String, Object> data = new HashMap<String, Object>();
            Object userInfo = request.getSession().getAttribute("user");
            if(userInfo!=null) {
                Staff user = (Staff) userInfo;
                user.setPassword(null);
                data.put("user", user);
            }
            res.code = 200;
            res.data = data;
        } catch(Exception e){
            e.printStackTrace();
            res.code = 500;
            res.data = "获取session失败";
        }
        return res;
    }

    @GetMapping(value = "/logout")
    public BaseResponseInfo logout(HttpServletRequest request, HttpServletResponse response)throws Exception {
        BaseResponseInfo res = new BaseResponseInfo();
        try {
            request.getSession().removeAttribute("user");
            response.sendRedirect("/login.html");
        } catch(Exception e){
            e.printStackTrace();
            res.code = 500;
            res.data = "退出失败";
        }
        return res;
    }

}
