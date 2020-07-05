package com.ds.factory.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ds.factory.constants.BusinessConstants;
import com.ds.factory.constants.ExceptionConstants;
import com.ds.factory.datasource.entities.Product_Warehouse;
import com.ds.factory.datasource.entities.Role;
import com.ds.factory.datasource.entities.Staff;
import com.ds.factory.exception.BusinessRunTimeException;
import com.ds.factory.service.Service.LogService;
import com.ds.factory.service.Service.RoleService;
import com.ds.factory.service.Service.UserBusinessService;
import com.ds.factory.utils.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

import static com.ds.factory.utils.ResponseJsonUtil.returnJson;

/**
 * @author gyc_lyz_ztm
 */
@RestController
@RequestMapping(value = "/role")
public class RoleController {
    private Logger logger = LoggerFactory.getLogger(RoleController.class);

    @Resource
    private RoleService roleService;

    @Resource
    private UserBusinessService userBusinessService;

    @Resource
    LogService logService;
    /**
     * 角色对应应用显示
     * @param request
     * @return
     */
    @PostMapping(value = "/findUserRole")
    public JSONArray findUserRole(@RequestParam("UBType") String type, @RequestParam("UBKeyId") String keyId,
                                  HttpServletRequest request)throws Exception {
        JSONArray arr = new JSONArray();
        try {
            List<Role> dataList = roleService.findUserRole();
            if (null != dataList) {
                for (Role role : dataList) {
                    JSONObject item = new JSONObject();
                    item.put("id", role.getId());
                    item.put("text", role.getName());
                    //勾选判断1
                    Boolean flag = false;
                    try {
                        flag = userBusinessService.checkIsUserBusinessExist(type, keyId, "[" + role.getId().toString() + "]");
                    } catch (Exception e) {
                        logger.error(">>>>>>>>>>>>>>>>>设置用户对应的角色：类型" + type + " KeyId为： " + keyId + " 存在异常！");
                    }
                    if (flag == true) {
                        item.put("checked", true);
                    }
                    arr.add(item);
                }
            }

            Staff sta=(Staff)request.getSession().getAttribute("user");
            logService.insertLog(BusinessConstants.LOG_MODULE_NAME_ROLE,
                    new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                    ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }

    @GetMapping(value = "/list")
    public List<Role> list(HttpServletRequest request)throws Exception {
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_ROLE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());

        return roleService.getRole();
    }

    @RequestMapping(value = "/batchDeleteRoleByIds")
    public Object batchDeleteRoleByIds(@RequestParam("ids") String ids, HttpServletRequest request) throws Exception {
        JSONObject result = ExceptionConstants.standardSuccess();
        int i= roleService.batchDeleteRoleByIds(ids);
        if(i<1){
            logger.error("异常码[{}],异常提示[{}],参数,ids[{}]",
                    ExceptionConstants.ROLE_DELETE_FAILED_CODE,ExceptionConstants.ROLE_DELETE_FAILED_MSG,ids);
            throw new BusinessRunTimeException(ExceptionConstants.ROLE_DELETE_FAILED_CODE,
                    ExceptionConstants.ROLE_DELETE_FAILED_MSG);
        }
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_ROLE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_BATCH_delete).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }

    @GetMapping(value = "/getAllRole")
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
        String searchName=parameterMap.get("searchName");
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Role> list = roleService.getRole();
        //获取分页查询后的数据
        PageInfo<Role> pageInfo = new PageInfo<>(list);
        objectMap.put("page", queryInfo);
        if (list == null) {
            queryInfo.setRows(new ArrayList<Object>());
            queryInfo.setTotal(BusinessConstants.DEFAULT_LIST_NULL_NUMBER);
            return returnJson(objectMap, "查找不到数据", ErpInfo.OK.code);
        }
        queryInfo.setRows(list);
        queryInfo.setTotal(pageInfo.getTotal());

        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_ROLE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return returnJson(objectMap, ErpInfo.OK.name, ErpInfo.OK.code);
    }


    @PostMapping("/add")
    @ResponseBody
    public Object add(@RequestParam("info") String beanJson, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Role role= JSON.parseObject(beanJson, Role.class);
        roleService.insert___(role);
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_ROLE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_ADD).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }


    @PostMapping("/update")
    @ResponseBody
    public Object update(@RequestParam("info") String beanJson,@RequestParam("id") Long id, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Role role= JSON.parseObject(beanJson, Role.class);
        role.setId(id);
        roleService.update___(role);
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_ROLE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_EDIT).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }


}
