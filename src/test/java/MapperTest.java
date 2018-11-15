import com.leo.bean.Employee;
import com.leo.dao.DepartmentMapper;
import com.leo.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;

    @Test
    public void testCRUD() {
//        System.out.println(departmentMapper);
//        departmentMapper.insertSelective(new Department("开发部"));
//        departmentMapper.insertSelective(new Department("测试部"));
//        employeeMapper.insertSelective(new Employee(null, "leo", "F", "leo@126.com", 1));
//        EmployeeMapper employeeMapper1=sqlSession.getMapper(EmployeeMapper.class);
//        for(int i=0;i<1000;i++){
//            String name=UUID.randomUUID().toString().substring(0,5)+i;
//            employeeMapper1.insertSelective(new Employee(null, name,
//                    "M", name+"@126.com", 1));
//        }
    }
}
