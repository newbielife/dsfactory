package com.ds.factory.service.Service;

import com.ds.factory.datasource.entities.Raw_Materials_Criteria;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface  Raw_Materials_CriteriaService {

    List<Raw_Materials_Criteria> getAll();
    Raw_Materials_Criteria selectByMaterial_no(String Material_no);

}
