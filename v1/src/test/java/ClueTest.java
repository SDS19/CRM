import com.crm.utils.Convert;
import com.crm.utils.DateTimeUtil;
import com.crm.workbench.domain.Clue;
import com.crm.workbench.domain.Customer;
import org.junit.Test;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

public class ClueTest {

    @Test
    public void testConvert(){
        Clue clue = new Clue();
        clue.setOwner("Yukai");
        clue.setPhone("12345");
        clue.setCreateTime(DateTimeUtil.getSysTime());
        clue.setCreateBy("Admin");

        Customer c = new Customer();
        try {
            c = (Customer) Convert.o2o(clue,c);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        }
        String createTime = c.getCreateTime();
        String createBy = c.getCreateBy();
        String owner = c.getOwner();
        String phone = c.getPhone();
        System.out.println(owner+" "+phone);
        System.out.println(createBy+" "+createTime);

    }


    @Test
    public void testMethod() throws ClassNotFoundException {
        Class userService = Class.forName("com.crm.settings.service.UserService");
        Method[] methods = userService.getDeclaredMethods();
        for (Method method:methods) {
            System.out.println(Modifier.toString(method.getModifiers()));
            System.out.println(method.getName());
            System.out.println(method.getReturnType().getSimpleName());
            Class[] paramTypes = method.getParameterTypes();

        }

        ;
    }
}
