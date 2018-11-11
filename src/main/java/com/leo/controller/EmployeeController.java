package com.leo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.leo.bean.Employee;
import com.leo.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;
    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
                          Model model){

        PageHelper.startPage(pn,5);
        List<Employee> employees=employeeService.getAll();
        PageInfo<Employee> pageInfo=new PageInfo<>(employees,5);
        model.addAttribute("pageInfo",pageInfo);

        return "list";
    }
}
