package com.ds.factory.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ds.factory.constants.BusinessConstants;
import com.ds.factory.constants.ExceptionConstants;
import com.ds.factory.datasource.entities.Role;
import com.ds.factory.exception.BusinessRunTimeException;
import com.ds.factory.service.Service.RoleService;
import com.ds.factory.service.Service.UserBusinessService;
import com.ds.factory.utils.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }

    @GetMapping(value = "/list")
    public List<Role> list(HttpServletRequest request)throws Exception {
        return roleService.getRole();
    }

    @RequestMapping(value = "/batchDeleteRoleByIds")
    public Object batchDeleteRoleByIds(@RequestParam("ids") String ids) throws Exception {
        JSONObject result = ExceptionConstants.standardSuccess();
        int i= roleService.batchDeleteRoleByIds(ids);
        if(i<1){
            logger.error("异常码[{}],异常提示[{}],参数,ids[{}]",
                    ExceptionConstants.ROLE_DELETE_FAILED_CODE,ExceptionConstants.ROLE_DELETE_FAILED_MSG,ids);
            throw new BusinessRunTimeException(ExceptionConstants.ROLE_DELETE_FAILED_CODE,
                    ExceptionConstants.ROLE_DELETE_FAILED_MSG);
        }
        return result;
    }

    @GetMapping(value = "/getAllRole")
    public String getList(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
                          @RequestParam(value = Constants.CURRENT_PAGE, required = false) Integer currentPage,
                          @RequestParam(value = Constants.SEARCH, required = false) String search,
                          HttpServletRequest request)throws Exception {
        Map<String, String> parameterMap = ParamUtils.requestToMap(request);
        parameterMap.put(Constants.SEARCH, search);
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize != null && pageSize <= 0) {
            pageSize = 10;
        }
        String offset = ParamUtils.getPageOffset(currentPage, pageSize);
        if (StringUtil.isNotEmpty(offset)) {
            parameterMap.put(Constants.OFFSET, offset);
        }
        List<?> list = roleService.getRole();
        objectMap.put("page", queryInfo);
        if (list == null) {
            queryInfo.setRows(new ArrayList<Object>());
            queryInfo.setTotal(BusinessConstants.DEFAULT_LIST_NULL_NUMBER);
            return returnJson(objectMap, "查找不到数据", ErpInfo.OK.code);
        }
        queryInfo.setRows(list);
        System.out.println("************************s"+list.get(0));
        return returnJson(objectMap, ErpInfo.OK.name, ErpInfo.OK.code);
    }

}
