package com.ds.factory.service;

import com.ds.factory.dao.ClientMapper;
import com.ds.factory.domain.Client;
import com.ds.factory.utils.ExceptionCodeConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static sun.misc.Version.println;


@Service
public class ClientService {

    private Logger logger = LoggerFactory.getLogger(ClientService.class);
    @Autowired
    private ClientMapper clientMapper;

    public int validateUser(String username, String password) throws Exception {
        try {
            Client example;
            example=clientMapper.searchById(username);
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

}
