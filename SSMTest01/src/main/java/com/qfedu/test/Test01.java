package com.qfedu.test;

import cn.com.webxml.ArrayOfString;
import cn.com.webxml.MobileCodeWS;
import cn.com.webxml.MobileCodeWSSoap;
import com.qfedu.domain.*;
import com.qfedu.service.*;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngineConfiguration;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.ProcessDefinition;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

public class Test01 {

    @Test
    public void test01(){
        ClassPathXmlApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("spring_core.xml");
        User_tbService bean = classPathXmlApplicationContext.getBean(User_tbService.class);
//        User_tb user = bean.selectByUsername("user");
//        System.out.println(user);
    }


    @Test
    public void test02(){
        ClassPathXmlApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("spring_core.xml");
        ClassesService bean = classPathXmlApplicationContext.getBean(ClassesService.class);
//        HashMap<String, String> objectObjectHashMap = new HashMap<>();
//        objectObjectHashMap.put("pageNum","0");
//        objectObjectHashMap.put("pageSize","2");
//        objectObjectHashMap.put("classname","矿");
        ClassesPro classesPro = bean.selectById(1);
        System.out.println(classesPro);

    }

    @Test
    public void test03(){
        Integer[]  ckc = {1,2,3,4,5,6};
        System.out.println(ckc);
        List<Integer> integers = Arrays.asList(ckc);
        for(int i : integers){
            System.out.println(i);
        }
//        POIUtil.setPath("C:\\Users\\mac-\\Desktop\\test.xls");
//            POIUtil.createExl();
//        try {
//            POIUtil.createSheet("123");
//           String[] name =  {"1","2","3"};
//            POIUtil.addHead(name);
//
//            POIUtil.grow();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }
    @Test
    public void test07(){
        ClassPathXmlApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("spring_core.xml");
        RoleSerivce bean = classPathXmlApplicationContext.getBean(RoleSerivce.class);

        int i = bean.deleteRoleByRoleid(7);
        System.out.println(i);
    }

    @Test
    public void test08(){
        ClassPathXmlApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("spring_core.xml");
        MenuService bean = classPathXmlApplicationContext.getBean(MenuService.class);
        int[] i  = {24,26,27,28,29};
        bean.deleteMany(i);
    }

    @Test
    public void test09(){
   MobileCodeWS mobileCodeWS = new MobileCodeWS();
	MobileCodeWSSoap port = mobileCodeWS.getPort(MobileCodeWSSoap.class);
		ArrayOfString databaseInfo = port.getDatabaseInfo();
		List<String> string = databaseInfo.getString();
		for(String s : string){
		System.out.println(s);

	}

        HttpSession session = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                .getRequest().getSession();
        System.out.println(session);

    }
@Test
    public void test(){
    ProcessEngineConfiguration config = ProcessEngineConfiguration.createStandaloneProcessEngineConfiguration();
    config.setJdbcUsername("root");
    config.setJdbcPassword("1234");
    config.setJdbcUrl("jdbc:mysql://localhost:3306/books");
    config.setJdbcDriver("com.mysql.jdbc.Driver");
    config.setDatabaseSchemaUpdate("true");
    ProcessEngine engine = config.buildProcessEngine();
    ProcessDefinition processDefinition = engine.getRepositoryService().getProcessDefinition("LeaveBill:1:7512");
    System.out.println(processDefinition.getId()+","+processDefinition.getDeploymentId());
    ProcessDefinitionEntity entity = (ProcessDefinitionEntity) processDefinition;
    ActivityImpl activity = entity.findActivity("_5");
    List<PvmTransition> outgoingTransitions = activity.getOutgoingTransitions();
    for (PvmTransition transition : outgoingTransitions) {
        String name = (String) transition.getProperty("name");
        System.out.println(name);

    }

}

}
