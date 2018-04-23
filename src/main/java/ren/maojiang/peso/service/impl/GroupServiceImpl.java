package ren.maojiang.peso.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ren.maojiang.peso.mapper.GroupMapper;
import ren.maojiang.peso.model.ConfigGroup;
import ren.maojiang.peso.service.GroupService;

import java.util.List;
import java.util.Map;

/**
 * Created by Leo on 17/3/31.
 */
@Service
public class GroupServiceImpl implements GroupService {

    @Autowired
    private GroupMapper groupMapper;

    @Override
    public List<ConfigGroup> getAllGroup(Map<String,String> map) {
        return groupMapper.getAllGroup(map);
    }

    @Override
    public ConfigGroup getGroupByName(String groupName) {
        return groupMapper.getGroupByName(groupName);
    }
}
