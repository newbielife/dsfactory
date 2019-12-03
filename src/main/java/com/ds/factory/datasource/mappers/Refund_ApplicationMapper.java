package com.ds.factory.datasource.mappers;

import com.ds.factory.dao.Example.Refund_ApplicationExample;
import com.ds.factory.datasource.entities.Refund_Application;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Refund_ApplicationMapper {

    List<Refund_Application> selectByConstraint_disabled(@Param("Refund_no") String Refund_no,@Param("Order_no") String Order_no,
                            @Param("Client_no") String Client_no,@Param("Staff_no_checker") String Staff_no_checker);
    List<Refund_Application> selectByConstraint_enabled(@Param("Refund_no") String Refund_no,@Param("Order_no") String Order_no,
                                                         @Param("Client_no") String Client_no,@Param("Staff_no_checker") String Staff_no_checker);
    List<Refund_Application> selectByConstraint_all(@Param("Refund_no") String Refund_no,@Param("Order_no") String Order_no,
                                                         @Param("Client_no") String Client_no,@Param("Staff_no_checker") String Staff_no_checker);
    List<Refund_Application> selectByConstraint_forbidden(@Param("Refund_no") String Refund_no,@Param("Order_no") String Order_no,
                                                    @Param("Client_no") String Client_no,@Param("Staff_no_checker") String Staff_no_checker);



    List<Refund_Application> selectByClient_no(@Param("Client_no") String Client_no);
    List<Refund_Application> selectByStaff_no_checker(@Param("Staff_no_checker") String Staff_no_checker);
    List<Refund_Application> selectByOrder_no(@Param("Order_no") String Order_no);
    List<Refund_Application> selectAll();

    int exist_or_not(@Param("Refund_no") String Refund_no);
    String select_Biggest_Refund_no();
    Refund_Application selectByPrimaryKey(@Param("Refund_no") String Refund_no);
    int deleteByPrimaryKey(@Param("Refund_no") String Refund_no);

    int updateByExampleSelective(@Param("record") Refund_Application record, @Param("example") Refund_ApplicationExample example);//包括主键在内需要修改，但是内容可以为空
    int updateByExample(@Param("record") Refund_Application record, @Param("example") Refund_ApplicationExample example);//连主键也要修改

    int countByExample(Refund_ApplicationExample example);
    int deleteByExample(Refund_ApplicationExample example);

    int insert(Refund_Application record);//不可以为空的Staff插入
    int insertSelective(Refund_Application record);//部分插入内容，除了主键以外可以为空

    int updateByPrimaryKeySelective(Refund_Application record);//部分内容可以空
    int updateByPrimaryKey(Refund_Application record);//整体Staff不得为空
    List<Refund_Application> selectByExample(Refund_ApplicationExample example);
}
