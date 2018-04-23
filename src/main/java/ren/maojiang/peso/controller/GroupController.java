package ren.maojiang.peso.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ren.maojiang.peso.model.ConfigGroup;
import ren.maojiang.peso.service.GroupService;

import java.util.List;

/**
 * Created by Leo on 17/3/31.
 */
@Controller
@RequestMapping("/group")
public class GroupController {

    @Autowired
    private GroupService groupService;


    @RequestMapping("/list")
    @ResponseBody
    public List<ConfigGroup> getGroupList(){

        return groupService.getAllGroup(null);
    }
}
