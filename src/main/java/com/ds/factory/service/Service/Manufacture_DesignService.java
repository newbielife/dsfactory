package com.ds.factory.service.Service;

import com.ds.factory.datasource.entities.Manufacture_Design;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public interface Manufacture_DesignService {
    List<Manufacture_Design> selectByConstraint(String Manufacture_no, String Staff_no_design,
                                                String Order_no_details, String Product_no, String Workshop, Date date);


    int insertManufacture_Design(Manufacture_Design manufacture_design);
    int deleteByPrimaryKey(String Manufacture_no);
    int update(Manufacture_Design manufacture_design);
    List<Manufacture_Design> selectByStaff_no_Design(String Staff_no_Design);
    List<Manufacture_Design> selectByStaff_no_manufacture(String Staff_no_manufacture);
    List<Manufacture_Design> selectByWorkshop(String Workshop);
    List<Manufacture_Design> selectAll();
    List<Manufacture_Design> selectByOrder_no(String Order_no);
    Manufacture_Design selectByOrder_no_details(String Order_no_details);
}
