package com.ds.factory.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ds.factory.constants.ExceptionConstants;
import com.ds.factory.datasource.entities.*;
import com.ds.factory.service.Service.ClientService;
import com.ds.factory.service.Service.LogService;
import com.ds.factory.service.Service.Product_CriteriaService;
import com.ds.factory.service.Service.StaffService;
import com.ds.factory.utils.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;
import com.ds.factory.constants.BusinessConstants;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.ds.factory.utils.ResponseJsonUtil.returnJson;


@RestController
@RequestMapping(value = "/user")
public class UserController {
    private Logger logger = LoggerFactory.getLogger(UserController.class);

    @Resource
    private StaffService staffService;

    @Resource
    private LogService logService;

    @Resource
    private Product_CriteriaService product_criteriaService;

    private static String message = "成功";
    private static final String HTTP = "http://";
    private static final String CODE_OK = "200";

    @PostMapping(value = "/login")
    public BaseResponseInfo login(@RequestParam(value = "loginame", required = false) String loginame,
                                  @RequestParam(value = "password", required = false) String password,
                                  HttpServletRequest request)throws Exception {
        logger.info("============用户登录 login 方法调用开始==============");
        System.out.println(loginame+"      "+password);
        String msgTip = "";
        Staff user=null;
        BaseResponseInfo res = new BaseResponseInfo();
        try {
            String username = loginame.trim();
            password = password.trim();
            //判断用户是否已经登录过，登录过不再处理
            Object userInfo = request.getSession().getAttribute("user");
            Staff sessionUser = new Staff();
            if (userInfo != null) {
                sessionUser = (Staff) userInfo;
            }
            if (sessionUser != null && username.equalsIgnoreCase(sessionUser.getLoginame())) {
                logger.info("====用户 " + username + "已经登录过, login 方法调用结束====");
                msgTip = "user already login";
            }
            //获取用户状态
            int userStatus = -1;
            try {
                userStatus = staffService.validateUser(username, password);
            } catch (Exception e) {
                e.printStackTrace();
                logger.error(">>>>>>>>>>>>>用户  " + username + " 登录 login 方法 访问服务层异常====", e);
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
                        //验证通过 ，可以登录，放入session，记录登录日志
                        user = staffService.getStaffByLoginame(username);
                        request.getSession().setAttribute("user",user);
                        logService.insertLog(BusinessConstants.LOG_INTERFACE_NAME_USER,
                                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_LOGIN).append(user.getId()).toString(),
                                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
                    } catch (Exception e) {
                        e.printStackTrace();
                        logger.error(">>>>>>>>>>>>>>>查询用户名为:" + username + " ，用户信息异常", e);
                    }
                    break;
            }
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("msgTip", msgTip);
            /**
             * 在IE模式下，无法获取到user数据，
             * 在此处明确添加上user信息
             * */
            if(user!=null){
                data.put("user",user);
            }
            res.code = 200;
            res.data = data;
            logger.info("===============用户登录 login 方法调用结束===============");
        } catch(Exception e){
            e.printStackTrace();
            logger.error(e.getMessage());
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
            int state=staffService.Register_new_Staff(loginame,Tools.md5Encryp(password));
            if(state==1){
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
    public String getList(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
                          @RequestParam(value = Constants.CURRENT_PAGE, required = false) Integer currentPage,
                          @RequestParam(value = Constants.SEARCH, required = false) String search,
                          HttpServletRequest request)throws Exception {
        Map<String, String> parameterMap = new HashMap<String, String>();
        //查询参数
        JSONObject obj= JSON.parseObject(search);
        Set<String> key= obj.keySet();
        for(String keyEach: key){
            parameterMap.put(keyEach,obj.getString(keyEach));
        }
        String userName=parameterMap.get("userName");
        String loginName=parameterMap.get("loginName");
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        //List<Staff> list = staffService.selectByConstraint();
        List<Staff> list = staffService.selectByConstrain(userName,loginName);
        //获取分页查询后的数据
        PageInfo<Staff> pageInfo = new PageInfo<>(list);
        objectMap.put("page", queryInfo);
        if (list == null) {
            queryInfo.setRows(new ArrayList<Object>());
            queryInfo.setTotal(BusinessConstants.DEFAULT_LIST_NULL_NUMBER);
            return returnJson(objectMap, "查找不到数据", ErpInfo.OK.code);
        }
        queryInfo.setRows(list);
        queryInfo.setTotal(pageInfo.getTotal());
        return returnJson(objectMap, ErpInfo.OK.name, ErpInfo.OK.code);
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

    @GetMapping(value = "/loglist")
    public String loglist(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
                          @RequestParam(value = Constants.CURRENT_PAGE, required = false) Integer currentPage,
                          @RequestParam(value = Constants.SEARCH, required = false) String search
                          )throws Exception {
        Map<String, String> parameterMap = new HashMap<String, String>();
        //查询参数
        JSONObject obj= JSON.parseObject(search);
        Set<String> key= obj.keySet();
        for(String keyEach: key){
            parameterMap.put(keyEach,obj.getString(keyEach));
        }
        String operation=obj.getString("operation")==null?"":obj.getString("operation").trim();
        String clientIp=obj.getString("clientIp")==null?"":obj.getString("clientIp").trim();
        String status=obj.getString("status")==null?"":obj.getString("status").trim();
        Date begin=obj.getDate("beginTime")==null||(obj.getDate("beginTime")+"").compareTo("")==0?null:obj.getDate("beginTime");
        Date end=obj.getDate("endTime")==null||(obj.getDate("endTime")+"").compareTo("")==0?null:obj.getDate("endTime");

        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Log> list = logService.selectByConstrain(operation,clientIp,status,begin,end);

        List<Log2> list2=new ArrayList<Log2>();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       // String str1 = sdf1.format(date);
        for(int i=0;i<list.size();i++)
        {
            Log2 log=new Log2();
            log.setId(list.get(i).getId());
            log.setClientip(list.get(i).getClientip());
            log.setContentdetails(list.get(i).getContentdetails());
            log.setCreatetime(list.get(i).getCreatetime()==null?"登录有误":sdf1.format(list.get(i).getCreatetime()));
            log.setOperation(list.get(i).getOperation());
            log.setRemark(list.get(i).getRemark());
            log.setStatus(list.get(i).getStatus());
            log.setTenantId(list.get(i).getTenantId());
            log.setUserid(list.get(i).getUserid());
            list2.add(log);
        }


        //获取分页查询后的数据
        PageInfo<Log2> pageInfo = new PageInfo<>(list2);
        objectMap.put("page", queryInfo);
        if (list2 == null) {
            queryInfo.setRows(new ArrayList<Object>());
            queryInfo.setTotal(BusinessConstants.DEFAULT_LIST_NULL_NUMBER);
            return returnJson(objectMap, "查找不到数据", ErpInfo.OK.code);
        }
        queryInfo.setRows(list2);
        queryInfo.setTotal(pageInfo.getTotal());
        return returnJson(objectMap, ErpInfo.OK.name, ErpInfo.OK.code);
    }



    @GetMapping(value = "/unitlist")
    public String unitlist(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
                          @RequestParam(value = Constants.CURRENT_PAGE, required = false) Integer currentPage,
                          @RequestParam(value = Constants.SEARCH, required = false) String search)throws Exception {
        Map<String, String> parameterMap = new HashMap<String, String>();
        //查询参数
        JSONObject obj= JSON.parseObject(search);
        Set<String> key= obj.keySet();
        for(String keyEach: key){
            parameterMap.put(keyEach,obj.getString(keyEach));
        }

        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Unit> list = product_criteriaService.SelectUnit();
        System.out.println(list.get(0));
        //获取分页查询后的数据
        PageInfo<Unit> pageInfo = new PageInfo<>(list);
        objectMap.put("page", queryInfo);
        if (list == null) {
            queryInfo.setRows(new ArrayList<Object>());
            queryInfo.setTotal(BusinessConstants.DEFAULT_LIST_NULL_NUMBER);
            return returnJson(objectMap, "查找不到数据", ErpInfo.OK.code);
        }
        queryInfo.setRows(list);
        queryInfo.setTotal(pageInfo.getTotal());
        return returnJson(objectMap, ErpInfo.OK.name, ErpInfo.OK.code);
    }

    @PostMapping("/addUser")
    @ResponseBody
    public Object addUser(@RequestParam("info") String beanJson, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Staff sta= JSON.parseObject(beanJson, Staff.class);
        sta.setPassword("e10adc3949ba59abbe56e057f20f883e");
        staffService.insertSelective(sta);
        return result;
    }

    @PostMapping("/batchDeleteUser")
    @ResponseBody
    public Object batchDeleteClientByIds(@RequestParam("ids") String ids)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        String[] id=ids.split(",");
        for(int i=0;i<id.length;i++)
        {
            staffService.deleteByPrimaryKey(id[i].trim());
        }
        return result;
    }

}
