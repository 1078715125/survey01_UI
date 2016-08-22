package junit.test;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.atguigu.survey.component.dao.LogDao;
import com.atguigu.survey.component.dao.StudentDao;
import com.atguigu.survey.component.dao.SurveyDao;
import com.atguigu.survey.component.service.LogService;
import com.atguigu.survey.component.service.StudentService;
import com.atguigu.survey.component.service.SurveyService;
import com.atguigu.survey.component.service.UserService;
import com.atguigu.survey.entity.guest.Student;
import com.atguigu.survey.entity.guest.Survey;
import com.atguigu.survey.entity.guest.User;
import com.atguigu.survey.entity.manager.Log;
import com.atguigu.survey.model.Page;
import com.atguigu.survey.router.RoutingToken;
import com.atguigu.survey.utils.DataProcessUtils;

public class CommonIOCTest {

	private ApplicationContext ioc;

	private StudentDao stuDao;
	private UserService userService;
	private StudentService studentService;
	private SurveyService surveyService;
	private SurveyDao surveyDao;
	private LogDao logDao;
	private LogService logService;

	{
		ioc = new ClassPathXmlApplicationContext("spring-context.xml");
		stuDao = ioc.getBean(StudentDao.class);
		studentService = ioc.getBean(StudentService.class);
		userService = ioc.getBean(UserService.class);
		surveyService = ioc.getBean(SurveyService.class);
		surveyDao = ioc.getBean(SurveyDao.class);
		logDao = ioc.getBean(LogDao.class);
		logService = ioc.getBean(LogService.class);
	}

	//@Test
	public void testgetLogListfromTableName() {
		RoutingToken.setToken(RoutingToken.DATASOURCE_LOG);
		Page<Log> pageLog = logService.getLogListLimitedfromTableName("survey_log_2016_07", "1");
		List<Log> list = pageLog.getList();
		for (Log log : list) {
			System.out.println(log);
		}
	}

	//@Test
	public void testSurveySaveBatch() {

		String sql = "insert into survey_survey (`SURVEY_NAME`,`LOGO_PATH`,  "
				+ "`COMPLETED`,`COMPLETED_TIME`,`USER_ID_FK`) values(?,?,?,?,?) ";
		Object[][] params = new Object[100][5];

		for (int i = 0; i < params.length; i++) {
			Object[] p = params[i];
			p[0] = "survey_" + i;
			p[1] = "res_static/logo.gif";
			p[2] = false;
			p[3] = null;
			p[4] = 1;
		}

		surveyDao.batchUpdate(sql, params);

	}

	//@Test
	public void testSurvey() {
		Page<Survey> page = surveyService.getLimitedUncompletedPage("1", 2, 1);
		List<Survey> list = page.getList();
		for (Survey survey : list) {
			System.out.println(survey);
		}
	}

	//@Test
	public void testUserSave() {

		Integer id = userService.saveEntity(new User(null, "admin", "123456",
				true));
		System.out.println(id);
	}

	//@Test
	public void testStuSave() {

		Integer id = studentService.saveEntity(new Student(null, "aa", 345));
		System.out.println(id);
	}

	//@Test
	public void testGetEntityByHql() {
		String hql = "from Student s where s.stuId = ?";
		Student student = stuDao.getEntityByHql(hql, 1);
		System.out.println(student);
	}

	//@Test
	public void testUpdateByHQL() {
		String hql = "update Student s set s.stuName = ? where s.stuId = ?";
		stuDao.updateByHql(hql, "航三", 1);
	}

	/**
	 * 在service有事务的时候测试有效
	 */
	//@Test
	public void updateEntity() {
		stuDao.updateEntity(new Student(1, "zhangsan", 1));
	}

	//@Test
	public void testSaveEmp() {
		Integer id = stuDao.saveEntity(new Student(null, "喔哈哈123", 1000));
		System.out.println(id);
	}

	//@Test
	public void testGetEntityById() {
		Student entity = stuDao.getEntity(3);
		System.out.println(entity);
	}

	//@Test
	public void testRemove() {
		stuDao.removeEntityById(5);
	}

	//@Test
	public void testBatch() {

		String sql = "INSERT INTO `stus`(`STU_NAME`,`STU_AGE`) VALUES(?,?)";

		Object[][] params = new Object[100][2];

		for (int i = 0; i < 100; i++) {
			params[i][0] = "stu-" + i;
			params[i][1] = i * 10;
		}

		stuDao.batchUpdate(sql, params);

	}

	//@Test
	public void testDataSource() throws SQLException {
		DataSource ds = (DataSource) ioc.getBean("surveyRouterDataSource");
		System.out.println(ds.getConnection());
	}

	//@Test
	public void test00() {
		int[] arr = { 1, 2, 3, 4, 5, 8 };
		int[] index = { 0, 4, 2, 4, 3, 2, 2, 5, 5, 1, 2 };
		String tel = "";
		for (int i : index) {
			tel += arr[i];
		}
		System.out.println(tel);

		String md5 = DataProcessUtils.md5("123456");
		System.out.println(md5);
		md5 = DataProcessUtils.md5("123456");
		System.out.println(md5);
	}
}
