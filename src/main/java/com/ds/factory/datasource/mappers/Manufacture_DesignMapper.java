package com.ds.factory.datasource.mappers;

import com.ds.factory.dao.Example.Manufacture_DesignExample;
import com.ds.factory.datasource.entities.Manufacture_Design;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface Manufacture_DesignMapper {
    int existByDate_Product_no(@Param("Product_no") String Product_no,@Param("Deadline") Date Deadline);
    Manufacture_Design selectByDate_Product_no(@Param("Product_no") String Product_no,@Param("Deadline") Date Deadline);
    int count_sum();

    List<Manufacture_Design> selectByConstraint(@Param("Manufacture_no") String Manufacture_no,
            @Param("Staff_no_design") String Staff_no_design,@Param("Order_no_details") String Order_no_details,
            @Param("Product_no") String Product_no,@Param("Workshop") String Workshop);

    List<Manufacture_Design> selectByConstraint_today(@Param("Manufacture_no") String Manufacture_no,
                                                @Param("Staff_no_design") String Staff_no_design,@Param("Order_no_details") String Order_no_details,
                                                @Param("Product_no") String Product_no,@Param("Workshop") String Workshop,
                                                      @Param("Update_date") Date Update_date);

    List<Manufacture_Design> selectAll();
    List<Manufacture_Design> selectByStaff_no_Design(@Param("Staff_no_Design") String Staff_no_Design);
    List<Manufacture_Design> selectByWorkshop(@Param("Workshop") String Workshop);
    List<Manufacture_Design> selectByOrder_no(@Param("Order_no") String Order_no);
    Manufacture_Design selectByOrder_no_details(@Param("Order_no_details") String Order_no_details);


    int exist_or_not(@Param("Manufacture_no") String Manufacture_no);
    String select_Biggest_Manufacture_no();
    Manufacture_Design selectByPrimaryKey(@Param("Manufacture_no") String Manufacture_no);
    int deleteByPrimaryKey(@Param("Manufacture_no") String Manufacture_no);

    int updateByExampleSelective(@Param("record") Manufacture_Design record, @Param("example") Manufacture_DesignExample example);//包括主键在内需要修改，但是内容可以为空
    int updateByExample(@Param("record") Manufacture_Design record, @Param("example") Manufacture_DesignExample example);//连主键也要修改

    int countByExample(Manufacture_DesignExample example);
    int deleteByExample(Manufacture_DesignExample example);

    int insert(Manufacture_Design record);//不可以为空的Staff插入
    int insertSelective(Manufacture_Design record);//部分插入内容，除了主键以外可以为空

    int updateByPrimaryKeySelective(Manufacture_Design record);//部分内容可以空
    int updateByPrimaryKey(Manufacture_Design record);//整体Staff不得为空
    List<Manufacture_Design> selectByExample(Manufacture_DesignExample example);
}
