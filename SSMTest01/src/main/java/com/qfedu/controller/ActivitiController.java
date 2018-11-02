package com.qfedu.controller;

import com.qfedu.service.ActivitiService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("activiti")
public class ActivitiController {

    @Autowired
    private ActivitiService activitiService;

    @RequestMapping("list")
    public String getList(ModelMap modelMap){
        List<Deployment> deployment = activitiService.getDeployment();
        List<ProcessDefinition> processDefine = activitiService.getProcessDefine();
        modelMap.put("deployment",deployment);
        modelMap.put("processDefine",processDefine);

        return  "/bushu/list.jsp";
    }

    @RequestMapping("deploy")
    public String deploy(MultipartFile file,String name){
        if(file.getOriginalFilename().endsWith("zip")){
            try {
                activitiService.deploy(file.getInputStream(),name);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "redirect:/activiti/list";
    }
    //删除流程
    @RequestMapping("delete")
    public void delete(String deploymentid, HttpServletResponse response){
        response.setContentType("text/html;charset=utf-8");

        try {
            activitiService.delete(deploymentid);
            response.getWriter().print("<script>alert('删除成功');location.href='list'</script>");
        }catch (Exception e){
            try {
                response.getWriter().print("<script>alert('删除失败，请稍后再试');location.href='list'</script>");
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }

    @RequestMapping("show")
    public void showPhoto(String deploymentId, String resourceName,
                          HttpServletRequest request,
                          HttpServletResponse response){
        response.setContentType("text/html;charset=utf-8");
        InputStream inputStream = activitiService.showPhoto(deploymentId, resourceName);
        String realPath = request.getRealPath(resourceName);
        String contextPath = request.getContextPath();
        System.out.println(contextPath);
        try {
            FileUtils.copyInputStreamToFile(inputStream,new File(realPath));
            response.getWriter().print("<script>alert('显示图片');location.href='"+contextPath+"/"+resourceName+"'</script>");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
