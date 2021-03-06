package com.ds.factory.datasource.mappers;

import com.ds.factory.datasource.entities.Log;
import com.ds.factory.dao.Example.LogExample;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface LogMapper {
    List<Log> selectBySuccess(@Param("operation") String operation,@Param("clientIP") String clientIP,
                              @Param("begin") Date begin,@Param("end") Date end);
    List<Log> selectByFailed(@Param("operation") String operation,@Param("clientIP") String clientIP,
                              @Param("begin") Date begin,@Param("end") Date end);
    List<Log> selectByAll(@Param("operation") String operation,@Param("clientIP") String clientIP,
                              @Param("begin") Date begin,@Param("end") Date end);

    List<Log> selectBySuccess_noDate(@Param("operation") String operation,@Param("clientIP") String clientIP);
    List<Log> selectByFailed_noDate(@Param("operation") String operation,@Param("clientIP") String clientIP);
    List<Log> selectByAll_noDate(@Param("operation") String operation,@Param("clientIP") String clientIP);



    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DS_log
     *
     * @mbggenerated
     */
    int countByExample(LogExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DS_log
     *
     * @mbggenerated
     */
    int deleteByExample(LogExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DS_log
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DS_log
     *
     * @mbggenerated
     */
    int insert(Log record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DS_log
     *
     * @mbggenerated
     */
    int insertSelective(Log record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DS_log
     *
     * @mbggenerated
     */
    List<Log> selectByExample(LogExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DS_log
     *
     * @mbggenerated
     */
    Log selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DS_log
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") Log record, @Param("example") LogExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DS_log
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") Log record, @Param("example") LogExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DS_log
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Log record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DS_log
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Log record);
}