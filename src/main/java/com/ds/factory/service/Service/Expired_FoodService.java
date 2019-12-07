package com.ds.factory.service.Service;


import com.ds.factory.datasource.entities.Expired_Food;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public interface Expired_FoodService {

    List<Expired_Food> selectByConstraint(String Food_no,       String Food_type,
                                          String Food_name,     Date Expired_date);


    List<Expired_Food> orderByExpired_date();
    List<Expired_Food> orderByLoss_money();
    List<Expired_Food> orderByLoss_num();
    List<Expired_Food> Expired_Raw_materials();
    List<Expired_Food> Expired_Products();
    int updateByPrimaryKey(Expired_Food expired_food);
    int deleteByKey(String Food_no);
    int insertExpired_Food(String Food_type, String Food_name, String Loss_num, String Processing_method);
}
