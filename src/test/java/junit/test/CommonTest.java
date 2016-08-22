package junit.test;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;

import com.atguigu.survey.entity.guest.Student;
import com.atguigu.survey.entity.guest.User;
import com.atguigu.survey.utils.DataProcessUtils;

public class CommonTest {

	//@Test
	public void test07() {
		String tableName = DataProcessUtils.generateTableName(0);
		System.out.println(tableName);
		tableName = DataProcessUtils.generateTableName(1);
		System.out.println(tableName);
		tableName = DataProcessUtils.generateTableName(2);
		System.out.println(tableName);
	}

	//@Test
	public void test06() {

		String servletPath = "/guest/survey/update/5/110";
		servletPath = DataProcessUtils.cutTailForServletPath(servletPath);
		System.out.println(servletPath);

	}

	//@Test
	public void test05() {

		String str = DataProcessUtils.convertArrToString(new String[] { "1",
				"2", "3" });
		System.out.println(str);
	}

	//@Test
	public void test04() {

		String[][] strs = new String[4][4];
		strs[0] = new String[5];
		double b = 0.1 * 3;
		System.out.println(b);
	}

	//@Test
	public void test03() {
		String[] strs = { "1 ", "2 ", "3 " };
		System.out.println(strs);
		Class<? extends String[]> class1 = strs.getClass();
		System.out.println(class1);

		List<String> list = Arrays.asList(strs);
		System.out.println(list);

		String str = list.toString();
		String substring = str.substring(1, str.lastIndexOf("]"));
		System.out.println(substring);

	}

	//@Test
	public void test02() throws CloneNotSupportedException {
		Student stu = new Student(1001, "zhangsan", 10);
		Student copy = stu.copy();
		System.out.println(stu.hashCode());
		System.out.println(copy.hashCode());
		System.out.println(stu);
		System.out.println(copy);

	}

	//@Test
	public void test01() {
		Object o1 = null;
		User u1 = (User) o1;
		System.out.println(u1);
	}

}
