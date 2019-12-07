package com.ds.factory.service.Impl;

import com.ds.factory.datasource.entities.Product_Criteria;
import com.ds.factory.datasource.entities.Unit;
import com.ds.factory.datasource.mappers.Product_CriteriaMapper;
import com.ds.factory.datasource.mappers.UnitMapper;
import com.ds.factory.service.Service.Product_CriteriaService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class Product_CriteriaImpl implements Product_CriteriaService {
    @Resource
    Product_CriteriaMapper product_criteriaMapper;

    @Resource
    UnitMapper unitMapper;

    @Override
    public List<Product_Criteria> selectByConstraint(String Product_no, String Product_name, String Product_type) {
        return product_criteriaMapper.selectByConstraint(Product_no.trim(),Product_name.trim(),Product_type.trim());
    }

    @Override
    public List<Unit> SelectUnit() {
        return unitMapper.selectAll();
    }

    @Override
    public List<Product_Criteria> getAll() {
        return product_criteriaMapper.selectAll();
    }

    @Override
    public Product_Criteria selectByProduct_no(String Product_no) {
        return product_criteriaMapper.selectByPrimaryKey(Product_no);
    }

    @Override
    public int insert(Product_Criteria product_criteria) {
        int biggest_num=Integer.parseInt(product_criteriaMapper.select_Biggest_Product_no());
        String biggest="";
        boolean flag=true;
        while(flag)
        {
            biggest_num++;  biggest=""+biggest_num;
            //System.out.println(no_+"");
            switch (biggest.length())
            {//00 0000  0001
                case 1: biggest="000"+biggest;  break;
                case 2: biggest="00"+biggest;   break;
                case 3: biggest="0"+biggest;    break;
                case 4: break;
            }
            if(product_criteriaMapper.exist_or_not(biggest)==0) flag=false;
        }
        if(biggest.length()>=5)  return 0;
        product_criteria.setProduct_no(biggest);

        return product_criteriaMapper.insertSelective(product_criteria);
    }

    @Override
    public int delete(String Product_no) {
        return product_criteriaMapper.deleteByPrimaryKey(Product_no);
    }

    @Override
    public int update(Product_Criteria product_criteria) {
        return product_criteriaMapper.updateByPrimaryKeySelective(product_criteria);
    }
}
