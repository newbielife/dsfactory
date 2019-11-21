package com.ds.factory.datasource.mappers;


import com.ds.factory.datasource.entities.Product_Popularity;

import java.util.List;

public interface Product_PopularityMapper {
    List<Product_Popularity> orderByPopularity();
}
