package com.ds.factory.service.Service;


import com.alibaba.fastjson.JSONObject;
import com.ds.factory.constants.BusinessConstants;
import com.ds.factory.datasource.entities.Functions;
import com.ds.factory.dao.Example.FunctionsExample;
import com.ds.factory.datasource.entities.Staff;
import com.ds.factory.datasource.mappers.FunctionsMapper;
import com.ds.factory.datasource.mappers.FunctionsMapperEx;
import com.ds.factory.exception.DSException;
import com.ds.factory.utils.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public class FunctionsService {
    private Logger logger = LoggerFactory.getLogger(FunctionsService.class);

    @Resource
    private FunctionsMapper functionsMapper;

    @Resource
    private FunctionsMapperEx functionsMapperEx;
    @Resource
    private  StaffService staffService;
    @Resource
    private LogService logService;

    public Functions getFunctions(long id)throws Exception {
        Functions result=null;
        try{
            result=functionsMapper.selectByPrimaryKey(id);
        }catch(Exception e){
            DSException.readFail(logger, e);
        }
        return result;
    }

    public List<Functions> getFunctions()throws Exception {
        FunctionsExample example = new FunctionsExample();
        example.createCriteria().andDeleteFlagNotEqualTo(BusinessConstants.DELETE_FLAG_DELETED);
        List<Functions> list=null;
        try{
            list=functionsMapper.selectByExample(example);
        }catch(Exception e){
            DSException.readFail(logger, e);
        }
        return list;
    }

    public List<Functions> select(String name, String type, int offset, int rows)throws Exception {
        List<Functions> list=null;
        try{
            list=functionsMapperEx.selectByConditionFunctions(name, type, offset, rows);
        }catch(Exception e){
            DSException.readFail(logger, e);
        }
        return list;
    }

    public Long countFunctions(String name, String type)throws Exception {
        Long result=null;
        try{
            result=functionsMapperEx.countsByFunctions(name, type);
        }catch(Exception e){
            DSException.readFail(logger, e);
        }
        return result;
    }

    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public int insertFunctions(String beanJson, HttpServletRequest request)throws Exception {
        Functions depot = JSONObject.parseObject(beanJson, Functions.class);
        int result=0;
        try{
            result=functionsMapper.insertSelective(depot);
        }catch(Exception e){
            DSException.writeFail(logger, e);
        }
        return result;
    }

    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public int updateFunctions(String beanJson, Long id) throws Exception{
        Functions depot = JSONObject.parseObject(beanJson, Functions.class);
        depot.setId(id);
        int result=0;
        try{
            result=functionsMapper.updateByPrimaryKeySelective(depot);
        }catch(Exception e){
            DSException.writeFail(logger, e);
        }
        return result;
    }

    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public int deleteFunctions(Long id)throws Exception {
        int result=0;
        try{
            result=functionsMapper.deleteByPrimaryKey(id);
        }catch(Exception e){
            DSException.writeFail(logger, e);
        }
        return result;
    }

    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public int batchDeleteFunctions(String ids)throws Exception {
        List<Long> idList = StringUtil.strToLongList(ids);
        FunctionsExample example = new FunctionsExample();
        example.createCriteria().andIdIn(idList);
        int result=0;
        try{
            result=functionsMapper.deleteByExample(example);
        }catch(Exception e){
            DSException.writeFail(logger, e);
        }
        return result;
    }


    public List<Functions>selectByConstrain(String Name,String no){
        return functionsMapper.selectByConstrain(Name,no);
    }


    public int checkIsNameExist(Long id, String name)throws Exception {
        FunctionsExample example = new FunctionsExample();
        example.createCriteria().andIdNotEqualTo(id).andNameEqualTo(name).andDeleteFlagNotEqualTo(BusinessConstants.DELETE_FLAG_DELETED);
        List<Functions> list=null;
        try{
            list = functionsMapper.selectByExample(example);
        }catch(Exception e){
            DSException.readFail(logger, e);
        }
        return list==null?0:list.size();
    }

    public List<Functions> getRoleFunctions(String pNumber)throws Exception {
        FunctionsExample example = new FunctionsExample();
        example.createCriteria().andEnabledEqualTo(true).andPnumberEqualTo(pNumber)
                .andDeleteFlagNotEqualTo(BusinessConstants.DELETE_FLAG_DELETED);
        example.setOrderByClause("Sort");
        List<Functions> list=null;
        try{
            list = functionsMapper.selectByExample(example);
        }catch(Exception e){
            DSException.readFail(logger, e);
        }
        return list;
    }

    public List<Functions> findRoleFunctions(String pnumber)throws Exception{
        FunctionsExample example = new FunctionsExample();
        example.createCriteria().andEnabledEqualTo(true).andPnumberEqualTo(pnumber)
                .andDeleteFlagNotEqualTo(BusinessConstants.DELETE_FLAG_DELETED);
        example.setOrderByClause("Sort");
        List<Functions> list=null;
        try{
            list =functionsMapper.selectByExample(example);
        }catch(Exception e){
            DSException.readFail(logger, e);
        }
        return list;
    }

    public List<Functions> findByIds(String functionsIds)throws Exception{
        List<Long> idList = StringUtil.strToLongList(functionsIds);
        FunctionsExample example = new FunctionsExample();
        example.createCriteria().andEnabledEqualTo(true).andIdIn(idList)
                .andDeleteFlagNotEqualTo(BusinessConstants.DELETE_FLAG_DELETED);
        example.setOrderByClause("Sort asc");
        List<Functions> list=null;
        try{
            list =functionsMapper.selectByExample(example);
        }catch(Exception e){
            DSException.readFail(logger, e);
        }
        return list;
    }

    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public int batchDeleteFunctionsByIds(String ids)throws Exception {
        logService.insertLog(BusinessConstants.LOG_INTERFACE_NAME_FUNCTIONS,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_DELETE).append(ids).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        Staff userInfo=staffService.getCurrentUser();
        String [] idArray=ids.split(",");
        int result=0;
        try{
            result =functionsMapperEx.batchDeleteFunctionsByIds(new Date(),userInfo==null?null:userInfo.getId(),idArray);
        }catch(Exception e){
            DSException.writeFail(logger, e);
        }
        return result;
    }
}
