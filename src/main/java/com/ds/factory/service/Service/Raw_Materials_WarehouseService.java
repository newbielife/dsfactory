package com.ds.factory.service.Service;

import com.ds.factory.datasource.entities.Raw_Materials_Warehouse;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface  Raw_Materials_WarehouseService {
    List<Raw_Materials_Warehouse> today_data();
    List<Raw_Materials_Warehouse> this_week_data();
    List<Raw_Materials_Warehouse> this_month_data();
    List<Raw_Materials_Warehouse> this_season_data();
    List<Raw_Materials_Warehouse> this_year_data();


    List<Raw_Materials_Warehouse> orderByDate();
    List<Raw_Materials_Warehouse> selectByRaw_Materials_no(String Material_no);
    List<Raw_Materials_Warehouse> selectByStaff_no_storage(String Staff_no_storage);
    Raw_Materials_Warehouse selectByStock_no(String Stock_no);
    int insertRaw_Materials_Warehouse(Raw_Materials_Warehouse product_warehouse);
    int deleteByPrimaryKey(String Stock_no);
    int updateRaw_Materials_Warehouse(Raw_Materials_Warehouse product_warehouse);
}
