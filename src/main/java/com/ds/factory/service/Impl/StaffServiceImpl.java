package com.ds.factory.service.Impl;


import com.alibaba.fastjson.JSONObject;
import com.ds.factory.dao.Example.StaffExample;
import com.ds.factory.datasource.entities.Client;
import com.ds.factory.datasource.entities.Staff;
import com.ds.factory.datasource.mappers.StaffMapper;
import com.ds.factory.service.Service.StaffService;
import com.ds.factory.utils.ExceptionCodeConstants;
import com.ds.factory.utils.JshException;
import com.ds.factory.utils.Tools;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Objects;

@Service
public class StaffServiceImpl implements StaffService {

    private Logger logger = LoggerFactory.getLogger(StaffService.class);
    @Resource
    StaffMapper staffMapper;

    @Override
    public Staff selectByPrimaryKey(String userno) {
        return staffMapper.selectByPrimaryKey(userno);
    }

    @Override
    public boolean exist_or_not(String Staff_no){
        return staffMapper.exist_or_not(Staff_no)>0;
    }

    @Override
    public int countByExample() {
        return 0;
    }

    @Override
    public boolean checkLoginName(String Staff_no) {
        return staffMapper.exist_or_not(Staff_no)>0;
    }

    @Override
    public int update_Password_By_PrimaryKey(String loginname, String OldPassword, String NewPassword) {
        return 0;
    }

    @Override
    public int Register_new_Staff(String loginname, String password) {
        return 0;
    }

    @Override
    public List<Staff> getAll_Staff() throws Exception {
        StaffExample example = new StaffExample();
        List<Staff> list=null;
        try{
            list=staffMapper.selectByExample(example);
        }catch(Exception e){
            JshException.readFail(logger, e);
        }
        return list;
    }

    @Override
    public int validateUser(String username, String password) throws Exception {
        try {
            Staff example;
            example=staffMapper.selectByPrimaryKey(username);
            if(example==null){
                return ExceptionCodeConstants.UserExceptionCode.USER_PASSWORD_ERROR;
            }
            else if (!example.getPassword().equals(password)) {
                return ExceptionCodeConstants.UserExceptionCode.USER_PASSWORD_ERROR;
            }
        } catch (Exception e) {
            logger.error(">>>>>>>>访问验证用户姓名是否存在后台信息异常", e);
            return ExceptionCodeConstants.UserExceptionCode.USER_ACCESS_EXCEPTION;
        }
        return ExceptionCodeConstants.UserExceptionCode.USER_CONDITION_FIT;

    }

    @Override
    public List<Staff> selectBy_partName_or_partNo(String part) {
        if(part==null || part.trim().compareTo("")==0)  part="";
        return staffMapper.selectBy_partName_or_partNo(part,part);
    }

    @Override
    public List<Staff> orderBy_Authority() {
        return staffMapper.orderBy_Authority();
    }

    @Override
    public List<Staff> select_Department_orderBy_Busy(String Department) {
        List<Staff> list=null;
        try{
            list=staffMapper.select_Department_orderBy_Busy(Department);
        }catch(Exception e){
            JshException.readFail(logger, e);
        }
        return list;
    }

    @Override
    public int insert(Staff s){
        return staffMapper.insert(s);
    }

    @Override
    public int insert_Staff_details(Staff staff) {
        return 0;
    }


    @Override
    public int insertSelective(Staff record) {
        return staffMapper.insertSelective(record);
    }

    @Override
    public int deleteByPrimaryKey(String Staff_no){
        return staffMapper.deleteByPrimaryKey(Staff_no);
    }

    @Override
    public int updateByPrimaryKey(Staff staff){
        //传入实体类Staff，以Staff_no为检索修改，其他数据不得为空null或0
        return staffMapper.updateByPrimaryKey(staff);
    }

    @Override
    public int updateByPrimaryKeySelective(Staff staff){
        //传入实体类Staff，以Staff_no为检索修改，其他数据可以为空null或0
        return staffMapper.updateByPrimaryKeySelective(staff);
    }


    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public int insertUser(String beanJson, HttpServletRequest request)throws Exception {
        Staff staff = JSONObject.parseObject(beanJson, Staff.class);
        String password = "123456";
        //因密码用MD5加密，需要对密码进行转化
        try {
            password = Tools.md5Encryp(password);
            staff.setPassword(password);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            logger.error(">>>>>>>>>>>>>>转化MD5字符串错误 ：" + e.getMessage());
        }
        int result=0;
        try{
            result=staffMapper.insertSelective(staff);
        }catch(Exception e){
            JshException.writeFail(logger, e);
        }
        return result;
    }

    @Override
    public Staff getCurrentUser()throws Exception{
        HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
        return (Staff)request.getSession().getAttribute("user");
    }

}