package com.ds.factory.service.Impl;

import com.ds.factory.datasource.entities.Raw_Materials_Criteria;
import com.ds.factory.datasource.mappers.Raw_Materials_CriteriaMapper;
import com.ds.factory.service.Service.Raw_Materials_CriteriaService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class Raw_Materials_CriteriaImpl implements Raw_Materials_CriteriaService {
    @Resource
    Raw_Materials_CriteriaMapper raw_materials_criteriaMapper;

    @Override
    public List<Raw_Materials_Criteria> getAll() {
        return raw_materials_criteriaMapper.selectAll();
    }

    @Override
    public Raw_Materials_Criteria selectByMaterial_no(String Material_no) {
        return raw_materials_criteriaMapper.selectByMaterial_name(Material_no);
    }
}
