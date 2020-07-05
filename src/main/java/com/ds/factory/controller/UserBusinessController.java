package com.ds.factory.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ds.factory.constants.BusinessConstants;
import com.ds.factory.constants.ExceptionConstants;
import com.ds.factory.datasource.entities.Staff;
import com.ds.factory.datasource.entities.UserBusiness;
import com.ds.factory.exception.BusinessRunTimeException;
import com.ds.factory.service.Service.LogService;
import com.ds.factory.service.Service.StaffService;
import com.ds.factory.service.Service.UserBusinessService;
import com.ds.factory.utils.BaseResponseInfo;
import com.ds.factory.utils.ErpInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ds.factory.utils.ResponseJsonUtil.returnJson;

/**
 * @ 大山食品厂
 */
@RestController
@RequestMapping(value = "/userBusiness")
public class UserBusinessController {
    private Logger logger = LoggerFactory.getLogger(UserBusinessController.class);

    @Resource
    LogService logService;

    @Resource
    private UserBusinessService userBusinessService;

    @GetMapping(value = "/getBasicData")
    public BaseResponseInfo getBasicData(@RequestParam(value = "KeyId") String keyId,
                                         @RequestParam(value = "Type") String type,
                                         HttpServletRequest request)throws Exception {
        BaseResponseInfo res = new BaseResponseInfo();
        try {
            List<UserBusiness> list = userBusinessService.getBasicData(keyId, type);
            Map<String, List> mapData = new HashMap<String, List>();
            mapData.put("userBusinessList", list);
            res.code = 200;
            res.data = mapData;

            Staff sta=(Staff)request.getSession().getAttribute("user");
            logService.insertLog(BusinessConstants.LOG_MODULE_NAME_USER_BUSINESS,
                    new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                    ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        } catch (Exception e) {
            e.printStackTrace();
            res.code = 500;
            res.data = "查询权限失败";
        }
        return res;
    }

    @GetMapping(value = "/checkIsValueExist")
    public String checkIsValueExist(@RequestParam(value ="type", required = false) String type,
                                   @RequestParam(value ="keyId", required = false) String keyId,
                                   HttpServletRequest request)throws Exception {
        Map<String, Object> objectMap = new HashMap<String, Object>();
        Long id = userBusinessService.checkIsValueExist(type, keyId);
        if(id != null) {
            objectMap.put("id", id);
        } else {
            objectMap.put("id", null);
        }
        return returnJson(objectMap, ErpInfo.OK.name, ErpInfo.OK.code);
    }

    /**
     * 更新角色的按钮权限
     * @param userBusinessId
     * @param btnStr
     * @param request
     * @return
     */
    @PostMapping(value = "/updateBtnStr")
    public BaseResponseInfo updateBtnStr(@RequestParam(value ="userBusinessId", required = false) Long userBusinessId,
                                    @RequestParam(value ="btnStr", required = false) String btnStr,
                                    HttpServletRequest request)throws Exception {
        BaseResponseInfo res = new BaseResponseInfo();
        try {
            int back = userBusinessService.updateBtnStr(userBusinessId, btnStr);
            if(back > 0) {
                res.code = 200;
                res.data = "成功";
            }
            Staff sta=(Staff)request.getSession().getAttribute("user");
            logService.insertLog(BusinessConstants.LOG_MODULE_NAME_USER_BUSINESS,
                    new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_EDIT +"  按钮修改").append(", id: "+sta.getId()).toString(),
                    ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        } catch (Exception e) {
            e.printStackTrace();
            res.code = 500;
            res.data = "查询权限失败";
        }
        return res;
    }


    @RequestMapping(value = "/batchDeleteUserBusinessByIds")
    public Object batchDeleteUserBusinessByIds(@RequestParam("ids") String ids, HttpServletRequest request) throws Exception {

        JSONObject result = ExceptionConstants.standardSuccess();
        int i= userBusinessService.batchDeleteUserBusinessByIds(ids);
        if(i<1){
            logger.error("异常码[{}],异常提示[{}],参数,ids[{}]",
                    ExceptionConstants.USER_BUSINESS_DELETE_FAILED_CODE,ExceptionConstants.USER_BUSINESS_DELETE_FAILED_MSG,ids);
            throw new BusinessRunTimeException(ExceptionConstants.USER_BUSINESS_DELETE_FAILED_CODE,
                    ExceptionConstants.USER_BUSINESS_DELETE_FAILED_MSG);
        }
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_USER_BUSINESS,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_BATCH_delete).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }

    @PostMapping("/update")
    @ResponseBody
    public Object update(@RequestParam("info") String beanJson,@RequestParam("id") Long id, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        System.out.println(id);
        UserBusiness userBusiness= JSON.parseObject(beanJson, UserBusiness.class);
        userBusiness.setId(id);
        userBusinessService.updateSelective(userBusiness);
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_USER_BUSINESS,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_EDIT).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }
}
