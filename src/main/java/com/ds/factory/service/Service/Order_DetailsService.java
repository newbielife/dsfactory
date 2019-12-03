package com.ds.factory.service.Service;

import com.ds.factory.datasource.entities.Order_Details;
import com.ds.factory.datasource.entities.Product_Popularity;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public interface Order_DetailsService {

    List<Order_Details> selectByConstraint(String Order_no_details, String Client_no,String Product_no,String Check);
    List<Product_Popularity> selectByConstraint(String Product_no,String Product_name,String Product_type);
    int updateCheckByOrder_no(String Order_no);
    int updateCheckManufacture_permission(String Order_no);


    int deleteByOrder_no(String Order_no);

    List<Product_Popularity> orderByPopularity();
    int Popularity_Rank_ByProduct_no(String Product_no);

    List<Order_Details> selectByOrder_no(String Order_no);
    List<Order_Details> selectByClient_no(String Client_no);


    Order_Details selectByOrder_no_details(String Order_no_details);
    Date selectOrder_Create_DateByOrder_no_details(String Order_no_details);


    int deleteByPrimaryKey(String Order_no_Details);

    Order_Details selectByPrimaryKey(String Order_no_Details);

    int insert(Order_Details record);//不可以为空的Staff插入
    int insertSelective(Order_Details record);//部分插入内容，除了主键以外可以为空


    int Order_finished_by_Workshop(String Order_no_Details);
}
