package com.ds.factory.datasource.mappers;

import com.ds.factory.datasource.entities.Functions;
import com.ds.factory.dao.Example.FunctionsExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FunctionsMapper {
    List<Functions> selectByConstrain(@Param("Name") String Name,@Param("PNumber") String PNumber);
    int countByExample(FunctionsExample example);
    int deleteByExample(FunctionsExample example);
    int deleteByPrimaryKey(Long id);
    int insert(Functions record);
    int insertSelective(Functions record);
    List<Functions> selectByExample(FunctionsExample example);
    Functions selectByPrimaryKey(Long id);
    int updateByExampleSelective(@Param("record") Functions record, @Param("example") FunctionsExample example);
    int updateByExample(@Param("record") Functions record, @Param("example") FunctionsExample example);
    int updateByPrimaryKeySelective(Functions record);
    int updateByPrimaryKey(Functions record);
}