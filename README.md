# javaee-ssm-crud
一、Bootstrap网站
https://v3.bootcss.com/getting-started/#template

二、JQuery
（1）多个元素添加点击事件
$("#btn_save_emp").click(）	----如果多个btn_save_emp要添加点击事件，会出现只有第一个有效
方法一、
$(document).on("click","#btn_edit",function () 		----有效
方法二、
用class筛选，而不是用id
$(".check_item").prop("checked",$(this).prop("checked"));

（2）获取tag属性值

（3）全选、全不选逻辑
$(".check_item").click(function () {
    var flag=$(".check_item:checked").length==$(".check_item").length;
    $("#check_all").prop("checked",flag);
});
如果通过class筛选不行的话，改为用$(document).on("click","#btn_edit",function () 筛选

（4）删除多个
<!--删除多个员工-->
$("#emp_delete_all_btn").click(function () {
    var deleteNams="";
    var deleteIds="";
    $.each($(".check_item:checked"),function () {
        deleteNams+=$(this).attr("empName")+",";
        deleteIds+=$(this).attr("empId")+"-";
    })
    var names=deleteNams.substring(0,deleteNams.length-1);
    var ids=deleteIds.substring(0,deleteIds.length-1);
    if(confirm("确定删除【"+names+"】吗？")){
        $.ajax({
            url:"${APP_PATH}/emp/"+ids,
            type:"DELETE",
            success:function (result) {
                if(result.code==0){
                    alert(result.msg);
                }
            }
        })
    }
});

@ResponseBody
@RequestMapping(value = "/emp/{empIds}",method = RequestMethod.DELETE)
public CommonResult deleteEmp(@PathVariable("empIds") String  empIds){

    if(empIds.contains("-")){
        String[] ids=empIds.split("-");
        List<Integer> idList=new ArrayList<>();
        for(String id:ids){
        idList.add(Integer.parseInt(id));
        }
        employeeService.deleteBatch(idList);
    }else {
        employeeService.delete(Integer.parseInt(empIds));
    }
    return CommonResult.success();
}

public void deleteBatch(List<Integer> idList) {
    EmployeeExample employeeExample=new EmployeeExample();
    EmployeeExample.Criteria criteria = employeeExample.createCriteria();
    criteria.andEmpIdIn(idList);
    employeeMapper.deleteByExample(employeeExample);
}

三、Ajax直接发送PUT请求
$.ajax({
    url:"${APP_PATH}/emp/"+$("#btn_edit_save_emp").attr("empId"),
    type:"PUT",
    data:$("#myEditModal form").serialize(),
    success:function (result) {
        if(result.code==0){
            alert("success");
        }
    }
})
web.xml中需要加过滤器
<!-- 用于Ajax能够直接发送PUT请求-->
<filter>
    <filter-name>httpPutFormContentFilter</filter-name>
    <filter-class>org.springframework.web.filter.HttpPutFormContentFilter</filter-class>
</filter>
<filter-mapping>
    <filter-name>httpPutFormContentFilter</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

四、Spring的单元测试--模拟网络请求
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:dispatcherServlet-servlet.xml"})
public class MvcTest {

    //传入SpringMvc的ioc
    @Autowired
    WebApplicationContext context;
    //虚拟mvc请求，获取到处理结果
    MockMvc mockMvc;

    @Before
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        //模拟请求拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
        //请求成功后，请求域中会有pageInfo
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码"+pageInfo.getPageNum());
        System.out.println("总页码"+pageInfo.getPages());
        System.out.println("总记录数"+pageInfo.getTotal());
        int[] nums=pageInfo.getNavigatepageNums();
        for(int i :nums){
            System.out.println(" "+i);
        }
        List<Employee> list = pageInfo.getList();
        for(Employee employee: list){
            System.out.println("ID "+employee.getdId()+" name "+employee.getEmpName());
        }

    }
}