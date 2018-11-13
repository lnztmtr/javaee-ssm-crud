package com.leo.controller;

import com.leo.bean.CommonResult;
import com.leo.bean.Department;
import com.leo.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;

    @ResponseBody
    @RequestMapping("/depts")
    public CommonResult getDepartments() {
        List<Department> list = departmentService.getDepartments();
        return CommonResult.success().addData("depts", list);
    }

}
