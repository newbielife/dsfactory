package com.ds.factory.service.Service;

import com.ds.factory.datasource.entities.Refund_Application;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface Refund_ApplicationService {

    List<Refund_Application> selectByConstraint(String Refund_no,String Order_no,
                       String Client_no,String Staff_no_checker,String Check);

    int insertPayment(Refund_Application red);
    int updateByPrimaryKey(Refund_Application payment);
    List<Refund_Application> selectByClient_no(String Client_no);
    List<Refund_Application> selectByStaff_no_checker(String Staff_no);
    List<Refund_Application> selectByOrder_no(String Order_no);
    List<Refund_Application> getAll();
}
