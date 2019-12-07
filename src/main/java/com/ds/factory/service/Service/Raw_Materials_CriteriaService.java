package com.ds.factory.service.Service;

import com.ds.factory.datasource.entities.Product_Criteria;
import com.ds.factory.datasource.entities.Raw_Materials_Criteria;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface  Raw_Materials_CriteriaService {
    List<Raw_Materials_Criteria> selectByConstraint(String Material_no,String Material_name,String Material_type);
    List<Raw_Materials_Criteria> getAll();
    Raw_Materials_Criteria selectByMaterial_no(String Material_no);
    Raw_Materials_Criteria selectByKey(String Material_no);

    int insert(Raw_Materials_Criteria product_criteria);
    int delete(String Product_no);
    int update(Raw_Materials_Criteria product_criteria);
}
