package com.ds.factory.datasource.mappers;


import com.ds.factory.datasource.entities.Product_Popularity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Product_PopularityMapper {
    List<Product_Popularity> selectByConstraint(@Param("Product_no") String Product_no, @Param("Product_name") String Product_name, @Param("Product_type") String Product_type);
    List<Product_Popularity> orderByPopularity();
}
