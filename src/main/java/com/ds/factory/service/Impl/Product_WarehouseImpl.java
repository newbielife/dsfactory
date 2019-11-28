package com.ds.factory.service.Impl;

import com.ds.factory.datasource.entities.Product_Warehouse;
import com.ds.factory.datasource.mappers.Product_CriteriaMapper;
import com.ds.factory.datasource.mappers.Product_WarehouseMapper;
import com.ds.factory.datasource.mappers.StaffMapper;
import com.ds.factory.service.Service.Product_WarehouseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class Product_WarehouseImpl implements Product_WarehouseService {
    @Resource
    Product_WarehouseMapper product_warehouseMapper;

    @Resource
    Product_CriteriaMapper product_criteriaMapper;

    @Resource
    StaffMapper staffMapper;


    @Override
    public List<Product_Warehouse> selectByConstraint(String Stock_no, String Product_no, String Staff_no_storage,String Storage_address, String Type) {
        if(Type==null||Type.trim().compareTo("全部")==0||Type.trim().compareTo("")==0)
            return product_warehouseMapper.all_data(Stock_no.trim(),Product_no.trim(),Storage_address.trim(),Staff_no_storage.trim());
        else if(Type.trim().compareTo("本日")==0)
            return product_warehouseMapper.today_data(Stock_no.trim(),Product_no.trim(),Storage_address.trim(),Staff_no_storage.trim());
        else if(Type.trim().compareTo("本周")==0)
            return product_warehouseMapper.this_week_data(Stock_no.trim(),Product_no.trim(),Storage_address.trim(),Staff_no_storage.trim());
        else if(Type.trim().compareTo("本月")==0)
            return product_warehouseMapper.this_month_data(Stock_no.trim(),Product_no.trim(),Storage_address.trim(),Staff_no_storage.trim());
        else if(Type.trim().compareTo("本季")==0)
            return product_warehouseMapper.this_season_data(Stock_no.trim(),Product_no.trim(),Storage_address.trim(),Staff_no_storage.trim());
        else if(Type.trim().compareTo("今年")==0)
            return product_warehouseMapper.this_year_data(Stock_no.trim(),Product_no.trim(),Storage_address.trim(),Staff_no_storage.trim());
        else
            return null;
    }

    @Override
    public List<Product_Warehouse> orderByDate() {
        return product_warehouseMapper.orderByDate();
    }

    @Override
    public List<Product_Warehouse> selectByProduct_no(String Product_no) {
        return product_warehouseMapper.selectByProduct_no(Product_no);
    }

    @Override
    public List<Product_Warehouse> selectByStaff_no_workshop(String Staff_no_workshop) {
        return product_warehouseMapper.selectByStaff_no_workshop(Staff_no_workshop);
    }

    @Override
    public Product_Warehouse selectByStock_no(String Stock_no) {
        return product_warehouseMapper.selectByPrimaryKey(Stock_no);
    }

    @Override
    public int insertProduct_Warehouse(Product_Warehouse product_warehouse) {
        if(product_warehouse.getDetails()==null)
            product_warehouse.setDetails("");
        if(product_warehouse.getStock_num()==null || product_warehouse.getStock_num().trim().compareTo("")==0)
            return 0;
        if(product_warehouse.getProduct_no()==null
                || product_warehouse.getProduct_no().trim().compareTo("")==0
                || product_criteriaMapper.exist_or_not(product_warehouse.getProduct_no().trim())==0)
            return 0;
        if(product_warehouse.getStorage_address()==null || product_warehouse.getStorage_address().trim().compareTo("")==0)
            return 0;
        if(product_warehouse.getStaff_no_storage()==null
                ||staffMapper.exist_or_not(product_warehouse.getStaff_no_storage().trim())==0)
            product_warehouse.setStaff_no_storage("");
        if(product_warehouse.getStaff_no_workshop()==null
                ||staffMapper.exist_or_not(product_warehouse.getStaff_no_workshop().trim())==0)
            product_warehouse.setStaff_no_workshop("");

        int biggest_num=Integer.parseInt(product_warehouseMapper.select_Biggest_Stock_no());
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
            if(product_warehouseMapper.exist_or_not(biggest)==0) flag=false;
        }
        if(biggest.length()>=9)  return 0;

        product_warehouse.setStock_no(biggest);
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.format(date);
        product_warehouse.setManufacture_date(date);

        return product_warehouseMapper.insertSelective(product_warehouse);
    }

    @Override
    public int deleteByPrimaryKey(String Stock_no) {
        return product_warehouseMapper.deleteByPrimaryKey(Stock_no);
    }

    @Override
    public int updateProduct_Warehouse(Product_Warehouse product_warehouse) {
        if(product_warehouse==null || product_warehouse.getStock_no()==null
                || product_warehouse.getStock_no().trim().compareTo("")==0)
            return 0;
        return product_warehouseMapper.updateByPrimaryKeySelective(product_warehouse);
    }
}
