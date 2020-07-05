package com.ds.factory.service.Service;

import com.alibaba.fastjson.JSONObject;
import com.ds.factory.constants.BusinessConstants;
import com.ds.factory.datasource.entities.Log;
import com.ds.factory.dao.Example.LogExample;
import com.ds.factory.datasource.entities.Staff;
import com.ds.factory.datasource.mappers.LogMapper;
import com.ds.factory.datasource.mappers.LogMapperEx;
import com.ds.factory.datasource.vo.LogVo4List;
import com.ds.factory.exception.DSException;
import com.ds.factory.utils.StringUtil;
import com.ds.factory.utils.Tools;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

import static com.ds.factory.utils.Tools.getLocalIp;


@Service
public class LogService {
    private Logger logger = LoggerFactory.getLogger(LogService.class);
    @Resource
    private LogMapper logMapper;

    @Resource
    private LogMapperEx logMapperEx;

    public List<Log> selectByConstrain(String operation,String clientIP,String Status,Date begin,Date end){
        if(begin==null||end==null)
        {
            if(Status.trim().compareTo("")==0)
                return logMapper.selectByAll_noDate(operation.trim(),clientIP.trim());
            else if(Status.trim().compareTo("失败")==0)
                return logMapper.selectByFailed_noDate(operation.trim(),clientIP.trim());
            else if(Status.trim().compareTo("成功")==0)
                return logMapper.selectBySuccess_noDate(operation.trim(),clientIP.trim());
        }
        else{
            if(Status.trim().compareTo("")==0)
                return logMapper.selectByAll(operation.trim(),clientIP.trim(),begin,end);
            else if(Status.trim().compareTo("失败")==0)
                return logMapper.selectByFailed(operation.trim(),clientIP.trim(),begin,end);
            else if(Status.trim().compareTo("成功")==0)
                return logMapper.selectBySuccess(operation.trim(),clientIP.trim(),begin,end);
        }
        return null;
    }





    public Log getLog(long id)throws Exception {
        Log result=null;
        try{
            result=logMapper.selectByPrimaryKey(id);
        }catch(Exception e){
            DSException.readFail(logger, e);
        }
        return result;
    }

    public List<Log> getLog()throws Exception {
        LogExample example = new LogExample();
        List<Log> list=null;
        try{
            list=logMapper.selectByExample(example);
        }catch(Exception e){
            DSException.readFail(logger, e);
        }
        return list;
    }

    public List<LogVo4List> select(String operation, Integer usernameID, String clientIp, Integer status, String beginTime, String endTime,
                                   String contentdetails, int offset, int rows)throws Exception {
        List<LogVo4List> list=null;
        try{
            list=logMapperEx.selectByConditionLog(operation, usernameID, clientIp, status, beginTime, endTime,
                    contentdetails, offset, rows);
            if (null != list) {
                for (LogVo4List log : list) {
                    log.setCreateTimeStr(Tools.getCenternTime(log.getCreatetime()));
                }
            }
        }catch(Exception e){
            DSException.readFail(logger, e);
        }
        return list;
    }

    public Long countLog(String operation, Integer usernameID, String clientIp, Integer status, String beginTime, String endTime,
                        String contentdetails)throws Exception {
        Long result=null;
        try{
            result=logMapperEx.countsByLog(operation, usernameID, clientIp, status, beginTime, endTime, contentdetails);
        }catch(Exception e){
            DSException.readFail(logger, e);
        }
        return result;
    }

    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public int insertLog(String beanJson, HttpServletRequest request) throws Exception{
        Log log = JSONObject.parseObject(beanJson, Log.class);
        int result=0;
        try{
            result=logMapper.insertSelective(log);
        }catch(Exception e){
            DSException.writeFail(logger, e);
        }
        return result;
    }

    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public int updateLog(String beanJson, Long id)throws Exception {
        Log log = JSONObject.parseObject(beanJson, Log.class);
        log.setId(id);
        int result=0;
        try{
            result=logMapper.updateByPrimaryKeySelective(log);
        }catch(Exception e){
            DSException.writeFail(logger, e);
        }
        return result;
    }

    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public int deleteLog(Long id)throws Exception {
        int result=0;
        try{
            result=logMapper.deleteByPrimaryKey(id);
        }catch(Exception e){
            DSException.writeFail(logger, e);
        }
        return result;
    }

    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public int batchDeleteLog(String ids)throws Exception {
        List<Long> idList = StringUtil.strToLongList(ids);
        LogExample example = new LogExample();
        example.createCriteria().andIdIn(idList);
        int result=0;
        try{
            result=logMapper.deleteByExample(example);
        }catch(Exception e){
            DSException.writeFail(logger, e);
        }
        return result;
    }

