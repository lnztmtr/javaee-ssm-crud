<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script src="${APP_PATH}/static/js/jquery-1.12.4.min.js" type="text/javascript"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 员工添加Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmpName" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="inputEmpName"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmpEmail" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="inputEmpEmail" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio1" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio2" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="select_depts">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="btn_save_emp">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 员工修改Modal -->
<div class="modal fade" id="myEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmpName" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p type="text" name="empName" class="form-control-static" id="editEmpName"
                               placeholder="empName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmpEmail" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="editEmpEmail" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineEditRadio1" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineEditRadio2" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="edit_select_depts">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="btn_edit_save_emp">编辑</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-warning">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="table_emps">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <th>${emp.empId}</th>
                        <th>${emp.empName}</th>
                        <th>${emp.gender=="M"?"男":"女"}</th>
                        <th>${emp.email}</th>
                        <th>${emp.department.deptName}</th>
                        <th>
                            <button id="btn_edit" class="btn btn-primary btn-sm edit_btn" editEmpId="${emp.empId}">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-warning btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            当前页码${pageInfo.pageNum}，总页数${pageInfo.pages}，总共${pageInfo.total}条记录
        </div>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="${APP_PATH}/emps?pn=1">首页</a>
                    </li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_nums">
                        <c:if test="${page_nums==pageInfo.pageNum}">
                            <li class="active"><a href="#">${page_nums}</a></li>
                        </c:if>
                        <c:if test="${page_nums!=pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/emps?pn=${page_nums}">${page_nums}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li>
                        <a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

</div>
<script type="text/javascript">
    <!--获取部门列表-->
    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
            url: "${APP_PATH}/depts",
            type: "GET",
            success: function (result) {
                $.each(result.data.depts, function () {
                    var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    optionEle.appendTo(ele);
                })
            }
        })
    }

    <!--获取员工信息-->
    function getEmp(empId) {
        $.ajax({
            url: "${APP_PATH}/emp/" + empId,
            type: "GET",
            success: function (result) {
                $("#editEmpName").text(result.data.emp.empName);
                $("#editEmpEmail").val(result.data.emp.email);
                $("#myEditModal input[name=gender]").val([result.data.emp.gender]);
                $("#myEditModal select").val([result.data.emp.dId]);
            }
        })
    }

    <!--输入校验-->
    function validate() {
        var empName = $("#inputEmpName").val();
        var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]+$)/;
        if (!regName.test(empName)) {
            show_validate_msg($("#inputEmpName"), "error", "请输入正确的用户名");
            return false;
        } else {
            show_validate_msg($("#inputEmpName"), "success", "");
        }
        var email = $("#inputEmpEmail").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg($("#inputEmpEmail"), "error", "请输入正确的邮箱");
            return false;
        } else {
            show_validate_msg($("#inputEmpEmail"), "success", "");
        }
        return true;
    }

    function show_validate_msg(element, status, msg) {
        $(element).parent().removeClass("has-success has-error")
        if ("success" == status) {
            $(element).parent().addClass("has-success");
            $(element).next("span").text(msg);
        } else if ("error" == status) {
            $(element).parent().addClass("has-error");
            $(element).next("span").text(msg);
        }
    }

    function toPage(page) {
        $.ajax({
            url: "${APP_PATH}/emps",
            type: "GET",
            data: {"pn": page},
        })
    }

    <!--点击新增弹出模态框-->
    $("#emp_add_modal_btn").click(function () {
        getDepts("#select_depts");
        $('#myModal').modal({
            backdrop: "static"
        })
    })
    <!--插入新员工-->
    $("#btn_save_emp").click(function () {
        if ($(this).attr("name_val") == "error") {
            return;
        }
        if (!validate()) {
            return;
        }
        $.ajax({
            url: "${APP_PATH}/addEmp",
            type: "POST",
            data: $("#myModal form").serialize(),
            success: function (result) {
                //关闭模块框
                $('#myModal').modal('hide');
                <%--<jsp:forward page="${APP_PATH}/emps?pn=9999"/>--%>
            }
        })
    })

    $("#inputEmpName").change(function () {
        var inputName = this.value;
        $.ajax({
            url: "${APP_PATH}/checkEmpName",
            type: "POST",
            data: "empName=" + inputName,
            success: function (result) {
                if (result.code == 0) {
                    $("#btn_save_emp").attr("name_val", "success");
                    show_validate_msg($("#inputEmpName"), "success", "名字可用");
                } else {
                    $("#btn_save_emp").attr("name_val", "error");
                    show_validate_msg($("#inputEmpName"), "error", result.msg);
                }
            }
        })
    })
    <!--点击编辑弹出模态框-->
    $(document).on("click","#btn_edit",function () {
        getDepts("#edit_select_depts");
        var empId = $(this).attr("editEmpId");
        getEmp(empId)
        $('#myEditModal').modal({
            backdrop: "static"
        })
    })

</script>
</body>
</html>
