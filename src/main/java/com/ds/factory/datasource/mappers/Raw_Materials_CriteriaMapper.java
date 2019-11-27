package com.ds.factory.datasource.mappers;

import com.ds.factory.dao.Example.Raw_Materials_CriteriaExample;
import com.ds.factory.datasource.entities.Raw_Materials_Criteria;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Raw_Materials_CriteriaMapper {

    List<Raw_Materials_Criteria> selectByConstraint(@Param("Material_no")String Material_no,@Param("Material_name")String Material_name,@Param("Material_type")String Material_type);

    int exist_or_not(@Param("Material_no") String Material_no);
    int exist_or_notByName(@Param("Material_name") String Material_name);
    String select_Biggest_Material_no();
    Raw_Materials_Criteria selectByPrimaryKey(@Param("Material_no") String Material_no);
    Raw_Materials_Criteria selectByMaterial_name(@Param("Material_name") String Material_name);
    int deleteByPrimaryKey(@Param("Material_no") String Material_no);

    int updateByExampleSelective(@Param("record") Raw_Materials_Criteria record, @Param("example") Raw_Materials_CriteriaExample example);//包括主键在内需要修改，但是内容可以为空
    int updateByExample(@Param("record") Raw_Materials_Criteria record, @Param("example") Raw_Materials_CriteriaExample example);//连主键也要修改

    int countByExample(Raw_Materials_CriteriaExample example);
    int deleteByExample(Raw_Materials_CriteriaExample example);

    int insert(Raw_Materials_Criteria record);//不可以为空的Staff插入
    int insertSelective(Raw_Materials_Criteria record);//部分插入内容，除了主键以外可以为空

    int updateByPrimaryKeySelective(Raw_Materials_Criteria record);//部分内容可以空
    int updateByPrimaryKey(Raw_Materials_Criteria record);//整体Staff不得为空
    List<Raw_Materials_Criteria> selectByExample(Raw_Materials_CriteriaExample example);
    List<Raw_Materials_Criteria> selectAll();
}
