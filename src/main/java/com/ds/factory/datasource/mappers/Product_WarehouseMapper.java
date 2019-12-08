package com.ds.factory.datasource.mappers;

import com.ds.factory.dao.Example.Product_WarehouseExample;
import com.ds.factory.datasource.entities.Product_Warehouse;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Product_WarehouseMapper {
    int count_sum();
    int exist_or_not(@Param("Stock_no") String Stock_no);
    String select_Biggest_Stock_no();
    Product_Warehouse selectByPrimaryKey(@Param("Stock_no") String Stock_no);
    int deleteByPrimaryKey(@Param("Stock_no") String Stock_no);

    int updateByExampleSelective(@Param("record") Product_Warehouse record, @Param("example") Product_WarehouseExample example);//包括主键在内需要修改，但是内容可以为空
    int updateByExample(@Param("record") Product_Warehouse record, @Param("example") Product_WarehouseExample example);//连主键也要修改

    int countByExample(Product_WarehouseExample example);
    int deleteByExample(Product_WarehouseExample example);

    int insert(Product_Warehouse record);//不可以为空的Staff插入
    int insertSelective(Product_Warehouse record);//部分插入内容，除了主键以外可以为空

    int updateByPrimaryKeySelective(Product_Warehouse record);//部分内容可以空
    int updateByPrimaryKey(Product_Warehouse record);//整体Staff不得为空
    List<Product_Warehouse> selectByExample(Product_WarehouseExample example);

    List<Product_Warehouse> orderByDate();
    List<Product_Warehouse> selectByProduct_no(@Param("Product_no") String Product_no);
    List<Product_Warehouse> selectByStaff_no_workshop(@Param("Staff_no_workshop") String Staff_no_workshop);

    List<Product_Warehouse> all_data(@Param("Stock_no") String Stock_no, @Param("Product_no") String Product_no,@Param("Staff_no_storage") String Staff_no_storage,@Param("Storage_address") String Storage_address);
    List<Product_Warehouse> today_data(@Param("Stock_no") String Stock_no, @Param("Product_no") String Product_no,@Param("Staff_no_storage") String Staff_no_storage,@Param("Storage_address") String Storage_address);
    List<Product_Warehouse> this_week_data(@Param("Stock_no") String Stock_no, @Param("Product_no") String Product_no,@Param("Staff_no_storage") String Staff_no_storage,@Param("Storage_address") String Storage_address);
    List<Product_Warehouse> this_month_data(@Param("Stock_no") String Stock_no, @Param("Product_no") String Product_no,@Param("Staff_no_storage") String Staff_no_storage,@Param("Storage_address") String Storage_address);
    List<Product_Warehouse> this_season_data(@Param("Stock_no") String Stock_no, @Param("Product_no") String Product_no,@Param("Staff_no_storage") String Staff_no_storage,@Param("Storage_address") String Storage_address);
    List<Product_Warehouse> this_year_data(@Param("Stock_no") String Stock_no, @Param("Product_no") String Product_no,@Param("Staff_no_storage") String Staff_no_storage,@Param("Storage_address") String Storage_address);
}
