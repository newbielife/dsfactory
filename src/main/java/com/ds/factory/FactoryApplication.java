package com.ds.factory;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement//开启事务管理
@ServletComponentScan
@EnableScheduling
@MapperScan("com.ds.factory.datasource.mappers")
public class FactoryApplication {
        //管理员测试用户名：admin；密码：123456
    public static void main(String[] args) {
        SpringApplication.run(FactoryApplication.class, args);
    }

}
