package com.ds.factory.datasource.mappers;

import com.ds.factory.dao.Example.Expired_FoodExample;
import com.ds.factory.datasource.entities.Expired_Food;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface Expired_FoodMapper {
    int count_sum();
    int money_sum();
    List<Expired_Food> selectByConstraint(@Param("Food_no") String Food_no,
                                          @Param("Food_type") String Food_type,@Param("Food_name") String Food_name,
                                          @Param("Expired_date") Date Expired_date);

    List<Expired_Food> selectByConstraint_no_date(@Param("Food_no") String Food_no,
                                          @Param("Food_type") String Food_type,@Param("Food_name") String Food_name);


    List<Expired_Food> orderByExpired_date();
    List<Expired_Food> orderByLoss_num();
    List<Expired_Food> orderByLoss_money();
    List<Expired_Food> Expired_Raw_materials();
    List<Expired_Food> Expired_Products();

    int exist_or_not(@Param("Food_no") String Food_no);
    String select_Biggest_Food_no();
    Expired_Food selectByPrimaryKey(@Param("Food_no") String Food_no);
    int deleteByPrimaryKey(@Param("Food_no") String Food_no);

    int updateByExampleSelective(@Param("record") Expired_Food record, @Param("example") Expired_FoodExample example);//包括主键在内需要修改，但是内容可以为空
    int updateByExample(@Param("record") Expired_Food record, @Param("example") Expired_FoodExample example);//连主键也要修改

    int countByExample(Expired_FoodExample example);
    int deleteByExample(Expired_FoodExample example);

    int insert(Expired_Food record);//不可以为空的Staff插入
    int insertSelective(Expired_Food record);//部分插入内容，除了主键以外可以为空

    int updateByPrimaryKeySelective(Expired_Food record);//部分内容可以空
    int updateByPrimaryKey(Expired_Food record);//整体Staff不得为空
    List<Expired_Food> selectByExample(Expired_FoodExample example);
}
