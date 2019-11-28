package com.ds.factory.service.Service;

import com.ds.factory.datasource.entities.Product_Warehouse;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface Product_WarehouseService {
    List<Product_Warehouse> selectByConstraint(String Stock_no, String Product_no,String Staff_no_storage,String Storage_address,String Type);


    List<Product_Warehouse> orderByDate();
    List<Product_Warehouse> selectByProduct_no(String Product_no);
    List<Product_Warehouse> selectByStaff_no_workshop(String Staff_no_workshop);
    Product_Warehouse selectByStock_no(String Stock_no);
    int insertProduct_Warehouse(Product_Warehouse product_warehouse);
    int deleteByPrimaryKey(String Stock_no);
    int updateProduct_Warehouse(Product_Warehouse product_warehouse);
}
