package com.ds.factory.service.Service;


import com.ds.factory.datasource.entities.Expired_Food;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface Expired_FoodService {
    List<Expired_Food> orderByExpired_date();
    List<Expired_Food> orderByLoss_money();
    List<Expired_Food> orderByLoss_num();
    List<Expired_Food> Expired_Raw_materials();
    List<Expired_Food> Expired_Products();

    int insertExpired_Food(String Food_type, String Food_name, String Loss_num, String Processing_method);
}
