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
    public List<Raw_Materials_Criteria> selectByConstraint(String Material_no, String Material_name, String Material_type) {
        return raw_materials_criteriaMapper.selectByConstraint(Material_no.trim(),Material_name.trim(),Material_type.trim());
    }

    @Override
    public List<Raw_Materials_Criteria> getAll() {
        return raw_materials_criteriaMapper.selectAll();
    }

    @Override
    public Raw_Materials_Criteria selectByMaterial_no(String Material_no) {
        return raw_materials_criteriaMapper.selectByMaterial_name(Material_no);
    }

    @Override
    public Raw_Materials_Criteria selectByKey(String Material_no) {
        return raw_materials_criteriaMapper.selectByPrimaryKey(Material_no);
    }

    @Override
    public int insert(Raw_Materials_Criteria criteria) {
        int biggest_num=Integer.parseInt(raw_materials_criteriaMapper.select_Biggest_Material_no());
        String biggest="";
        boolean flag=true;
        while(flag)
        {
            biggest_num++;  biggest=""+biggest_num;
            //System.out.println(no_+"");
            switch (biggest.length())
            {//00 0000  0001
                case 1: biggest="0000"+biggest;  break;
                case 2: biggest="000"+biggest;   break;
                case 3: biggest="00"+biggest;    break;
                case 4: biggest="0"+biggest;    break;
                case 5: break;
            }
            if(raw_materials_criteriaMapper.exist_or_not(biggest)==0) flag=false;
        }
        if(biggest.length()>=6)  return 0;
        criteria.setMaterial_no(biggest);

        return raw_materials_criteriaMapper.insertSelective(criteria);
    }

    @Override
    public int delete(String Product_no) {
        return raw_materials_criteriaMapper.deleteByPrimaryKey(Product_no);
    }

    @Override
    public int update(Raw_Materials_Criteria criteria) {
        return raw_materials_criteriaMapper.updateByPrimaryKeySelective(criteria);
    }
}
