package com.ds.factory.service.Impl;


import com.ds.factory.datasource.entities.Expired_Food;
import com.ds.factory.datasource.entities.Product_Criteria;
import com.ds.factory.datasource.mappers.Expired_FoodMapper;
import com.ds.factory.datasource.mappers.Product_CriteriaMapper;
import com.ds.factory.datasource.mappers.Raw_Materials_CriteriaMapper;
import com.ds.factory.service.Service.Expired_FoodService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class Expired_FoodServiceImpl implements Expired_FoodService {

    @Resource
    Expired_FoodMapper expired_foodMapper;
    @Resource
    Product_CriteriaMapper product_criteriaMapper;
    @Resource
    Raw_Materials_CriteriaMapper raw_materials_criteriaMapper;

    @Override
    public List<Expired_Food> selectByConstraint(String Food_no, String Food_type, String Food_name, Date Expired_date) {
        if(Food_type==null) Food_type="";
        if(Expired_date==null)
            return expired_foodMapper.selectByConstraint_no_date(Food_no.trim(),Food_type.trim(),Food_name.trim());
        return expired_foodMapper.selectByConstraint(Food_no.trim(),Food_type.trim(),Food_name.trim(),Expired_date);
    }

    @Override
    public List<Expired_Food> orderByExpired_date() {
        return expired_foodMapper.orderByExpired_date();
    }

    @Override
    public List<Expired_Food> orderByLoss_money() {
        return expired_foodMapper.orderByLoss_money();
    }

    @Override
    public List<Expired_Food> orderByLoss_num() {
        return expired_foodMapper.orderByLoss_num();
    }

    @Override
    public List<Expired_Food> Expired_Raw_materials() {
        return expired_foodMapper.Expired_Raw_materials();
    }

    @Override
    public List<Expired_Food> Expired_Products() {
        return expired_foodMapper.Expired_Products();
    }

    @Override
    public int updateByPrimaryKey(Expired_Food expired_food) {
        return expired_foodMapper.updateByPrimaryKeySelective(expired_food);
    }

    @Override
    public int deleteByKey(String Food_no) {
        return expired_foodMapper.deleteByPrimaryKey(Food_no);
    }

    @Override
    public int insertExpired_Food(String Food_type,String Food_name,String Loss_num,String Processing_method) {
        Expired_Food expired_food=new Expired_Food();
        if(Food_type.trim().compareTo("原料")==0) {
            if(raw_materials_criteriaMapper.exist_or_notByName(Food_name)==0)
                return 0;
            expired_food.setFood_type("原料");
            expired_food.setLoss_money(Long.parseLong("0"));
        }
        else if(Food_type.trim().compareTo("成品")==0) {
            if(product_criteriaMapper.exist_or_notByName(Food_name)==0)
                return 0;
            expired_food.setFood_type("成品");
            int Loss=Integer.parseInt(Loss_num.split("-")[0]);
            Product_Criteria p=product_criteriaMapper.selectByProduct_name(Food_name);
            Long loss_money=Long.parseLong((Integer.parseInt(p.getUnit_Price()+"")*Loss)+"");
            expired_food.setLoss_money(loss_money);
        }
        else return 0;

        expired_food.setFood_name(Food_name.trim());
        expired_food.setLoss_num(Loss_num.trim());
        expired_food.setProcessing_method(Processing_method.trim());

        Date date=new Date(); //取时间
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.format(date);
        expired_food.setExpired_date(date);

        int biggest_num=Integer.parseInt(expired_foodMapper.select_Biggest_Food_no());
        String biggest="";
        boolean flag=true;
        while(flag)
        {
            biggest_num++;  biggest=""+biggest_num;
            //System.out.println(no_+"");
            switch (biggest.length())
            {//00 0000  0001
                case 1: biggest="000000000"+biggest;  break;
                case 2: biggest="00000000"+biggest;   break;
                case 3: biggest="0000000"+biggest;    break;
                case 4: biggest="000000"+biggest;     break;
                case 5: biggest="00000"+biggest;      break;
                case 6: biggest="0000"+biggest;       break;
                case 7: biggest="000"+biggest;        break;
                case 8: biggest="00"+biggest;       break;
                case 9: biggest="0"+biggest;        break;
                case 10: break;
            }
            if(expired_foodMapper.exist_or_not(biggest)==0) flag=false;
        }
        if(biggest.length()>=11)  return 0;

        expired_food.setFood_no(biggest);

        expired_foodMapper.insertSelective(expired_food);
        return 0;
    }
}
