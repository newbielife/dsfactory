package com.ds.factory.datasource.mappers;

import com.ds.factory.dao.Example.Manufacture_ResultExample;
import com.ds.factory.datasource.entities.Manufacture_Result;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface Manufacture_ResultMapper {
    List<Manufacture_Result> selectByConstraint(@Param("Update_date") Date Update_date,
                        @Param("Manufacture_no") String Manufacture_no,@Param("Product_no") String Product_no,
                        @Param("Staff_no_manufacture") String Staff_no_manufacture,@Param("Order_no_details") String Order_no_details);

    List<Manufacture_Result> selectByConstraint_no_date(@Param("Manufacture_no") String Manufacture_no,@Param("Product_no") String Product_no,
                                                @Param("Staff_no_manufacture") String Staff_no_manufacture,@Param("Order_no_details") String Order_no_details);

    int deleteTrue(@Param("Manufacture_no") String Manufacture_no);
    List<Manufacture_Result> selectAll();
    Manufacture_Result selectByOrder_no_details(@Param("Order_no_details") String Order_no_details);
    List<Manufacture_Result> selectByStaff_no_manufacture(@Param("Staff_no_manufacture") String Staff_no_manufacture);
    int exist_or_not(@Param("Manufacture_no") String Manufacture_no);
    String select_Biggest_Product_no();
    Manufacture_Result selectByPrimaryKey(@Param("Manufacture_no") String Manufacture_no);
    int deleteByPrimaryKey(@Param("Manufacture_no") String Manufacture_no);

    int updateByExampleSelective(@Param("record") Manufacture_Result record, @Param("example") Manufacture_ResultExample example);//包括主键在内需要修改，但是内容可以为空
    int updateByExample(@Param("record") Manufacture_Result record, @Param("example") Manufacture_ResultExample example);//连主键也要修改

    int countByExample(Manufacture_ResultExample example);
    int deleteByExample(Manufacture_ResultExample example);

    int insert(Manufacture_Result record);//不可以为空的Staff插入
    int insertSelective(Manufacture_Result record);//部分插入内容，除了主键以外可以为空

    int updateByPrimaryKeySelective(Manufacture_Result record);//部分内容可以空
    int updateByPrimaryKey(Manufacture_Result record);//整体Staff不得为空
    List<Manufacture_Result> selectByExample(Manufacture_ResultExample example);
}
