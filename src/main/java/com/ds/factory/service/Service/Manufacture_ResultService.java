package com.ds.factory.service.Service;

import com.ds.factory.datasource.entities.Manufacture_Result;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public interface Manufacture_ResultService {
    List<Manufacture_Result> selectByConstraint(Date Update_date, String Manufacture_no,
                                                String Product_no, String Staff_no_manufacture, String Order_no_details);

    List<Manufacture_Result> selectByStaff_no_manufacture(String Staff_no_manufacture);
    List<Manufacture_Result> getAll();
    Manufacture_Result selectByOrder_no_details(String Order_no_details);
    int update(Manufacture_Result manufacture_result);
}
