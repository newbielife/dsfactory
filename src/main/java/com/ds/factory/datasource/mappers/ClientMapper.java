package com.ds.factory.datasource.mappers;
import com.ds.factory.dao.Example.ClientExample;
import com.ds.factory.datasource.entities.Client;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface ClientMapper{
    int exist_or_not(@Param("Client_no") String Client_no);

    int updateByExampleSelective(@Param("record") Client record, @Param("example") ClientExample example);//包括主键在内需要修改，但是内容可以为空
    int updateByExample(@Param("record") Client record, @Param("example") ClientExample example);//连主键也要修改

    int countByExample(ClientExample example);
    int countBy_Name_and_Password(@Param("Client_name") String name, @Param("Password") String password);

    int deleteByExample(ClientExample example);
    int deleteByPrimaryKey(String Staff_no);

    int insert(Client record);//不可以为空的Client插入
    int insertSelective(Client record);//部分插入内容，除了主键以外可以为空

    int updateByPrimaryKeySelective(Client record);//部分内容可以空
    int updateByPrimaryKey(Client record);//整体Client不得为空

    Client selectByPrimaryKey(String Client_no);
    Client selectBy_Name_and_Password(@Param("Client_name") String name, @Param("Password") String password);

    String select_Biggest_Client_no();

    List<Client> selectByExample(ClientExample example);
    List<Client> selectBy_partName_and_Type(@Param("Client_no") String Client_no,@Param("part") String part, @Param("Client_type") String type);
    List<Client> orderBy_Credit();
    List<Client> orderBy_Client_type();
}
