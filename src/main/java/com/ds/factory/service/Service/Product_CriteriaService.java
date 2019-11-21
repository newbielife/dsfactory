package com.ds.factory.service.Service;

import com.ds.factory.datasource.entities.Product_Criteria;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface Product_CriteriaService {
    List<Product_Criteria> getAll();
    Product_Criteria selectByProduct_no(String Product_no);
}
