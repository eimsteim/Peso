package ren.maojiang.peso.controller;

import com.google.gson.Gson;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ren.maojiang.peso.common.Pagination;
import ren.maojiang.peso.model.Config;
import ren.maojiang.peso.service.ConfigService;
import ren.maojiang.peso.service.GroupService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

/**
 * Created by Leo on 17/3/12.
 */
@Controller
@RequestMapping(value = "/config")
public class ConfigController {

    @Autowired
    private ConfigService configService;

    @RequestMapping(value = "/list")
    @ResponseBody
    public Pagination list(Pagination<Config> page, HttpServletRequest request){

        String groupName = request.getParameter("groupName");
        String title = request.getParameter("title");
        String env = request.getParameter("env");


        //获取配置组参数
        Map<String,Object> map = new HashMap<>();
        map.put("groupName", groupName);
        map.put("title", title);
        map.put("env", env);

        //查询所有配置文件
        configService.loadConfigList(page, map);

        return page;
    }

    @RequestMapping(value = "/download")
    public void download(HttpServletRequest request,
                    HttpServletResponse response) {

        String groupName = request.getParameter("groupName");
        String env = request.getParameter("env");
        String title = request.getParameter("title");


        Map<String,Object> map = new HashMap<>();
        map.put("groupName", groupName);
        map.put("env", env);
        map.put("title", title);

        Config config = configService.getConfig(map);



        if (StringUtils.isNotEmpty(groupName)) {
            if(StringUtils.isNotEmpty(config.getContent())){

                ByteArrayInputStream in = null;
                OutputStream out = null;
                try {
                    in = new ByteArrayInputStream(config.getContent().getBytes());
                    out = response.getOutputStream();

                    byte[] buffer = new byte[1024];

                    int len = -1;
                    while ((len = in.read(buffer)) != -1) {
                        out.write(buffer, 0, len);
                    }

                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    if (in != null){
                        try {
                            in.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (out != null){
                        try {
                            out.flush();
                            out.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            } else {
                System.out.println("properties not found: " + groupName + "," + env + "," + title);

            }
        }
    }

    @RequestMapping("/save")
    @ResponseBody
    public Map<String,String> save(Config config) {
//        String title = request.getParameter("title");
//        String groupName = request.getParameter("groupName");
//        String content = request.getParameter("content");
//
//        Config config = new Config();

//        config.setTitle(title);
//        config.setContent(content);
        config.setCreateTime(new Date());
        config.setUpdateTime(new Date());
        config.setVer(1);

        configService.save(config);

        Map<String,String> map = new HashMap<>();
        map.put("stat", "success");

        return map;
    }

    @RequestMapping(value = "/get/{id}")
    @ResponseBody
    public Config get(@PathVariable Long id) {

        Map<String, Object> map = new HashMap<>();
        map.put("id", id);

        Config config = configService.getConfig(map);

        return config;
    }

    @RequestMapping(value = "/get/all", produces="application/json")
    @ResponseBody
    public List<Config> all(HttpServletRequest request){

        String groupName = request.getParameter("groupName");
        String env = request.getParameter("env");


        //获取配置组参数
        Map<String,Object> map = new HashMap<>();
        map.put("groupName", groupName);
        map.put("env", env);

        //查询所有配置文件
        return configService.getAllConfig(map);
    }

    @RequestMapping(value = "/del/{id}", produces="application/json")
    @ResponseBody
    public Map<String,String> delete(@PathVariable("id")Long id) {
        Map<String,String> map = new HashMap<>();

        try {
            configService.delete(id);
            map.put("stat", "success");

        } catch (Exception ex) {
            ex.printStackTrace();
            map.put("stat", "error");
        }

        return map;
    }

    @RequestMapping(value = "/test",  produces="application/json")
    @ResponseBody
    public ResponseEntity<List<Config>> test(HttpServletRequest request) throws IOException {

        String groupName = request.getParameter("groupName");
        String env = request.getParameter("env");

        //获取配置组参数
        Map<String,Object> map = new HashMap<>();
        map.put("groupName", groupName);
        map.put("env", env);

        //查询所有配置文件
        List<Config> list = configService.getAllConfig(map);


        HttpHeaders responseHeaders = new HttpHeaders();
//        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
         responseHeaders.add("Content-Type", "application/json; charset=utf-8");

        return new ResponseEntity<List<Config>>(list, responseHeaders, HttpStatus.OK);
    }
}
