package com.ds.factory.datasource.mappers;

import com.ds.factory.dao.Example.Product_CriteriaExample;
import com.ds.factory.datasource.entities.Product_Criteria;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Product_CriteriaMapper {
    int count_sum();
    List<Product_Criteria> selectByConstraint(@Param("Product_no") String Product_no,@Param("Product_name") String Product_name,@Param("Product_type") String Product_type);

    int exist_or_not(@Param("Product_no") String Product_no);
    int exist_or_notByName(@Param("Product_name") String Product_name);
    String select_Biggest_Product_no();
    Product_Criteria selectByPrimaryKey(@Param("Product_no") String Product_no);
    Product_Criteria selectByProduct_name(@Param("Product_name") String Product_name);
    int deleteByPrimaryKey(@Param("Product_no") String Product_no);

    int updateByExampleSelective(@Param("record") Product_Criteria record, @Param("example") Product_CriteriaExample example);//包括主键在内需要修改，但是内容可以为空
    int updateByExample(@Param("record") Product_Criteria record, @Param("example") Product_CriteriaExample example);//连主键也要修改

    int countByExample(Product_CriteriaExample example);
    int deleteByExample(Product_CriteriaExample example);

    int insert(Product_Criteria record);//不可以为空的Staff插入
    int insertSelective(Product_Criteria record);//部分插入内容，除了主键以外可以为空

    int updateByPrimaryKeySelective(Product_Criteria record);//部分内容可以空
    int updateByPrimaryKey(Product_Criteria record);//整体Staff不得为空
    List<Product_Criteria> selectByExample(Product_CriteriaExample example);
    List<Product_Criteria> selectAll();
}
