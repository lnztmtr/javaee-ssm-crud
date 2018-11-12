package com.leo.bean;

import java.util.HashMap;
import java.util.Map;

public class CommonResult {
    private static final int SUCCESS_CODE = 0;
    private static final String SUCCESS_MSG = "操作成功";
    private static final int FAIL_CODE = 1;
    private static final String FAIL_MSG = "操作失败";
    private Integer code;
    private String msg;
    private Map<String,Object> data=new HashMap<>();

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    public static CommonResult success(){
        CommonResult commonResult=new CommonResult();
        commonResult.setCode(SUCCESS_CODE);
        commonResult.setMsg(SUCCESS_MSG);
        return commonResult;
    }
    public static CommonResult fail(String reason){
        CommonResult commonResult=new CommonResult();
        commonResult.setCode(FAIL_CODE);
        commonResult.setMsg(reason==null?FAIL_MSG:reason);
        return commonResult;
    }

    public CommonResult addData(String key,Object value){
        this.getData().put(key,value);
        return this;
    }

}
