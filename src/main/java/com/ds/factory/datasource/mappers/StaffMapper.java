package com.ds.factory.datasource.mappers;


import com.ds.factory.dao.Example.StaffExample;
import com.ds.factory.datasource.entities.Staff;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StaffMapper {
    List<Staff> two_select(@Param("username") String username,@Param("loginame") String loginame);
    int count_sum();


    Staff selectByLoginame(@Param("loginame") String loginame);
    int exist_or_not(@Param("loginame") String loginame);

    List<Staff> selectByDepartment(@Param("Workshop") String Workshop);


    int countByExample(StaffExample example);
    int deleteByExample(StaffExample example);
    int deleteByPrimaryKey(Long id);
    int insert(Staff record);
    int insertSelective(Staff record);
    List<Staff> selectByExample(StaffExample example);
    Staff selectByPrimaryKey(Long id);
    int updateByExampleSelective(@Param("record") Staff record, @Param("example") StaffExample example);
    int updateByExample(@Param("record") Staff record, @Param("example") StaffExample example);
    int updateByPrimaryKeySelective(Staff record);
    int updateByPrimaryKey(Staff record);





    //int updateByExampleSelective(@Param("record") Staff record, @Param("example") StaffExample example);//包括主键在内需要修改，但是内容可以为空
    //int updateByExample(@Param("record") Staff record, @Param("example") StaffExample example);//连主键也要修改

    //int countByExample(StaffExample example);
    //int countBy_Name_and_Password(@Param("Staff_name") String name, @Param("Password") String password);

    //int deleteByExample(StaffExample example);
    int deleteByPrimaryKey(String id);

    //int insert(Staff record);//不可以为空的Staff插入
    //int insertSelective(Staff record);//部分插入内容，除了主键以外可以为空

    //int updateByPrimaryKeySelective(Staff record);//部分内容可以空
    //int updateByPrimaryKey(Staff record);//整体Staff不得为空

    //List<Staff> selectByExample(StaffExample example);
    Staff selectByPrimaryKey(String id);
    Long select_Biggest_Id();
}