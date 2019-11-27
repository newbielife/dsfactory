package com.ds.factory.datasource.mappers;

import com.ds.factory.datasource.entities.Staff;
import com.ds.factory.datasource.entities.StaffEx;
import com.ds.factory.datasource.vo.TreeNodeEx;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StaffMapperEx {

    List<Staff> selectByConditionUser(
            @Param("userName") String userName,
            @Param("loginName") String loginName,
            @Param("offset") Integer offset,
            @Param("rows") Integer rows);

    Long countsByUser(
            @Param("userName") String userName,
            @Param("loginName") String loginName);

    List<StaffEx> getUserList(Map<String, Object> parameterMap);

    int addUser(StaffEx ue);

    int updateUser(StaffEx ue);

    List<Staff> getUserListByUserNameOrLoginName(@Param("userName") String userName,
                                                 @Param("loginame") String loginame);

    int batDeleteOrUpdateUser(@Param("ids") String ids[], @Param("status") byte status);

    List<TreeNodeEx> getNodeTree();
    List<TreeNodeEx> getNextNodeTree(Map<String, Object> parameterMap);
}