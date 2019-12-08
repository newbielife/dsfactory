package com.ds.factory.datasource.mappers;


import com.ds.factory.dao.Example.PaymentExample;
import com.ds.factory.datasource.entities.Payment;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface PaymentMapper {
    int count_sum();
    int money_sum();

    List<Payment> selectByConstraint(@Param("Payment_date") Date Payment_date, @Param("Order_no") String Order_no,
                                     @Param("Staff_no_accountant") String Staff_no_accountant, @Param("Payment_no") String Payment_no);

    List<Payment> selectByConstraint_no_date( @Param("Order_no") String Order_no,
                                     @Param("Staff_no_accountant") String Staff_no_accountant, @Param("Payment_no") String Payment_no);

    List<Payment> selectByStaff_no_accountant(@Param("Staff_no_accountant") String Staff_no_accountant);
    List<Payment> selectByOrder_no(@Param("Order_no") String Order_no);
    List<Payment> selectByClient_no(@Param("Client_no") String Client_no);
    List<Payment> getAll();

    int exist_or_not(@Param("Payment_no") String Payment_no);
    String select_Biggest_Payment_no();
    Payment selectByPrimaryKey(@Param("Payment_no") String Payment_no);
    int deleteByPrimaryKey(@Param("Payment_no") String Payment_no);

    int updateByExampleSelective(@Param("record") Payment record, @Param("example") PaymentExample example);//包括主键在内需要修改，但是内容可以为空
    int updateByExample(@Param("record") Payment record, @Param("example") PaymentExample example);//连主键也要修改

    int countByExample(PaymentExample example);
    int deleteByExample(PaymentExample example);

    int insert(Payment record);//不可以为空的Staff插入
    int insertSelective(Payment record);//部分插入内容，除了主键以外可以为空

    int updateByPrimaryKeySelective(Payment record);//部分内容可以空
    int updateByPrimaryKey(Payment record);//整体Staff不得为空
    List<Payment> selectByExample(PaymentExample example);

}
