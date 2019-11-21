package com.ds.factory.dao;

import com.ds.factory.domain.Client;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Mapper     //声明是一个Mapper,与springbootApplication中的@MapperScan二选一写上即可
@Repository
public interface ClientMapper {
    Client searchById(String Client_no);
}