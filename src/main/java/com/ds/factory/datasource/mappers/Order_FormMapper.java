package com.ds.factory.datasource.mappers;

import com.ds.factory.dao.Example.Order_FormExample;
import com.ds.factory.datasource.entities.Order_Form;
//import com.sun.tools.corba.se.idl.constExpr.Or;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface Order_FormMapper {
    int count_sum_accountant();
    int count_sum_salesman();


    List<Order_Form> selectByConstraint_disabled(@Param("Order_no") String Order_no,
                                         @Param("Client_no") String Client_no, @Param("Staff_no") String Staff_no);
    List<Order_Form> selectByConstraint_enabled(@Param("Order_no") String Order_no,
                                                @Param("Client_no") String Client_no, @Param("Staff_no") String Staff_no);
    List<Order_Form> selectByConstraint_all(@Param("Order_no") String Order_no,
                                            @Param("Client_no") String Client_no, @Param("Staff_no") String Staff_no);

    List<Order_Form> getAllOrder();
    List<Order_Form> selectByClient_no(@Param("Client_no") String Client_no);
    List<Order_Form> selectByStaff_no(@Param("Staff_no") String Staff_no);
    List<Order_Form> selectByProgress_Type(@Param("Progress") String Progress);
    List<Order_Form> orderByDate();
    List<Order_Form> orderBySum_amount();


    int exist_or_not(@Param("Order_no") String Order_no);
    int deleteByExample(Order_FormExample example);
    int deleteByPrimaryKey(String Order_no_Details);

    Order_Form selectByPrimaryKey(String Order_no);

    String select_Biggest_Order_no();

    int insert(Order_Form record);//不可以为空的Staff插入
    int insertSelective(Order_Form record);//部分插入内容，除了主键以外可以为空
    int updateByPrimaryKeySelective(Order_Form record);//部分内容可以空
    int updateByPrimaryKey(Order_Form record);//整体Staff不得为空
    int updateByExampleSelective(@Param("record") Order_Form record, @Param("example") Order_FormExample example);//包括主键在内需要修改，但是内容可以为空
    int updateByExample(@Param("record") Order_Form record, @Param("example") Order_FormExample example);//连主键也要修改

}
