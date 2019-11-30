package com.ds.factory.datasource.mappers;

import com.ds.factory.datasource.entities.Department;

import java.util.List;

public interface DepartmentMapper {
    List<Department> select();
}
