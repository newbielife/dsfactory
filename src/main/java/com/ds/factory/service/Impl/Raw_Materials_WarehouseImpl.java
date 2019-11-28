package com.ds.factory.service.Impl;

import com.ds.factory.datasource.entities.Raw_Materials_Warehouse;
import com.ds.factory.datasource.mappers.Raw_Materials_CriteriaMapper;
import com.ds.factory.datasource.mappers.Raw_Materials_WarehouseMapper;
import com.ds.factory.datasource.mappers.StaffMapper;
import com.ds.factory.service.Service.Raw_Materials_WarehouseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class Raw_Materials_WarehouseImpl implements Raw_Materials_WarehouseService {
    @Resource
    Raw_Materials_WarehouseMapper rawMaterialsWarehouseMapper;

    @Resource
    Raw_Materials_CriteriaMapper raw_materials_criteriaMapper;

    @Resource
    StaffMapper staffMapper;


    @Override
    public List<Raw_Materials_Warehouse> selectByConstraint(String Stock_no, String Material_no, String Storage_address,String Staff_no_storage, String Type) {
        if(Type==null||Type.trim().compareTo("全部")==0||Type.trim().compareTo("")==0)
            return rawMaterialsWarehouseMapper.all_data(Stock_no.trim(),Material_no.trim(),Storage_address.trim(),Staff_no_storage.trim());
        else if(Type.trim().compareTo("本日")==0)
            return rawMaterialsWarehouseMapper.today_data(Stock_no.trim(),Material_no.trim(),Storage_address.trim(),Staff_no_storage.trim());
        else if(Type.trim().compareTo("本周")==0)
            return rawMaterialsWarehouseMapper.this_week_data(Stock_no.trim(),Material_no.trim(),Storage_address.trim(),Staff_no_storage.trim());
        else if(Type.trim().compareTo("本月")==0)
            return rawMaterialsWarehouseMapper.this_month_data(Stock_no.trim(),Material_no.trim(),Storage_address.trim(),Staff_no_storage.trim());
        else if(Type.trim().compareTo("本季")==0)
            return rawMaterialsWarehouseMapper.this_season_data(Stock_no.trim(),Material_no.trim(),Storage_address.trim(),Staff_no_storage.trim());
        else if(Type.trim().compareTo("今年")==0)
            return rawMaterialsWarehouseMapper.this_year_data(Stock_no.trim(),Material_no.trim(),Storage_address.trim(),Staff_no_storage.trim());
        else
            return null;
    }

    @Override
    public List<Raw_Materials_Warehouse> orderByDate() {
        return rawMaterialsWarehouseMapper.orderByDate();
    }

    @Override
    public List<Raw_Materials_Warehouse> selectByRaw_Materials_no(String Material_no) {
        return rawMaterialsWarehouseMapper.selectByMaterial_no(Material_no);
    }

    @Override
    public List<Raw_Materials_Warehouse> selectByStaff_no_storage(String Staff_no_storage) {
        return rawMaterialsWarehouseMapper.selectByStaff_no_storage(Staff_no_storage);
    }

    @Override
    public Raw_Materials_Warehouse selectByStock_no(String Stock_no) {
        return rawMaterialsWarehouseMapper.selectByPrimaryKey(Stock_no);
    }


    @Override
    public int insertRaw_Materials_Warehouse(Raw_Materials_Warehouse raw_materials_warehouse) {
        if(raw_materials_warehouse.getDetails()==null)
            raw_materials_warehouse.setDetails("");
        if(raw_materials_warehouse.getStock_num()==null
                || raw_materials_warehouse.getStock_num().trim().compareTo("")==0)
            return 0;
        if(raw_materials_warehouse.getMaterial_no()==null
                || raw_materials_warehouse.getMaterial_no().trim().compareTo("")==0
                || raw_materials_criteriaMapper.exist_or_not(raw_materials_warehouse.getMaterial_no().trim())==0)
            return 0;
        if(raw_materials_warehouse.getStorage_address()==null
                || raw_materials_warehouse.getStorage_address().trim().compareTo("")==0)
            return 0;
        if(raw_materials_warehouse.getStaff_no_storage()==null
                ||staffMapper.exist_or_not(raw_materials_warehouse.getStaff_no_storage().trim())==0)
            raw_materials_warehouse.setStaff_no_storage("");

        int biggest_num=Integer.parseInt(rawMaterialsWarehouseMapper.select_Biggest_Stock_no());
        String biggest="";
        boolean flag=true;
        while(flag)
        {
            biggest_num++;  biggest=""+biggest_num;
            //System.out.println(no_+"");
            switch (biggest.length())
            {//0000  0001
                case 1: biggest="0000000"+biggest;  break;
                case 2: biggest="000000"+biggest;   break;
                case 3: biggest="00000"+biggest;    break;
                case 4: biggest="0000"+biggest;     break;
                case 5: biggest="000"+biggest;      break;
                case 6: biggest="00"+biggest;       break;
                case 7: biggest="0"+biggest;        break;
                case 8: break;
            }
            if(rawMaterialsWarehouseMapper.exist_or_not(biggest)==0) flag=false;
        }
        if(biggest.length()>=9)  return 0;

        raw_materials_warehouse.setStock_no(biggest);
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.format(date);
        raw_materials_warehouse.setProduct_date(date);

        return rawMaterialsWarehouseMapper.insertSelective(raw_materials_warehouse);
    }

    @Override
    public int deleteByPrimaryKey(String Stock_no) {
        return rawMaterialsWarehouseMapper.deleteByPrimaryKey(Stock_no);
    }

    @Override
    public int updateRaw_Materials_Warehouse(Raw_Materials_Warehouse product_warehouse) {
        if(product_warehouse==null || product_warehouse.getStock_no()==null
                || product_warehouse.getStock_no().trim().compareTo("")==0)
            return 0;
        return rawMaterialsWarehouseMapper.updateByPrimaryKeySelective(product_warehouse);
    }
}
