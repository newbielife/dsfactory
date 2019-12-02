package com.ds.factory.datasource.mappers;

import com.ds.factory.dao.Example.Export_RecordExample;
import com.ds.factory.datasource.entities.Export_Record;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface Export_RecordMapper {

    int update_end(@Param("Order_no") String Order_no,@Param("Progress") String Progress);
    List<Export_Record> selectByConstraint(@Param("Delivery_date") Date Delivery_date, @Param("Export_no") String Export_no,
                                           @Param("Staff_no") String Staff_no, @Param("Order_no_details") String Order_no_details,
                                            @Param("Target_place") String Target_place, @Param("Source_place") String Source_place);

    List<Export_Record> selectByConstraint_no_date(@Param("Export_no") String Export_no,
                                           @Param("Staff_no") String Staff_no, @Param("Order_no_details") String Order_no_details,
                                           @Param("Target_place") String Target_place, @Param("Source_place") String Source_place);

    int exist_or_not(@Param("Export_no") String Export_no);
    int exist_or_not_by_Order_no_details(@Param("Order_no_details") String Order_no_details);
    String select_Biggest_Export_no();
    Export_Record selectByPrimaryKey(@Param("Export_no") String Export_no);
    Export_Record selectByOrder_no_details(@Param("Order_no_details") String Order_no_details);
    int deleteByPrimaryKey(@Param("Export_no") String Export_no);

    int updateByExampleSelective(@Param("record") Export_Record record, @Param("example") Export_RecordExample example);//包括主键在内需要修改，但是内容可以为空
    int updateByExample(@Param("record") Export_Record record, @Param("example") Export_RecordExample example);//连主键也要修改

    int countByExample(Export_RecordExample example);
    int deleteByExample(Export_RecordExample example);

    int insert(Export_Record record);//不可以为空的Staff插入
    int insertSelective(Export_Record record);//部分插入内容，除了主键以外可以为空

    int updateByPrimaryKeySelective(Export_Record record);//部分内容可以空
    int updateByPrimaryKey(Export_Record record);//整体Staff不得为空
    List<Export_Record> selectByExample(Export_RecordExample example);


    List<Export_Record> selectByOrder_no(String Order_no);
    List<Export_Record> getAll_orderByDelivery_date();
}
