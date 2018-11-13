package com.leo.service;

import com.leo.bean.Department;
import com.leo.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {
    @Autowired
    DepartmentMapper departmentMapper;

    public List<Department> getDepartments() {
        List<Department> list = departmentMapper.selectByExample(null);
        return list;
    }

}