    /**
     * 获取用户id
     * @param request
     * @return
     */
    public Long getUserId(HttpServletRequest request) throws Exception{
        Object userInfo = request.getSession().getAttribute("user");
        if(userInfo!=null) {
            Staff user = (Staff) userInfo;
            return user.getId();
        } else {
            return null;
        }
    }

    public String getModule(String apiName)throws Exception{
        String moduleName = null;
        switch (apiName) {
            case BusinessConstants.LOG_INTERFACE_NAME_USER:
                moduleName = BusinessConstants.LOG_MODULE_NAME_USER; break;
            case BusinessConstants.LOG_INTERFACE_NAME_ROLE:
                moduleName = BusinessConstants.LOG_MODULE_NAME_ROLE; break;
            case BusinessConstants.LOG_INTERFACE_NAME_APP:
                moduleName =BusinessConstants.LOG_MODULE_NAME_APP; break;
            case BusinessConstants.LOG_INTERFACE_NAME_DEPOT:
                moduleName = BusinessConstants.LOG_MODULE_NAME_DEPOT; break;
            case BusinessConstants.LOG_INTERFACE_NAME_FUNCTIONS:
                moduleName = BusinessConstants.LOG_MODULE_NAME_FUNCTIONS; break;
            case BusinessConstants.LOG_INTERFACE_NAME_IN_OUT_ITEM:
                moduleName = BusinessConstants.LOG_MODULE_NAME_IN_OUT_ITEM; break;
            case BusinessConstants.LOG_INTERFACE_NAME_UNIT:
                moduleName = BusinessConstants.LOG_MODULE_NAME_UNIT; break;
            case BusinessConstants.LOG_INTERFACE_NAME_PERSON:
                moduleName = BusinessConstants.LOG_MODULE_NAME_PERSON; break;
            case BusinessConstants.LOG_INTERFACE_NAME_USER_BUSINESS:
                moduleName = BusinessConstants.LOG_MODULE_NAME_USER_BUSINESS; break;
            case BusinessConstants.LOG_INTERFACE_NAME_SYSTEM_CONFIG:
                moduleName = BusinessConstants.LOG_MODULE_NAME_SYSTEM_CONFIG; break;
            case BusinessConstants.LOG_INTERFACE_NAME_MATERIAL_PROPERTY:
                moduleName = BusinessConstants.LOG_MODULE_NAME_MATERIAL_PROPERTY; break;
            case BusinessConstants.LOG_INTERFACE_NAME_ACCOUNT:
                moduleName = BusinessConstants.LOG_MODULE_NAME_ACCOUNT; break;
            case BusinessConstants.LOG_INTERFACE_NAME_client:
                moduleName = BusinessConstants.LOG_MODULE_NAME_client; break;
            case BusinessConstants.LOG_INTERFACE_NAME_MATERIAL_CATEGORY:
                moduleName = BusinessConstants.LOG_MODULE_NAME_MATERIAL_CATEGORY; break;
            case BusinessConstants.LOG_INTERFACE_NAME_MATERIAL:
                moduleName = BusinessConstants.LOG_MODULE_NAME_MATERIAL; break;
            case BusinessConstants.LOG_INTERFACE_NAME_DEPOT_HEAD:
                moduleName = BusinessConstants.LOG_MODULE_NAME_DEPOT_HEAD; break;
            case BusinessConstants.LOG_INTERFACE_NAME_DEPOT_ITEM:
                moduleName = BusinessConstants.LOG_MODULE_NAME_DEPOT_ITEM; break;
            case BusinessConstants.LOG_INTERFACE_NAME_ACCOUNT_HEAD:
                moduleName = BusinessConstants.LOG_MODULE_NAME_ACCOUNT_HEAD; break;
            case BusinessConstants.LOG_INTERFACE_NAME_ACCOUNT_ITEM:
                moduleName = BusinessConstants.LOG_MODULE_NAME_ACCOUNT_ITEM; break;
            case BusinessConstants.LOG_INTERFACE_NAME_SERIAL_NUMBER:
                moduleName = BusinessConstants.LOG_MODULE_NAME_SERIAL_NUMBER; break;
            case BusinessConstants.LOG_INTERFACE_NAME_ORGANIZATION:
                moduleName = BusinessConstants.LOG_MODULE_NAME_ORGANIZATION; break;
            case BusinessConstants.LOG_MODULE_NAME_ORDER:
                moduleName = BusinessConstants.LOG_MODULE_NAME_ORDER; break;
            case BusinessConstants.LOG_MODULE_NAME_PAYMENT:
                moduleName = BusinessConstants.LOG_MODULE_NAME_PAYMENT; break;
            case BusinessConstants.LOG_MODULE_NAME_WAREHOUSE:
                moduleName = BusinessConstants.LOG_MODULE_NAME_WAREHOUSE; break;
            case BusinessConstants.LOG_MODULE_NAME_PRODUCT_WAREHOUSE:
                moduleName = BusinessConstants.LOG_MODULE_NAME_PRODUCT_WAREHOUSE; break;
            case BusinessConstants.LOG_MODULE_NAME_MATERIALS_WAREHOUSE:
                moduleName = BusinessConstants.LOG_MODULE_NAME_MATERIALS_WAREHOUSE; break;
            case BusinessConstants.LOG_MODULE_NAME_EXPIRED:
                moduleName = BusinessConstants.LOG_MODULE_NAME_EXPIRED; break;
            case BusinessConstants.LOG_MODULE_NAME_MANUFACTURE:
                moduleName = BusinessConstants.LOG_MODULE_NAME_MANUFACTURE; break;
            case BusinessConstants.LOG_MODULE_NAME_MANUFACTURE_RESULT:
                moduleName = BusinessConstants.LOG_MODULE_NAME_MANUFACTURE_RESULT; break;
            case BusinessConstants.LOG_MODULE_NAME_PRODUCT_CRITERIA:
                moduleName = BusinessConstants.LOG_MODULE_NAME_PRODUCT_CRITERIA; break;
            case BusinessConstants.LOG_MODULE_NAME_PURCHASE:
                moduleName = BusinessConstants.LOG_MODULE_NAME_PURCHASE; break;
            case BusinessConstants.LOG_MODULE_NAME_INGREDIENT:
                moduleName = BusinessConstants.LOG_MODULE_NAME_INGREDIENT; break;
            case BusinessConstants.LOG_MODULE_NAME_EXPORT:
                moduleName = BusinessConstants.LOG_MODULE_NAME_EXPORT; break;
            case BusinessConstants.LOG_MODULE_NAME_REFUND:
                moduleName = BusinessConstants.LOG_MODULE_NAME_REFUND; break;

        }
        return moduleName;
    }

    public void insertLog(String apiName, String type, HttpServletRequest request)throws Exception{
        Log log = new Log();
        log.setUserid(getUserId(request));
        log.setOperation(getModule(apiName));
        log.setClientip(getLocalIp(request));
        log.setCreatetime(new Date());
        Byte status = 0;
        log.setStatus(status);
        log.setContentdetails(type + getModule(apiName));
        log.setRemark(type + getModule(apiName));
//        System.out.print(apiName);
        System.out.print(type);
//        System.out.print(getUserId(request));
        try{
            log.setOperation(apiName);
            logMapper.insertSelective(log);
            System.out.println(log.toString());
        }catch(Exception e){
            DSException.writeFail(logger, e);
        }

    }

}
