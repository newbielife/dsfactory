package com.ds.factory.service.Service;

import com.ds.factory.datasource.entities.Product_Criteria;
import com.ds.factory.datasource.entities.Unit;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface Product_CriteriaService {
    List<Product_Criteria> selectByConstraint(String Product_no,String Product_name,String Product_type);
    List<Unit> SelectUnit();
    List<Product_Criteria> getAll();
    Product_Criteria selectByProduct_no(String Product_no);

    int insert(Product_Criteria product_criteria);
    int delete(String Product_no);
    int update(Product_Criteria product_criteria);
}
