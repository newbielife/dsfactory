package com.ds.factory.service.Service;


import com.ds.factory.datasource.entities.Export_Record;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public interface Export_RecordService {

    List<Export_Record> selectByConstraint(Date Delivery_date,String Export_no,
                                           String Staff_no, String Order_no_details,
                                           String Target_place, String Source_place);

    int insertExport_Record(Export_Record export_record);
    int update(Export_Record export_record);
    List<Export_Record> selectByClient_no(String Client_no);
    List<Export_Record> selectByOrder_no(String Order_no);
    Export_Record selectByOrder_no_details(String Order_no_details);
    List<Export_Record> getAll_orderByDelivery_date();
}
