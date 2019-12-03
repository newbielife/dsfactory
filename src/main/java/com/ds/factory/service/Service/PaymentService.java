package com.ds.factory.service.Service;

import com.ds.factory.datasource.entities.Payment;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public interface PaymentService {
    List<Payment> selectByConstraint(Date Payment_date, String Order_no, String Staff_no_accountant, String Payment_no);

    boolean Pay_in_Full(String Order_no);
    int insertPayment(String Order_no,String Staff_no, Long Money, String Details);
    int updateByPrimaryKey(Payment payment);
    List<Payment> selectByClient_no(String Client_no);
    List<Payment> selectByStaff_no_accountant(String Staff_no_accountant);
    List<Payment> selectByOrder_no(String Order_no);
    List<Payment> getAll();
}
