package com.ds.factory.datasource.mappers;


import com.ds.factory.dao.Example.Order_DetailsExample;
import com.ds.factory.datasource.entities.Order_Details;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface Order_DetailsMapper {
    int count_sum();
    int deleteLike(@Param("Order_no") String Order_no);
    int updateCheckByOrder_no(@Param("Order_no") String Order_no);
    int updateCheckManufacture_permission(@Param("Order_no") String Order_no);


    List<Order_Details> selectByConstraint_disabled(@Param("Order_no_details") String Order_no_details,
                     @Param("Client_no") String Client_no,@Param("Product_no") String Product_no);
    List<Order_Details> selectByConstraint_enabled(@Param("Order_no_details") String Order_no_details,
                                                    @Param("Client_no") String Client_no,@Param("Product_no") String Product_no);
    List<Order_Details> selectByConstraint_all(@Param("Order_no_details") String Order_no_details,
                                                    @Param("Client_no") String Client_no,@Param("Product_no") String Product_no);
    List<Order_Details> selectByConstraint_Permission(@Param("Order_no_details") String Order_no_details,
                                               @Param("Client_no") String Client_no,@Param("Product_no") String Product_no);


    int exist_or_not(@Param("Order_no_details") String Order_no_details);

    List<Order_Details> selectLikeOrder_no(String Order_no);
    List<Order_Details> selectByClient_no(String Client_no);

    int countLikeOrder_no_Check_zero(@Param("part") String part);

    int deleteByExample(Order_DetailsExample example);
    int deleteByPrimaryKey(String Order_no_Details);
    int delete_true(@Param("Order_no") String Order_no);

    Order_Details selectByPrimaryKey(@Param("Order_no_details") String Order_no_details);

    int insert(Order_Details record);//不可以为空的Staff插入
    int insertSelective(Order_Details record);//部分插入内容，除了主键以外可以为空

    int updateByPrimaryKeySelective(Order_Details record);//部分内容可以空

    int updateByPrimaryKey(Order_Details record);//整体Staff不得为空
    int updateByExampleSelective(@Param("record") Order_Details record, @Param("example") Order_DetailsExample example);//包括主键在内需要修改，但是内容可以为空
    int updateByExample(@Param("record") Order_Details record, @Param("example") Order_DetailsExample example);//连主键也要修改

}
