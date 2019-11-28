package com.ds.factory.service.Impl;

import com.ds.factory.datasource.entities.Manufacture_Result;
import com.ds.factory.datasource.mappers.Manufacture_ResultMapper;
import com.ds.factory.service.Service.Manufacture_ResultService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class Manufacture_ResultServiceImpl  implements Manufacture_ResultService {
    @Resource
    Manufacture_ResultMapper manufacture_resultMapper;

    @Override
    public List<Manufacture_Result> selectByConstraint(Date Update_date, String Manufacture_no, String Product_no, String Staff_no_manufacture, String Order_no_details) {
        if(Update_date==null)
            return manufacture_resultMapper.selectByConstraint_no_date(Manufacture_no.trim(),
                    Product_no.trim(),Staff_no_manufacture.trim(),Order_no_details.trim());
        return manufacture_resultMapper.selectByConstraint(Update_date,Manufacture_no.trim(),
                Product_no.trim(),Staff_no_manufacture.trim(),Order_no_details.trim());
    }

    @Override
    public List<Manufacture_Result> selectByStaff_no_manufacture(String Staff_no_manufacture) {
        return manufacture_resultMapper.selectByStaff_no_manufacture(Staff_no_manufacture);
    }

    @Override
    public List<Manufacture_Result> getAll() {
        return manufacture_resultMapper.selectAll();
    }

    @Override
    public Manufacture_Result selectByOrder_no_details(String Order_no_details) {
        return manufacture_resultMapper.selectByOrder_no_details(Order_no_details);
    }

    @Override
    public int update(Manufacture_Result manufacture_result) {
        if(manufacture_result==null || manufacture_result.getManufacture_no()==null
            ||manufacture_result.getManufacture_no().trim().compareTo("")==0)
            return 0;
        return manufacture_resultMapper.updateByPrimaryKeySelective(manufacture_result);
    }
}
