package com.leo.service;

import com.leo.bean.Employee;
import com.leo.bean.EmployeeExample;
import com.leo.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    public boolean checkEmpName(String empName) {
        EmployeeExample employeeExample=new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count=employeeMapper.countByExample(employeeExample);
        return count!=0;
    }

    public Employee getEmp(Integer empId) {
        return  employeeMapper.selectByPrimaryKey(empId);
    }

    public void update(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void delete(Integer empId) {
        employeeMapper.deleteByPrimaryKey(empId);
    }

    public void deleteBatch(List<Integer> idList) {
        EmployeeExample employeeExample=new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpIdIn(idList);
        employeeMapper.deleteByExample(employeeExample);
    }
}
