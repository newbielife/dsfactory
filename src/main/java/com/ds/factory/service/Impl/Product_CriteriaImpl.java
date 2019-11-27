package com.ds.factory.service.Impl;

import com.ds.factory.datasource.entities.Product_Criteria;
import com.ds.factory.datasource.mappers.Product_CriteriaMapper;
import com.ds.factory.service.Service.Product_CriteriaService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class Product_CriteriaImpl implements Product_CriteriaService {
    @Resource
    Product_CriteriaMapper product_criteriaMapper;

    @Override
    public List<Product_Criteria> selectByConstraint(String Product_no, String Product_name, String Product_type) {
        return product_criteriaMapper.selectByConstraint(Product_no.trim(),Product_name.trim(),Product_type.trim());
    }

    @Override
    public List<Product_Criteria> getAll() {
        return product_criteriaMapper.selectAll();
    }

    @Override
    public Product_Criteria selectByProduct_no(String Product_no) {
        return product_criteriaMapper.selectByPrimaryKey(Product_no);
    }
}
