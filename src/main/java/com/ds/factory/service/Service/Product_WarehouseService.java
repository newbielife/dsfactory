package com.ds.factory.service.Service;

import com.ds.factory.datasource.entities.Product_Warehouse;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface Product_WarehouseService {
    List<Product_Warehouse> today_data();
    List<Product_Warehouse> this_week_data();
    List<Product_Warehouse> this_month_data();
    List<Product_Warehouse> this_season_data();
    List<Product_Warehouse> this_year_data();


    List<Product_Warehouse> orderByDate();
    List<Product_Warehouse> selectByProduct_no(String Product_no);
    List<Product_Warehouse> selectByStaff_no_workshop(String Staff_no_workshop);
    Product_Warehouse selectByStock_no(String Stock_no);
    int insertProduct_Warehouse(Product_Warehouse product_warehouse);
    int deleteByPrimaryKey(String Stock_no);
    int updateProduct_Warehouse(Product_Warehouse product_warehouse);
}
