package ren.maojiang.peso.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ren.maojiang.peso.model.Config;
import ren.maojiang.peso.service.ConfigService;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Leo on 17/4/7.
 */
@Controller
@RequestMapping("")
public class ViewController {

    @Autowired
    private ConfigService configService;

    @RequestMapping("/config")
    public String config() {
        return "config";
    }

    @RequestMapping("/config/add")
    public String addConfig() {
        return "config_edit";
    }

    @RequestMapping("/config/edit/{id}")
    public String editConfig(@PathVariable("id")Integer id, Model model){

        Map<String, Object> map = new HashMap<>();
        map.put("id", id);

        Config config = configService.getConfig(map);
        model.addAttribute("config",config);

        return "config_edit";
    }
}
