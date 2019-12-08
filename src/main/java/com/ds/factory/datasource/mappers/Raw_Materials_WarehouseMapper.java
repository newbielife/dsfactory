package com.ds.factory.datasource.mappers;

import com.ds.factory.dao.Example.Raw_Materials_WarehouseExample;
import com.ds.factory.datasource.entities.Raw_Materials_Warehouse;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Raw_Materials_WarehouseMapper {
    List<Raw_Materials_Warehouse> orderByDate();
    int count_sum();
    int exist_or_not(@Param("Stock_no") String Stock_no);
    String select_Biggest_Stock_no();
    Raw_Materials_Warehouse selectByPrimaryKey(@Param("Stock_no") String Stock_no);
    int deleteByPrimaryKey(@Param("Stock_no") String Stock_no);

    int updateByExampleSelective(@Param("record") Raw_Materials_Warehouse record, @Param("example") Raw_Materials_WarehouseExample example);//包括主键在内需要修改，但是内容可以为空
    int updateByExample(@Param("record") Raw_Materials_Warehouse record, @Param("example") Raw_Materials_WarehouseExample example);//连主键也要修改

    int countByExample(Raw_Materials_WarehouseExample example);
    int deleteByExample(Raw_Materials_WarehouseExample example);

    int insert(Raw_Materials_Warehouse record);//不可以为空的Staff插入
    int insertSelective(Raw_Materials_Warehouse record);//部分插入内容，除了主键以外可以为空

    int updateByPrimaryKeySelective(Raw_Materials_Warehouse record);//部分内容可以空
    int updateByPrimaryKey(Raw_Materials_Warehouse record);//整体Staff不得为空
    List<Raw_Materials_Warehouse> selectByExample(Raw_Materials_WarehouseExample example);

    List<Raw_Materials_Warehouse> selectByMaterial_no(@Param("Material_no") String Material_no);
    List<Raw_Materials_Warehouse> selectByStaff_no_storage(@Param("Staff_no_storage") String Staff_no_storage);


    List<Raw_Materials_Warehouse> all_data(@Param("Stock_no") String Stock_no,@Param("Material_no") String Material_no,@Param("Storage_address") String Storage_address,@Param("Staff_no_storage") String Staff_no_storage);
    List<Raw_Materials_Warehouse> today_data(@Param("Stock_no") String Stock_no,@Param("Material_no") String Material_no,@Param("Storage_address") String Storage_address,@Param("Staff_no_storage") String Staff_no_storage);
    List<Raw_Materials_Warehouse> this_week_data(@Param("Stock_no") String Stock_no,@Param("Material_no") String Material_no,@Param("Storage_address") String Storage_address,@Param("Staff_no_storage") String Staff_no_storage);
    List<Raw_Materials_Warehouse> this_month_data(@Param("Stock_no") String Stock_no,@Param("Material_no") String Material_no,@Param("Storage_address") String Storage_address,@Param("Staff_no_storage") String Staff_no_storage);
    List<Raw_Materials_Warehouse> this_season_data(@Param("Stock_no") String Stock_no,@Param("Material_no") String Material_no,@Param("Storage_address") String Storage_address,@Param("Staff_no_storage") String Staff_no_storage);
    List<Raw_Materials_Warehouse> this_year_data(@Param("Stock_no") String Stock_no,@Param("Material_no") String Material_no,@Param("Storage_address") String Storage_address,@Param("Staff_no_storage") String Staff_no_storage);
}
